import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // THIS PAGE IS ONLY A DISPLAY OF INFORMATION

  // Fictive input for page test
  final String firstName = "Ingrid";
  final String name = "Rocheteau";
  final String birthDate = "05 Août 2002";
  final String solarSign = "Lion";
  final String chineseSign = "Cheval";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💅 Votre profil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Votre prénom :\n',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: firstName,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Votre nom :\n',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: name,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Votre date de naissance :\n',
                  style: const TextStyle(fontSize: 24, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: birthDate,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Image.asset('ressources/imagesoleil.png', width: 50, height: 50), // icon of the solar sign
                const SizedBox(width: 10),
                Expanded(
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Votre signe solaire :\n',
                        style: const TextStyle(fontSize: 24, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: solarSign,
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Image.asset('ressources/imagechinois.png', width: 50, height: 50), // icon of the chinese sign
                const SizedBox(width: 10),
                Expanded(
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Votre signe chinois :\n',
                        style: const TextStyle(fontSize: 24, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: chineseSign,
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
