import 'package:flutter/material.dart';

class MyDescriptionBox extends StatefulWidget {
  const MyDescriptionBox({super.key});

  @override
  State<MyDescriptionBox> createState() => _MyDescriptionBoxState();
}

class _MyDescriptionBoxState extends State<MyDescriptionBox> {
  String? _selectedOrderType = "Rush";
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();

  void _selectOrderType(String? newValue) {
    setState(() {
      _selectedOrderType = newValue;
    });
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 10,
      ),
      child: Column(
        children: [
          // Type of Order
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Type of Order",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DropdownButton<String>(
                value: _selectedOrderType,
                onChanged: _selectOrderType,
                items: <String>['Reserve', 'Rush']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Delivery Date
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Preferred Date",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: _selectDate,
                child: Text(
                  "${_selectedDate.toLocal()}".split(' ')[0],
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Delivery Time
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Preferred Time",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: _selectTime,
                child: Text(
                  _selectedTime.format(context),
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
