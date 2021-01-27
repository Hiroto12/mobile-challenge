import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cp/controller/controller.dart';
import 'package:strings/strings.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class PerfilTela extends StatefulWidget {
  String valor;

  PerfilTela({this.valor});

  @override
  _PerfilTela createState() => _PerfilTela();
}

class _PerfilTela extends State<PerfilTela> {

  final blocController = BlocProvider.getBloc<ControllerBloc>();



//  List<String> move = List();
//
////  List<String> evolution = List();
//
//  var imagem, hp, atq, speed, peso, defesa, tipo;
//
//  Future<List<String>> _recuperarPostagens() async {
//    http.Response response =
//        await http.get("https://pokeapi.co/api/v2/pokemon/${widget.valor}");
//    var dadosJson = json.decode(response.body);
//
//    //  print(dadosJson["moves"]);
//
//    List<dynamic> moves = dadosJson["moves"];
//    print(moves);
//
//    imagem = dadosJson["sprites"]["front_default"];
//    hp = dadosJson["stats"][0]['name'];
//    atq = dadosJson["stats"][1]['name'];
//    defesa = dadosJson["stats"][2]['name'];
//    speed = dadosJson["stats"]['5']['name'];
////    tipo = dadosJson["stats"]['5']['name'];
//
//    peso = dadosJson["weight"];
//
//    for (int i = 0; i < moves.length; i++) {
//      move.add(moves[i]["move"]["name"]);
//    }
//
//    //     print("oi");
//    //    for (int i = 0;i < moves.length; i++)
//    //    print(moves[i]["name"]);
//
//    //    for (var post in dadosJson)
//    // {
//    //   Post p = Post(post["body"]);
//    //  postagens.add(p);
//
//    //  }
//
//    return move;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,

          ),
          elevation: 0,
        ),
        body:

        StreamBuilder(
            stream: blocController.caracteris.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                    child: ListView(
                      shrinkWrap: false,
                      children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                              color: Colors.redAccent,
                              child: Row(
                                children: [
                                  Container(
                                      padding:
                                      EdgeInsets.only(
                                          top: 5, left: 24, bottom: 24),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 40,

                                        child:CircleAvatar(
                                          backgroundColor: Colors.white,

                                          radius: 30,
                                          child: ClipOval(
                                            child: new SizedBox(
                                              width: 100.0,
                                              height: 100.0,
                                              child: new Image.network("${snapshot.data[2].url_imagem}"),

                                            ),
                                          ),
                                        ),


//                    child: Image.network(
//                      imagem,
//                      fit: BoxFit.cover, width: 150, height: 150,),
                                      )),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 3, bottom: 30),
                                    child: Text(
                                      " ${capitalize(snapshot.data[1].namePokemon)}",

                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 3, bottom: 20),
                                    child: Text(
                                        " ${capitalize(snapshot.data[0].tipo)}",
                                        style:
                                        TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 3, bottom: 20),
                                    child: Text(
                                        " Peso:${capitalize(snapshot.data[0].peso.toString())}00g",
                                        style:
                                        TextStyle(
                                            fontSize: 10, color: Colors.white)),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 30, 20, 16),
                        child: Text(
                          "Características",
                          style: TextStyle(fontSize: 30, color: Colors.redAccent),

                        ),
                      ),

                      // Colocar mais um Container para colocar os ATRIBUTOS do pokemon
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 16),
                        child: Text(
                          "Evoluções",
                          style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                        ),

                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 16),
                        child: StreamBuilder (
                          stream:  blocController.evolution.stream,
                      builder: (context,snapshot){
                    if (snapshot.hasData ) {
                      return Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.fromLTRB(5, 10, 20, 16),
                              child:Text("${capitalize(snapshot.data[0].evolution1)}")

                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(5, 10, 20, 16),
                              child:Text("${capitalize(snapshot.data[0].evolution2)}")

                          ),
                        ],

                      );

                    }
                    else
                      return Container(
                        child: CircularProgressIndicator(),
                      );
                       }
                        )

                      ),

                      Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 16),
                          child: Text(
                            "Status base",
                            style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                          )),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 16),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10, 20, 10, 16),
                                    child: Text(" ${snapshot.data[1].hp}"),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10, 20, 10, 16),
                                    child: Text("HP", style: TextStyle(color: Colors.red),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 16),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10, 20, 10, 16),
                                    child: Text(" ${snapshot.data[1].def}"),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10, 20, 10, 16),
                                    child: Text("DEF",style: TextStyle(color: Colors.red),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 16),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10, 20, 10, 16),
                                    child: Text(" ${snapshot.data[1].atq}"),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10, 20, 10, 16),
                                    child: Text("Attack",style: TextStyle(color: Colors.red),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 16),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10, 20, 10, 16),
                                    child: Text(" ${snapshot.data[1].speed}"),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10, 20, 10, 16),
                                    child: Text("Speed",style: TextStyle(color: Colors.red),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 10, 16),
                        child: Text(
                          "Habilidades",
                          style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                        ),
                      ),

                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 1000),
                          child : new ListView.builder(
                            shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index)
                              {
                                return ListTile(
                                  leading: Icon(
                                  Icons.arrow_right,
                                    color: Colors.redAccent,
                                  ),
                                  title:new Text(" ${snapshot.data[index].moves}"),
                                );
                              }


                          )

                      ),

                    ],)
                );
              }
              else
                return Container(
                  child: CircularProgressIndicator(),
                );
            })

    );
  }

}
