import 'package:flutter/material.dart';

class AstralThemePage extends StatefulWidget {
  const AstralThemePage({super.key});

  @override
  State<AstralThemePage> createState() => _AstralThemePageState();
}

class _AstralThemePageState extends State<AstralThemePage> {
  DateTime? _selectedDate;
  String? _resultMessage;

  void _calculate() {
    if (_selectedDate != null) {
      setState(() {
        _resultMessage = 'Votre thème astral pour le ${_selectedDate!.toLocal().toString().split(' ')[0]}';
      });
    } else {
      setState(() {
        _resultMessage = 'Veuillez sélectionner une date de naissance.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thème astral'),
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
            SizedBox(
              height: 270,
              child: CalendarDatePicker(
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
            ),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculer'),
            ),
            const SizedBox(height: 10),
            if (_resultMessage != null)
              Center(
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
}