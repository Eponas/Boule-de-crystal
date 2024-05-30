import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/zodiac_sign.dart';

class LoveCompatibilityPage extends StatefulWidget {
  const LoveCompatibilityPage({super.key});

  @override
  State<LoveCompatibilityPage> createState() => _LoveCompatibilityPageState();
}

class _LoveCompatibilityPageState extends State<LoveCompatibilityPage> {
  String? _selectedSign1; // your zodiac sign
  String? _selectedSign2; // the zodiac sign of your future soulmate (maybe ?)
  String? _compatibilityResult; // the result of love compatibility

  final DatabaseHelper _databaseHelper = DatabaseHelper();
  late Future<List<ZodiacSign>> _zodiacSignsFuture;

  @override
  void initState() {
    super.initState();
    _zodiacSignsFuture = _databaseHelper.getZodiacSigns();
  }

  // to calculate the love compatibility between the two signs
  void _calculateCompatibility() {
    if (_selectedSign1 == null || _selectedSign2 == null) { // if the user have forgotten to pick the two signs
      setState(() {
        _compatibilityResult = 'Veuillez faire la sélection correcte des deux signes astrologiques';
      });
      return;
    }

    final selectedSign1 = _zodiacSignsFuture.then((signs) => signs.firstWhere((sign) => sign.libelle == _selectedSign1));
    final selectedSign2 = _zodiacSignsFuture.then((signs) => signs.firstWhere((sign) => sign.libelle == _selectedSign2));

    // calculate the love compatibility
    selectedSign1.then((sign1) {
      selectedSign2.then((sign2) {
        int compatibilityScore = (sign1.id! + sign2.id!) * 4;
        setState(() {
          _compatibilityResult = 'Compatibilité entre ${sign1.libelle} et ${sign2.libelle} :\n$compatibilityScore%';
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💘 Compatibilité amoureuse'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ZodiacSign>>(
        future: _zodiacSignsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erreur de chargement des signes astrologiques'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun signe astrologique trouvé'));
          }

          final zodiacSigns = snapshot.data!;

          return Padding(
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
                  items: zodiacSigns.map<DropdownMenuItem<String>>((ZodiacSign sign) {
                    return DropdownMenuItem<String>(
                      value: sign.libelle,
                      child: Text(sign.libelle),
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
                  items: zodiacSigns.map<DropdownMenuItem<String>>((ZodiacSign sign) {
                    return DropdownMenuItem<String>(
                      value: sign.libelle,
                      child: Text(sign.libelle),
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
          );
        },
      ),
    );
  }
}