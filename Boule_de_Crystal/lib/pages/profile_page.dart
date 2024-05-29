import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Fictive input for page test
  final String prenom = "Ingrid";
  final String nom = "Rocheteau";
  final String dateDeNaissance = "05 Août 2002";
  final String signeSolaire = "Lion";
  final String signeChinois = "Cheval";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votre profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Votre prénom :\n',
                style: const TextStyle(fontSize: 24, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: prenom,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: 'Votre nom :\n',
                style: const TextStyle(fontSize: 24, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: nom,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                text: 'Votre date de naissance :\n',
                style: const TextStyle(fontSize: 24, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: dateDeNaissance,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Image.asset('ressources/imagesoleil.png', width: 50, height: 50),
                const SizedBox(width: 10),
                RichText(
                  text: TextSpan(
                    text: 'Votre signe solaire :\n',
                    style: const TextStyle(fontSize: 24, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: signeSolaire,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Image.asset('ressources/imagechinois.png', width: 50, height: 50),
                const SizedBox(width: 10),
                RichText(
                  text: TextSpan(
                    text: 'Votre signe chinois :\n',
                    style: const TextStyle(fontSize: 24, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: signeChinois,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                      ),
                    ],
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
