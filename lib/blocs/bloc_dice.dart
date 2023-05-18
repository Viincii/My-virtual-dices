
import 'dart:math';

import 'package:my_virtual_dices/blocs/bloc.dart';
import 'package:rxdart/rxdart.dart';

class BlocDice extends Bloc {
  final _streamController = BehaviorSubject<int>();

  Stream<int> get stream => _streamController.stream;

  Sink<int> get sink => _streamController.sink;
  final int? numberOfFaces;

  BlocDice({this.numberOfFaces}) {
    sink.add(0);
  }

  rollDice() async{
    int diceNumber = 1 +  Random().nextInt(numberOfFaces!);
    sink.add(diceNumber);
  }

  animateRollDice() async{
    for (int i = 0; i < 20; i++) {
      int diceNumber = 1 +  Random().nextInt(numberOfFaces!);
      sink.add(diceNumber);
      await Future.delayed(const Duration(milliseconds: 80));
    }
    rollDice();
  }
  static rollAllDices(List<BlocDice> blocDices) async{
    for (BlocDice blocDice in blocDices) {
      blocDice.animateRollDice();
    }
  }

  @override
  dispose() => _streamController.close();
}