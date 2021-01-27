import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cp/controller/controller.dart';
import 'package:flutter_cp/view/Telapesquisa.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


 final blocController = BlocProvider.getBloc<ControllerBloc>();
 TextEditingController texto = TextEditingController();


  String nomePokemon;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

    body : ListView(
      children: <Widget> [
        Container(
        padding: EdgeInsets.fromLTRB(24,80, 24, 150),
      color: Colors.red,


     child: Column (

       children: <Widget>[
         Image.asset("imagens/logo.png"),
         Padding(
             padding:EdgeInsets.only(top:46) ),


         Container(
           width: double.infinity,

           padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
           color: Colors.white,
           child: Column (
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
              Padding(padding: EdgeInsets.only(top:46),
               child: Text("Conheça a Pokédex",
                   style: TextStyle(
                       fontSize:25,
                     fontStyle: FontStyle.normal,
                     fontWeight: FontWeight.w900,
                     color: Colors.black,
                     decoration: TextDecoration.none
                   )),
              ),
               Padding(
                   padding: EdgeInsets.only(top:8, left: 16, right: 16),
                       child: Text(
                         "Utilize a pokédex para encontrar mais informações sobre os seus pokémons",
                         textAlign: TextAlign.justify,
                         style: TextStyle(

                             fontSize:15,
                             fontStyle: FontStyle.normal,
                             fontWeight: FontWeight.normal,
                             color: Colors.blueAccent,
                             decoration: TextDecoration.none,
                           letterSpacing: 0,
                           wordSpacing: 0
                         ),
                       ),

               ),
               Padding(
                 padding: EdgeInsets.only(top:40, left: 16, right: 16, bottom: 20),
                 child: TextField(
                   controller: texto,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     labelText: "Digite o nome do pokémon..."

                   ),
                   style: TextStyle(

                     color: Colors.black
                   ),

//                   onSubmitted: ()=> {
//                     blocController.getPokeInfo(texto);
//                   },

                 ),

               ),
               Padding(
                 padding: EdgeInsets.only(top:0, left: 16, right: 16, bottom: 10),
                 child: RaisedButton(
                   onPressed: ()
                   {

                     blocController.getPokeInfo(texto.text, context);
                   },
                   child: Text("Buscar", style: TextStyle(
                     fontSize: 20,
                     color: Colors.blue,
                   ),),
                 ),

               )

             ],
           ),

         )


       ],

     )
        ) ] )
    );
  }
}

