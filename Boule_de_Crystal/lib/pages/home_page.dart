import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Asynconf",
            style: TextStyle(
                fontSize: 24,
                ),
        textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

}