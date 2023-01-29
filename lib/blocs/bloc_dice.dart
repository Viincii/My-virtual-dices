
import 'dart:math';

import 'package:my_virtual_dices/blocs/bloc.dart';
import 'package:rxdart/rxdart.dart';

class BlocDice extends Bloc {
  final _streamController = BehaviorSubject<int>();

  Stream<int> get stream => _streamController.stream;

  Sink<int> get sink => _streamController.sink;
  final int? numberOfFaces;

  BlocDice({this.numberOfFaces}) {
    sink.add(6);
  }

  rollDice() async{
    int diceNumber = 1 +  Random().nextInt(numberOfFaces!);
    sink.add(diceNumber);
  }

  @override
  dispose() => _streamController.close();
}