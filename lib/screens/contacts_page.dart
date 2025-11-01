import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/avatar_circle.dart';

/// Contacts page showing list of 15+ contacts
class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  // Static contact data (at least 15 entries)
  static const List<Map<String, String>> _contacts = [
    {'name': 'Alice Johnson', 'phone': '+62 812-3456-7890'},
    {'name': 'Bob Williams', 'phone': '+62 813-9876-5432'},
    {'name': 'Charlie Brown', 'phone': '+62 821-1111-2222'},
    {'name': 'Diana Prince', 'phone': '+62 822-3333-4444'},
    {'name': 'Edward Norton', 'phone': '+62 823-5555-6666'},
    {'name': 'Fiona Apple', 'phone': '+62 831-7777-8888'},
    {'name': 'George Martin', 'phone': '+62 832-9999-0000'},
    {'name': 'Hannah Montana', 'phone': '+62 833-1234-5678'},
    {'name': 'Isaac Newton', 'phone': '+62 851-8765-4321'},
    {'name': 'Jessica Jones', 'phone': '+62 852-2468-1357'},
    {'name': 'Kevin Hart', 'phone': '+62 853-1357-2468'},
    {'name': 'Laura Palmer', 'phone': '+62 855-9753-8642'},
    {'name': 'Michael Scott', 'phone': '+62 856-3692-1470'},
    {'name': 'Nina Simone', 'phone': '+62 857-7410-2589'},
    {'name': 'Oscar Wilde', 'phone': '+62 858-9517-5382'},
    {'name': 'Patricia Smith', 'phone': '+62 859-7531-9514'},
    {'name': 'Quincy Jones', 'phone': '+62 877-1593-5748'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search functionality placeholder
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.contacts,
                    color: Theme.of(context).colorScheme.primary,
                    size: 32,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_contacts.length} Contacts',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Swipe to see details',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Contacts list
          Expanded(
            child: ListView.builder(
              itemCount: _contacts.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final contact = _contacts[index];
                return _buildContactItem(context, contact, index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add contact placeholder
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Add contact feature (static data only)'),
            ),
          );
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    Map<String, String> contact,
    int index,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: Hero(
          tag: 'contact_$index',
          child: AvatarCircle(name: contact['name']!, size: 48),
        ),
        title: Text(
          contact['name']!,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              Icon(Icons.phone, size: 12, color: Colors.grey.shade600),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  contact['phone']!,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
        trailing: SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Calling ${contact['name']}')),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.phone_outlined,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Messaging ${contact['name']}')),
                  );
                },
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.message_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
