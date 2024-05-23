import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class ThemeAstralPage extends StatefulWidget {
  const ThemeAstralPage({super.key});

  @override
  State<ThemeAstralPage> createState() => _ThemeAstralPageState();
}

class _ThemeAstralPageState extends State<ThemeAstralPage> {
  List<DateTime?> _selectedDates = [null];

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
              'Sélectionnez votre date de naissance',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16),
            CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
              ),
              value: _selectedDates,
              onValueChanged: (dates) {
                setState(() {
                  _selectedDates = dates;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculer'),
            ),
            if (_selectedDates.isNotEmpty && _selectedDates[0] != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Date de naissance sélectionnée : ${_selectedDates[0]!.toLocal().toString().split(' ')[0]}',
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _calculate() {
    if (_selectedDates.isNotEmpty && _selectedDates[0] != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Votre thème astral pour la date de naissance sélectionnée : ${_selectedDates[0]!.toLocal().toString().split(' ')[0]}',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez sélectionner une date de naissance.'),
        ),
      );
    }
  }
}
