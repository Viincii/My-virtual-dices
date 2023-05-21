
import 'package:flutter/material.dart';
import 'package:dice_icons/dice_icons.dart';

class DiceDisplayTile extends StatelessWidget{

  final int diceValue;
  final double size;
  final Color mainColor;
  final Color subColor;

  const DiceDisplayTile({Key? key, required this.diceValue, required this.size, this.mainColor = Colors.black45, this.subColor = Colors.white}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    const dices = [
      DiceIcons.dice0,
      DiceIcons.dice1,
      DiceIcons.dice2,
      DiceIcons.dice3,
      DiceIcons.dice4,
      DiceIcons.dice5,
      DiceIcons.dice6,
    ];
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Icon(
          dices[diceValue],
          size: size - (size/10),
          color: subColor,
        ),
      ),
    );
  }

}