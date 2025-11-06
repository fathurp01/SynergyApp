import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/avatar_circle.dart';

/// Contacts page showing list of 15+ contacts
class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  // Static contact data (at least 15 entries)
  static const List<Map<String, String>> _contacts = [
    {'name': 'Budi Bin Belut', 'phone': '0812-3456-7101'},
    {'name': 'Tina Tertawa', 'phone': '0813-7788-2202'},
    {'name': 'Siti Suka Soto', 'phone': '0821-9090-3303'},
    {'name': 'Roni Rambutan', 'phone': '0822-3344-4404'},
    {'name': 'Joko Jomblo', 'phone': '0812-7711-5505'},
    {'name': 'Udin Ulala', 'phone': '0831-6622-6606'},
    {'name': 'Ani Anti Galau', 'phone': '0838-4141-7707'},
    {'name': 'Tono Tertib', 'phone': '0851-5223-8808'},
    {'name': 'Dewi Durian', 'phone': '0852-6420-9909'},
    {'name': 'Bambang Baperan', 'phone': '0819-3535-0010'},
    {'name': 'Darto Daring', 'phone': '0877-9898-1111'},
    {'name': 'Sari Sambal Setan', 'phone': '0881-7744-1212'},
    {'name': 'Ratna Receh', 'phone': '0895-1122-1313'},
    {'name': 'Bagas Bakso Beranak', 'phone': '0896-5544-1414'},
    {'name': 'Mimin Mamam Mie', 'phone': '0897-6677-1515'},
    {'name': 'Gilang Guling', 'phone': '0898-8800-1616'},
    {'name': 'Caca Caper', 'phone': '0899-9922-1717'},
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
