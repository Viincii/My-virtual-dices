
import 'package:flutter/material.dart';
import 'package:my_virtual_dices/blocs/bloc_dice.dart';
import 'package:my_virtual_dices/ui/tiles/dice_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfFaces = 6;
    BlocDice blocDice = BlocDice(numberOfFaces: numberOfFaces);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Virtual Dices'),
      ),
      body: StreamBuilder<int>(
        stream: blocDice.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DiceTile(diceNumber: snapshot.data!,
                    numberOfFaces: numberOfFaces,
                    blocDice: blocDice),
              ],
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        onPressed: () async {
          await blocDice.animateRollDice();
        },
        child: const Text('All'),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}