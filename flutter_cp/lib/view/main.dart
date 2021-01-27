import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cp/controller/controller.dart';

import 'Home.dart';

void main (){
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs: [Bloc((i)=> ControllerBloc())],
        child: MaterialApp (
      title: "Pokedex",
      home: Home(),
    ));
  }
}
