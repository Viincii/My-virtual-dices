import 'package:flutter/material.dart';
import 'package:dice_icons/dice_icons.dart';
import 'package:my_virtual_dices/blocs/bloc_dice.dart';

class DiceTile extends StatelessWidget {
  final int numberOfFaces;
  final BlocDice blocDice;

  const DiceTile({Key? key, required this.numberOfFaces, required this.blocDice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 80;
    const dices = [
      DiceIcons.dice0,
      DiceIcons.dice1,
      DiceIcons.dice2,
      DiceIcons.dice3,
      DiceIcons.dice4,
      DiceIcons.dice5,
      DiceIcons.dice6,
    ];
    return StreamBuilder<int>(
      stream: blocDice.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData){
          return Container();
        }
        return InkWell(
          onTap: () async {
            await blocDice.animateRollDice();
          },
          child: Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
              child: Icon(
                dices[snapshot.data!],
                size: size - (size/10),
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    );
  }
}