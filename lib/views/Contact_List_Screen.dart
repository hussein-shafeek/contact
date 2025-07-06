import 'package:contact/components/contact_card.dart';
import 'package:contact/components/contact_model.dart';
import 'package:contact/components/contacts_save.dart';
import 'package:flutter/material.dart';
import '../components/app_layout.dart';
import '../components/routes.dart';
import 'package:lottie/lottie.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<ContactModel> contacts = [];
  @override
  void initState() {
    super.initState();
    contacts = List.from(globalContacts);
  }

  void _deleteContact(int index) {
    setState(() {
      // نحذف من القائمة الظاهرة
      contacts.removeAt(index);
      // نحذف كمان من القائمة العامة
      globalContacts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.redAccent,

            onPressed: () {
              if (contacts.isNotEmpty) {
                _deleteContact(contacts.length - 1);
              }
            },
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          SizedBox(height: 8),

          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.addContactsScreen);
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),

      child: Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: contacts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 5,
          ),
          itemBuilder:
              (context, index) => ContactCard(
                contact: contacts[index],
                onDelete: () => _deleteContact(index),
              ),
        ),
      ),
    );
  }
}
