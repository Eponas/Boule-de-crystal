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

  final Map<String, int> _signsWithIds = {
    'Bélier': 1,
    'Taureau': 2,
    'Gémeaux': 3,
    'Cancer': 4,
    'Lion': 5,
    'Vierge': 6,
    'Balance': 7,
    'Scorpion': 8,
    'Sagittaire': 9,
    'Capricorne': 10,
    'Verseau': 11,
    'Poissons': 12,
  };

  void _calculateCompatibility() {
    if (_selectedSign1 == null || _selectedSign2 == null) {
      setState(() {
        _compatibilityResult = 'Veuillez faire la sélection correcte des deux signes astrologiques';
      });
      return;
    }

    int id1 = _signsWithIds[_selectedSign1]!;
    int id2 = _signsWithIds[_selectedSign2]!;
    int compatibilityScore = (id1 + id2) * 4;
    setState(() {
      _compatibilityResult = 'Compatibilité entre $_selectedSign1 et $_selectedSign2 :\n$compatibilityScore%';
    });
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
              items: _signsWithIds.keys.map<DropdownMenuItem<String>>((String value) {
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
              items: _signsWithIds.keys.map<DropdownMenuItem<String>>((String value) {
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
                child: Column(
                  children: [
                    Text(
                      _compatibilityResult!.contains('Compatibilité')
                          ? _compatibilityResult!.split(':').first
                          : _compatibilityResult!,
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    if (_compatibilityResult!.contains('Compatibilité'))
                      const SizedBox(height: 5),
                    if (_compatibilityResult!.contains('Compatibilité'))
                      Text(
                        _compatibilityResult!.split(':').last,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.red),
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
