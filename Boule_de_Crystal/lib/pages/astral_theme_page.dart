import 'package:flutter/material.dart';

class ThemeAstralPage extends StatefulWidget {
  const ThemeAstralPage({super.key});

  @override
  State<ThemeAstralPage> createState() => _ThemeAstralPageState();
}

class _ThemeAstralPageState extends State<ThemeAstralPage> {
  DateTime? _selectedDate;
  String? _resultMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculer un thème astral'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Entrez votre date de naissance',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16),
            CalendarDatePicker(
              initialDate: _selectedDate ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              onDateChanged: (date) {
                setState(() {
                  _selectedDate = date;
                  _resultMessage = null;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculer'),
            ),
            if (_resultMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  _resultMessage!,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _calculate() {
    if (_selectedDate != null) {
      setState(() {
        _resultMessage = 'Votre thème astral pour la date de naissance sélectionnée : ${_selectedDate!.toLocal().toString().split(' ')[0]}';
      });
    } else {
      setState(() {
        _resultMessage = 'Veuillez sélectionner une date de naissance.';
      });
    }
  }
}