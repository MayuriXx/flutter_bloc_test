import 'dart:async';

import 'package:flutter_bloc_test/bloc/bloc.dart';

class CounterBloc extends Bloc {

  int counter = 0;
  //StreamController
  final _streamController = StreamController<int>();

  CounterBloc(){
    sink.add(counter);
  }
  //Entrées
  Sink<int> get sink => _streamController.sink;

  //Sorties
  Stream<int> get stream => _streamController.stream;

  //Logique
  incrementCounter(){
    counter += 1;
    sink.add(counter);
  }

  //Fermeture du bloc
  @override
  dispose() => _streamController.close();
}