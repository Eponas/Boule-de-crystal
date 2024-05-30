import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../database/database_helper.dart';
import '../models/chinese_zodiac_sign.dart';
import '../models/zodiac_sign.dart';


class AstralThemePage extends StatefulWidget {
  const AstralThemePage({super.key});

  @override
  State<AstralThemePage> createState() => _AstralThemePageState();
}

class _AstralThemePageState extends State<AstralThemePage> {
  DateTime? _selectedDate; // selected birth date by the user
  String? _resultMessage; // message to display the result of the calculation
  List<ZodiacSign>? _zodiacSigns; // list of the zodiac signs (solar ones)
  List<ChineseZodiacSign>? _chineseZodiacSigns; // list of the chinese zodiac signs

  @override
  void initState() {
    super.initState();
    _loadSigns();
  }

  // to load the zodiac signs using the database
  Future<void> _loadSigns() async {
    final dbHelper = DatabaseHelper();
    final zodiacSigns = await dbHelper.getZodiacSigns();
    final chineseZodiacSigns = await dbHelper.getChineseZodiacSigns();

    setState(() {
      _zodiacSigns = zodiacSigns;
      _chineseZodiacSigns = chineseZodiacSigns;
    });
  }

  // to get the zodiac sign thanks to the date selected
  String? _getZodiacSign(DateTime date) {
    if (_zodiacSigns == null) return null;

    String formattedDate = DateFormat('MM-dd').format(date);
    for (var sign in _zodiacSigns!) {
      if (formattedDate.compareTo(sign.dateDebut) >= 0 && formattedDate.compareTo(sign.dateFin) <= 0) {
        return sign.libelle;
      } else if (sign.dateDebut.compareTo(sign.dateFin) > 0) {
        if (formattedDate.compareTo(sign.dateDebut) >= 0 || formattedDate.compareTo(sign.dateFin) <= 0) {
          return sign.libelle;
        }
      }
    }
    return null;
  }

  // to get the chinese zodiac sign thanks to the year of birth selected
  String? _getChineseZodiacSign(int year) {
    if (_chineseZodiacSigns == null) return null;

    for (var sign in _chineseZodiacSigns!) {
      if (sign.year == year) {
        return sign.animal;
      }
    }

    return _chineseZodiacSigns![((year - 1980) % 12)].animal;
  }

  // to calculate and display the zodiac signs
  void _calculate() {
    if (_selectedDate != null) {
      String? zodiacSign = _getZodiacSign(_selectedDate!);
      String? chineseZodiacSign = _getChineseZodiacSign(_selectedDate!.year);

      setState(() {
        _resultMessage = 'Signe astrologique solaire : ${zodiacSign ?? 'Inconnu'}\n'
            'Signe astrologique chinois : ${chineseZodiacSign ?? 'Inconnu'}';
      });
    } else { // if a date was not picked by the user
      setState(() {
        _resultMessage = 'Veuillez sélectionner une date de naissance.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🌟 Thème astral'),
        centerTitle: true,
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
              height: 270, // we have to reduce the size of the CalendarDatePicker or else it takes too much place on the screen and the result message cannot be displayed
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