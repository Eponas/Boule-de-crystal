import 'package:boule_de_crystal/database/database_helper.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({
      Key? key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//database
    return Scaffold(
      appBar: AppBar(
        title: Text('✨ Signes du zodiaque'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: DatabaseHelper().getZodiacSigns(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final list = snapshot.data!;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final zodiacSign = list[index];
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
              );
            } else {
              return Text('No data available');
            }
          },
        ),
      ),
    );
  }
}