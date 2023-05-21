import 'package:flutter/material.dart';
import 'package:my_virtual_dices/blocs/bloc_dice.dart';
import 'package:my_virtual_dices/ui/tiles/dice_display_tile.dart';

class DiceTile extends StatelessWidget {
  final int numberOfFaces;
  final BlocDice blocDice;

  const DiceTile({Key? key, required this.numberOfFaces, required this.blocDice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 80;
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
          child: DiceDisplayTile(
            size: size,
            diceValue: snapshot.data!,
          ),
        );
      }
    );
  }
}