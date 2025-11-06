import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '0';
  String _expression = '';
  double? _firstOperand;
  String? _operator;
  bool _shouldResetDisplay = false;

  void _onNumberPressed(String number) {
    setState(() {
      if (_shouldResetDisplay || _display == '0') {
        _display = number;
        _shouldResetDisplay = false;
      } else {
        _display += number;
      }
    });
  }

  void _onOperatorPressed(String operator) {
    if (_display.isEmpty) return;

    setState(() {
      if (_firstOperand != null && _operator != null && !_shouldResetDisplay) {
        _calculate();
      }
      _firstOperand = double.tryParse(_display);
      _operator = operator;
      _expression = '$_display $operator';
      _shouldResetDisplay = true;
    });
  }

  void _calculate() {
    if (_firstOperand == null || _operator == null) return;

    final double? secondOperand = double.tryParse(_display);
    if (secondOperand == null) return;

    double result;
    try {
      switch (_operator) {
        case '+':
          result = _firstOperand! + secondOperand;
          break;
        case '-':
          result = _firstOperand! - secondOperand;
          break;
        case '×':
          result = _firstOperand! * secondOperand;
          break;
        case '÷':
          if (secondOperand == 0) {
            _showError('Cannot divide by zero');
            return;
          }
          result = _firstOperand! / secondOperand;
          break;
        default:
          return;
      }

      setState(() {
        _display = _formatResult(result);
        _expression = '';
        _firstOperand = null;
        _operator = null;
        _shouldResetDisplay = true;
      });
    } catch (e) {
      _showError('Error in calculation');
    }
  }

  void _onSquare() {
    final double? value = double.tryParse(_display);
    if (value == null) return;

    setState(() {
      final result = value * value;
      _display = _formatResult(result);
      _expression = '$value²';
      _shouldResetDisplay = true;
    });
  }

  void _onSquareRoot() {
    final double? value = double.tryParse(_display);
    if (value == null) return;

    if (value < 0) {
      _showError('Cannot calculate square root of negative number');
      return;
    }

    setState(() {
      final result = sqrt(value);
      _display = _formatResult(result);
      _expression = '√$value';
      _shouldResetDisplay = true;
    });
  }

  void _onClear() {
    setState(() {
      _display = '0';
      _expression = '';
      _firstOperand = null;
      _operator = null;
      _shouldResetDisplay = false;
    });
  }

  void _onDecimal() {
    if (!_display.contains('.')) {
      setState(() {
        _display += '.';
      });
    }
  }

  void _onBackspace() {
    setState(() {
      if (_display.length > 1) {
        _display = _display.substring(0, _display.length - 1);
      } else {
        _display = '0';
      }
    });
  }

  String _formatResult(double result) {
    if (result == result.toInt()) {
      return result.toInt().toString();
    }
    return result.toStringAsFixed(2);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
      ),
    );
    _onClear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // === Display Area ===
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (_expression.isNotEmpty)
                    Text(
                      _expression,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  const SizedBox(height: 8),
                  Text(
                    _display,
                    style: GoogleFonts.poppins(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),

          // === Keypad ===
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('C', onPressed: _onClear, isSpecial: true),
                        _buildButton(
                          '⌫',
                          onPressed: _onBackspace,
                          isSpecial: true,
                        ),
                        _buildButton(
                          'x²',
                          onPressed: _onSquare,
                          isOperator: true,
                        ),
                        _buildButton(
                          '√',
                          onPressed: _onSquareRoot,
                          isOperator: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton(
                          '7',
                          onPressed: () => _onNumberPressed('7'),
                        ),
                        _buildButton(
                          '8',
                          onPressed: () => _onNumberPressed('8'),
                        ),
                        _buildButton(
                          '9',
                          onPressed: () => _onNumberPressed('9'),
                        ),
                        _buildButton(
                          '÷',
                          onPressed: () => _onOperatorPressed('÷'),
                          isOperator: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton(
                          '4',
                          onPressed: () => _onNumberPressed('4'),
                        ),
                        _buildButton(
                          '5',
                          onPressed: () => _onNumberPressed('5'),
                        ),
                        _buildButton(
                          '6',
                          onPressed: () => _onNumberPressed('6'),
                        ),
                        _buildButton(
                          '×',
                          onPressed: () => _onOperatorPressed('×'),
                          isOperator: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton(
                          '1',
                          onPressed: () => _onNumberPressed('1'),
                        ),
                        _buildButton(
                          '2',
                          onPressed: () => _onNumberPressed('2'),
                        ),
                        _buildButton(
                          '3',
                          onPressed: () => _onNumberPressed('3'),
                        ),
                        _buildButton(
                          '-',
                          onPressed: () => _onOperatorPressed('-'),
                          isOperator: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton(
                          '0',
                          onPressed: () => _onNumberPressed('0'),
                        ),
                        _buildButton('.', onPressed: _onDecimal),
                        _buildButton(
                          '=',
                          onPressed: _calculate,
                          isEquals: true,
                        ),
                        _buildButton(
                          '+',
                          onPressed: () => _onOperatorPressed('+'),
                          isOperator: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    String text, {
    required VoidCallback onPressed,
    bool isOperator = false,
    bool isEquals = false,
    bool isSpecial = false,
  }) {
    Color backgroundColor;
    Color textColor;

    if (isEquals) {
      backgroundColor = Theme.of(context).colorScheme.primary;
      textColor = Colors.white;
    } else if (isOperator) {
      backgroundColor = Theme.of(
        context,
      ).colorScheme.secondary.withOpacity(0.1);
      textColor = Theme.of(context).colorScheme.secondary;
    } else if (isSpecial) {
      backgroundColor = Theme.of(context).colorScheme.tertiary.withOpacity(0.1);
      textColor = Theme.of(context).colorScheme.tertiary;
    } else {
      backgroundColor = Colors.grey.shade100;
      textColor = Colors.black87;
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: AppButton(
          text: text,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          textColor: textColor,
        ),
      ),
    );
  }
}
