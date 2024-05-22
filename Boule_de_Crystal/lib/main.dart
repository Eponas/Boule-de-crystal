import 'package:boule_de_crystal/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boule de Crystal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Boule de Crystal'),
          ),
          body: const HomePage(),
          bottomNavigationBar: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                height: constraints.maxHeight * 0.17, // 17% of screen height
                child: BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: SizedBox(
                        height: constraints.maxHeight * 0.17 * 0.54, // 54% of navbar height
                        child: Image.asset(
                            'ressources/image1.png', fit: BoxFit.fill, alignment: Alignment.bottomCenter),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: SizedBox(
                        height: constraints.maxHeight * 0.17 * 0.54, // 54% of navbar height
                        child: Image.asset(
                            'ressources/image2.png', fit: BoxFit.fill, alignment: Alignment.bottomCenter),
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: SizedBox(
                        height: constraints.maxHeight * 0.17 * 0.54, // 54% of navbar height
                        child: Image.asset(
                            'ressources/image3.png', fit: BoxFit.fill, alignment: Alignment.bottomCenter),
                      ),
                      label: '',
                    ),
                  ],
                ),
              );
            },
          )
      ),
    );
  }
}