import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../constants/app_colors.dart';
import '../widgets/contact_card.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/contact_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> contacts = [];

  void _showAddContactBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.modalBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return ContactForm(
          onSave: (contact) {
            setState(() => contacts.add(contact));
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _deleteLastContact() {
    setState(() {
      if (contacts.isNotEmpty) {
        contacts.removeLast();
      }
    });
  }

  void _deleteContact(int index) {
    setState(() => contacts.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/app_bar.png',
          alignment: Alignment.topLeft,
          height: 39,
          width: 120,
        ),
        backgroundColor: AppColors.appBarAndBgColor,
      ),
      backgroundColor: AppColors.appBarAndBgColor,
      body: contacts.isEmpty ? const EmptyStateWidget() : _buildContactsGrid(),
      floatingActionButton: _buildFloatingActionButtons(),
    );
  }

  Widget _buildContactsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ContactCard(
          contact: contacts[index],
          onDelete: () => _deleteContact(index),
        );
      },
    );
  }

  Widget _buildFloatingActionButtons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (contacts.isNotEmpty)
          FloatingActionButton(
            onPressed: _deleteLastContact,
            backgroundColor: Colors.redAccent,
            heroTag: 'delete',
            child: const Icon(Icons.delete, color: Colors.white),
          ),
        const SizedBox(height: 10),
        if (contacts.length < 6)
          FloatingActionButton(
            onPressed: _showAddContactBottomSheet,
            backgroundColor: AppColors.borderColor,
            heroTag: 'add',
            child: const Icon(Icons.add, color: AppColors.buttonTextColor),
          ),
      ],
    );
  }
}
