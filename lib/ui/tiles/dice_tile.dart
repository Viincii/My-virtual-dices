
import 'package:flutter/material.dart';

class DiceTile extends StatelessWidget {
  final int diceNumber;
  final int numberOfFaces;

  const DiceTile({Key? key, required this.diceNumber, required this.numberOfFaces})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
      ),
      child: Center(
        child: Text(
          diceNumber.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),),
      ),
    );
  }
}