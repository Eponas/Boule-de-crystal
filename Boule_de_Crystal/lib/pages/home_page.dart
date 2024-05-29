import 'package:boule_de_crystal/database/database_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
