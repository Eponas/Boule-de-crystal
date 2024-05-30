import 'package:flutter/material.dart';

class AstralThemePage extends StatefulWidget {
  const AstralThemePage({Key? key}) : super(key: key);

  @override
  State<AstralThemePage> createState() => _AstralThemePageState();
}

class _AstralThemePageState extends State<AstralThemePage> {
  DateTime? _selectedDate;
  String? _zodiacSign;
  String? _chineseZodiacSign;

  void _calculate() {
    if (_selectedDate != null) {
      setState(() {
        _zodiacSign = _calculateZodiacSign(_selectedDate!);
        _chineseZodiacSign = _calculateChineseZodiacSign(_selectedDate!.year);
      });
    } else {
      setState(() {
        _zodiacSign = null;
        _chineseZodiacSign = null;
      });
    }
  }

  String _calculateZodiacSign(DateTime date) {
    // Calcul du signe astrologique solaire
    final zodiacSigns = [
      'Capricorne', 'Verseau', 'Poissons', 'Bélier',
      'Taureau', 'Gémeaux', 'Cancer', 'Lion',
      'Vierge', 'Balance', 'Scorpion', 'Sagittaire'
    ];
    final zodiacSignDates = [
      DateTime(0, 1, 20), DateTime(0, 2, 19), DateTime(0, 3, 21), DateTime(0, 4, 20),
      DateTime(0, 5, 21), DateTime(0, 6, 21), DateTime(0, 7, 23), DateTime(0, 8, 23),
      DateTime(0, 9, 23), DateTime(0, 10, 23), DateTime(0, 11, 22), DateTime(0, 12, 22)
    ];

    for (var i = 0; i < zodiacSigns.length; i++) {
      if (date.month == zodiacSignDates[i].month &&
          date.day >= zodiacSignDates[i].day) {
        return zodiacSigns[i];
      } else if (date.month == zodiacSignDates[(i + 11) % 12].month &&
          date.day <= zodiacSignDates[(i + 11) % 12].day) {
        return zodiacSigns[(i + 11) % 12];
      }
    }
    return '';
  }

  String _calculateChineseZodiacSign(int year) {
    // Calcul du signe astrologique chinois
    final chineseZodiacSigns = [
      'Rat', 'Bœuf', 'Tigre', 'Lapin',
      'Dragon', 'Serpent', 'Cheval', 'Chèvre',
      'Singe', 'Coq', 'Chien', 'Cochon'
    ];
    return chineseZodiacSigns[(year - 1900) % 12];
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
                    _zodiacSign = null;
                    _chineseZodiacSign = null;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calculer'),
            ),
            const SizedBox(height: 10),
            if (_zodiacSign != null && _chineseZodiacSign != null)
              Center(
                child: Column(
                  children: [
                    Text(
                      'Signe astrologique solaire : $_zodiacSign',
                      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Signe astrologique chinois : $_chineseZodiacSign',
                      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
