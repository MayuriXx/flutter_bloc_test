import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Interface("Mon premier BLoC"),
    );
  }
}

class Interface extends StatelessWidget {
  final String title;
  CounterBloc counterBloc = CounterBloc();

  Interface(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder(
        stream: counterBloc.stream,
        builder: (context, snapshot) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Vous avez appuyé sur ce bouton :",
                  style: TextStyle(fontSize: 32), textAlign: TextAlign.center,
                ),
                Text("${snapshot.data}", style: TextStyle(fontSize: 32,color: Colors.blueAccent),),
              ],
            ),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {
            counterBloc.incrementCounter();
          }),
    );
  }
}
