import 'package:my_virtual_dices/blocs/bloc.dart';
import 'package:rxdart/rxdart.dart';

class BlocListInt extends Bloc{

  final _streamController = BehaviorSubject<List<int>>();

  Stream<List<int>> get stream => _streamController.stream;

  Sink<List<int>> get sink => _streamController.sink;

  BlocListInt(){
    sink.add([]);
  }

  changeValue(listVals){
    sink.add(listVals);
  }

  resetValues(){
    sink.add([]);
  }

  @override
  dispose() => _streamController.close();

}