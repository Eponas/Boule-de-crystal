import 'package:flutter/material.dart';

class LoveCompatibilityPage extends StatefulWidget {
  const LoveCompatibilityPage({super.key});

  @override
  State<LoveCompatibilityPage> createState() => _LoveCompatibilityPageState();
}

class _LoveCompatibilityPageState extends State<LoveCompatibilityPage> {
  String? _selectedSign1;
  String? _selectedSign2;
  String? _compatibilityResult;

  final List<String> _signs = [
    'Bélier',
    'Taureau',
    'Gémeaux',
    'Cancer',
    'Lion',
    'Vierge',
    'Balance',
    'Scorpion',
    'Sagittaire',
    'Capricorne',
    'Verseau',
    'Poissons',
  ];

  void _calculateCompatibility() {
    if (_selectedSign1 != null && _selectedSign2 != null) {
      setState(() {
        _compatibilityResult = 'Compatibilité entre $_selectedSign1 et $_selectedSign2';
      });
    } else {
      setState(() {
        _compatibilityResult = 'Veuillez faire la sélection correcte des deux signes astrologiques';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compatibilité amoureuse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Entrez votre signe astrologique'),
            DropdownButton<String>(
              value: _selectedSign1,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSign1 = newValue;
                });
              },
              items: _signs.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Entrez son signe astrologique'),
            DropdownButton<String>(
              value: _selectedSign2,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSign2 = newValue;
                });
              },
              items: _signs.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _calculateCompatibility,
                child: const Text('Calculer'),
              ),
            ),
            const SizedBox(height: 20),
            if (_compatibilityResult != null)
              Center(
                child: Text(
                  _compatibilityResult!,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
