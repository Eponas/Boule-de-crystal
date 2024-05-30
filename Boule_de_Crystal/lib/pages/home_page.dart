import 'package:boule_de_crystal/database/database_helper.dart';
import 'package:flutter/material.dart';
// Mock DB
import '../models/mock/mockZodiac.dart';



class HomePage extends StatelessWidget {


  final List<ZodiacSign> zodiacSigns;

  HomePage({required this.zodiacSigns});

  @override
  Widget build(BuildContext context) {
/* database
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: DatabaseHelper().getZodiacSigns(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final list = snapshot.data!;
                return Column(
                  children: [
                    for(final item in list)
                      Text(item.libelle)
                    
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
        */
// homepage
        
    return Scaffold(
      appBar: AppBar(
        title: Text('Zodiac Signs'),
      ),
      body: ListView.builder(
        itemCount: zodiacSigns.length,
        itemBuilder: (context, index) {
          final zodiacSign = zodiacSigns[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    zodiacSign.libelle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Du: ${zodiacSign.dateDebut} au ${zodiacSign.dateFin}'),
                  SizedBox(height: 8),
                  Text(zodiacSign.description),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
