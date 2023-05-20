
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
    return diceNumber;
  }

  animateRollDice() async{
    for (int i = 0; i < 20; i++) {
      int diceNumber = 1 +  Random().nextInt(numberOfFaces!);
      sink.add(diceNumber);
      await Future.delayed(const Duration(milliseconds: 80));
    }
    return await rollDice();
  }
  static rollAllDices(List<BlocDice> blocDices) async{
    List<int> listResults = [];
    for (BlocDice blocDice in blocDices) {
      var res = await  blocDice.animateRollDice();
      listResults.add(res);
    }
    return listResults;
  }

  @override
  dispose() => _streamController.close();
}