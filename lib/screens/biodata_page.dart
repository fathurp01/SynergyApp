import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/glass_card.dart';

/// Biodata page with View/Edit mode toggle
class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  // Edit mode state
  bool _isEditMode = false;

  // Form controllers
  final _nameController = TextEditingController(
    text: 'Fathurrahman Pratama Putra',
  );
  final _hobiController = TextEditingController(
    text: 'Music, Traveling, Reading & Watching Movie',
  );

  String _selectedJurusan = 'Informatika';
  String _selectedGender = 'Laki-laki';
  DateTime _selectedDate = DateTime(2005, 1, 30);

  final List<String> _jurusanList = [
    'Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Teknik Sipil',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _hobiController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    if (!_isEditMode) return; // Only allow in edit mode

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2010),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Biodata',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // Toggle Edit/View Mode Button
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: _toggleEditMode,
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: animation,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: Icon(
                  _isEditMode ? Icons.visibility : Icons.edit,
                  key: ValueKey(_isEditMode),
                  color: _isEditMode
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
              tooltip: _isEditMode ? 'View Mode' : 'Edit Mode',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Photo
            Hero(
              tag: 'profile',
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 24),

            // Mode Indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: _isEditMode
                    ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                    : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _isEditMode
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _isEditMode ? Icons.edit : Icons.visibility,
                    size: 16,
                    color: _isEditMode
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _isEditMode ? 'Edit Mode' : 'View Mode',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: _isEditMode
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Info Card
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informasi Pribadi',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Name Field
                  _isEditMode
                      ? TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Nama Lengkap',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        )
                      : _buildInfoRow(
                          icon: Icons.person_outline,
                          label: 'Nama Lengkap',
                          value: _nameController.text,
                        ),
                  const SizedBox(height: 16),

                  // Jurusan Field
                  _isEditMode
                      ? DropdownButtonFormField<String>(
                          value: _selectedJurusan,
                          decoration: const InputDecoration(
                            labelText: 'Jurusan',
                            prefixIcon: Icon(Icons.school_outlined),
                          ),
                          items: _jurusanList.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedJurusan = newValue!;
                            });
                          },
                        )
                      : _buildInfoRow(
                          icon: Icons.school_outlined,
                          label: 'Jurusan',
                          value: _selectedJurusan,
                        ),
                  const SizedBox(height: 16),

                  // Gender Field
                  if (_isEditMode) ...[
                    Text(
                      'Jenis Kelamin',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Laki-laki'),
                            value: 'Laki-laki',
                            groupValue: _selectedGender,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Perempuan'),
                            value: 'Perempuan',
                            groupValue: _selectedGender,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ] else
                    _buildInfoRow(
                      icon: _selectedGender == 'Laki-laki'
                          ? Icons.male
                          : Icons.female,
                      label: 'Jenis Kelamin',
                      value: _selectedGender,
                    ),
                  const SizedBox(height: 16),

                  // Date Field
                  _isEditMode
                      ? InkWell(
                          onTap: () => _selectDate(context),
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Tanggal Lahir',
                              prefixIcon: Icon(Icons.calendar_today_outlined),
                            ),
                            child: Text(
                              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      : _buildInfoRow(
                          icon: Icons.calendar_today_outlined,
                          label: 'Tanggal Lahir',
                          value:
                              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                        ),
                  const SizedBox(height: 16),

                  // Hobi Field
                  _isEditMode
                      ? TextField(
                          controller: _hobiController,
                          decoration: const InputDecoration(
                            labelText: 'Hobi',
                            prefixIcon: Icon(Icons.favorite_outline),
                          ),
                          maxLines: 2,
                        )
                      : _buildInfoRow(
                          icon: Icons.favorite_outline,
                          label: 'Hobi',
                          value: _hobiController.text,
                          isLast: true,
                        ),
                ],
              ),
            ),

            if (_isEditMode) ...[
              const SizedBox(height: 16),
              // Save Button (visual only, data is updated in real-time)
              ElevatedButton.icon(
                onPressed: () {
                  _toggleEditMode();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Perubahan disimpan!'),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(Icons.check),
                label: const Text('Simpan Perubahan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
