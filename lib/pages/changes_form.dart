import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/chat/request_change_service.dart';
import '../services/auth/auth_service.dart';

class ChangesFormPage extends StatefulWidget {
  final String receiverID;
  final String orderId;

  const ChangesFormPage({
    super.key,
    required this.receiverID,
    required this.orderId,
  });

  @override
  State<ChangesFormPage> createState() => _ChangesFormPageState();
}

class _ChangesFormPageState extends State<ChangesFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _additionalNotesController =
      TextEditingController();
  final RequestChangeService _requestChangeService = RequestChangeService();
  final AuthService _authService = AuthService();

  // Options for the dropdown
  final List<String> _changeOptions = [
    'Customer Name',
    'Order Date',
    'Time',
    'Address',
    'Mode of Delivery',
    'Contact Number', // Added Contact Number as an option
  ];

  // Selected value for the dropdown
  String? _selectedChangeOption;
  String _labelText = 'Changes';
  String _hintText = 'Put the request changes';

  @override
  void dispose() {
    _additionalNotesController.dispose();
    super.dispose();
  }

  // Function to handle form submission
  void _submitChanges() async {
    if (_formKey.currentState?.validate() ?? false) {
      final selectedChangeOption = _selectedChangeOption;
      final additionalNotes = _additionalNotesController.text.trim();

      if (selectedChangeOption != null && additionalNotes.isNotEmpty) {
        String? currentUserId = await _authService.getCurrentUserId();
        if (currentUserId != null) {
          final message =
              "Request Changes:\n\n$selectedChangeOption\n---\n$additionalNotes";

          await _requestChangeService.sendMessage(
            widget.receiverID,
            message,
            currentUserId,
            widget.orderId,
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Changes submitted successfully!')),
          );

          Navigator.pop(context);
        }
      }
    }
  }

  // Function to update label and hint text based on selected option
  void _updateHintText(String? newValue) {
    setState(() {
      _selectedChangeOption = newValue;
      switch (newValue) {
        case 'Customer Name':
          _labelText = 'Full Name';
          _hintText = 'Enter first name and last name';
          break;
        case 'Order Date':
          _labelText = 'Order Date';
          _hintText = 'Enter date in MM-DD-YYYY format';
          break;
        case 'Time':
          _labelText = 'Time';
          _hintText = 'Enter time in HH:MM AM/PM format';
          break;
        case 'Address':
          _labelText = 'Address';
          _hintText = 'Enter full address';
          break;
        case 'Mode of Delivery':
          _labelText = 'Mode of Delivery';
          _hintText = 'Specify delivery or pickup';
          break;
        case 'Contact Number':
          _labelText = 'Contact Number';
          _hintText = 'Enter a valid contact number';
          break;
        default:
          _labelText = 'Changes';
          _hintText = 'Put the request changes';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Changes'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Select the type of change you want to request:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Dropdown field for selecting the change type
              DropdownButtonFormField<String>(
                value: _selectedChangeOption,
                decoration: const InputDecoration(
                  labelText: 'Change Type',
                  border: OutlineInputBorder(),
                ),
                items: _changeOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  _updateHintText(newValue);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a change type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Additional notes field
              TextFormField(
                controller: _additionalNotesController,
                decoration: InputDecoration(
                  labelText: _labelText,
                  hintText: _hintText,
                  border: const OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),

              // Submit button
              ElevatedButton(
                onPressed: _submitChanges,
                child: const Text('Submit Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
