
import 'package:my_virtual_dices/blocs/bloc.dart';
import 'package:rxdart/rxdart.dart';

class BlocInt extends Bloc{

  final _streamController = BehaviorSubject<int>();

  Stream<int> get stream => _streamController.stream;

  Sink<int> get sink => _streamController.sink;
  final int startValue;

  BlocInt(this.startValue){
    sink.add(startValue);
  }

  changeValue(value){
    sink.add(value);
  }

  @override
  dispose() => _streamController.close();

}