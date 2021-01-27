import 'dart:convert';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cp/controller/controller.dart';
import 'package:flutter_cp/model/objetoPesquisas.dart';
import 'package:flutter_cp/view/Perfiltela.dart';
import 'package:http/http.dart' as http;

import 'package:strings/strings.dart';

class TelaBusca extends StatefulWidget {
  String valor;

  TelaBusca({this.valor});

  @override
  _TelaBuscaState createState() => _TelaBuscaState();
}

class _TelaBuscaState extends State<TelaBusca> {
  final blocController = BlocProvider.getBloc<ControllerBloc>();

//  String nomePokemon, _resultado;
//
//  _goPokemon(String nomePokemon)
//  {
//
//    setState(() {
//      _resultado = nomePokemon;
//    });
//
//    Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilTela(valor:_resultado)));
//
//  }
//
//  List<String> postagens = List();
//
//  List<String> move = List();
//  List<String> evolution = List();
//
//
//
//  var imagem, hp, atq,speed,peso, defesa;
//
//
//  Future<List<String>>_recuperarPostagens() async
//  {
//      http.Response response = await http.get("https://pokeapi.co/api/v2/pokemon/${widget.valor}");
//      var dadosJson = json.decode (response.body);
//
//       print(dadosJson["moves"]);
//
//      List<dynamic>moves = dadosJson["types"];
//      print(moves);
//      print(moves[0]["type"]["name"]);
//
//
//     imagem = dadosJson["sprites"]["front_default"];
////      hp = dadosJson["states"]['0']['name'];
////      atq = dadosJson["states"]['1']['name'];
////      defesa = dadosJson["states"]['2']['name'];
////      speed = dadosJson["states"]['5']['name'];
//
//      peso = dadosJson["weight"];
//
//
//
//     for (int i = 0; i<moves.length; i++)
//      {
//        postagens.add(moves[i]["type"]["name"]);
//
//      }
//
//
//
// //     print("oi");
// //    for (int i = 0;i < moves.length; i++)
//   //    print(moves[i]["name"]);
//
//  //    for (var post in dadosJson)
//     // {
//     //   Post p = Post(post["body"]);
//       //  postagens.add(p);
//
//   //  }
//
//
//     return postagens;
//
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Image.asset("imagens/Vector.png"),
          backgroundColor: Colors.white,
          title: Text(
            "Resultado da Pesquisa",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          child: StreamBuilder(
            stream: blocController.pesquisa.stream,
            builder: (context,snapshot){
              if (snapshot.hasData )

                {

                 return  ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index)
                    {
                      return ListTile(
                        title:Text("Name: ${snapshot.data[index].namePokemon}"),
                        subtitle: Text("Tipo: ${capitalize(snapshot.data[index].tipo)}"),
                        leading: CircleAvatar(


                          backgroundColor: Colors.redAccent,
                          radius: 30,
                          child: ClipOval(
                            child: new SizedBox(
                              width: 100.0,
                              height: 100.0,

                              child: new Image.network("${snapshot.data[index].url_imagem}",),
                            ),
                          ),
                        ),
                        onTap: ()
                        {

                   //       blocController.getPoke("${snapshot.data[index].namePokemon}", context);
                          blocController.Tela(context);
                        },
                      );
                    },
                  );
                }
              else
                return Container(
                  child: CircularProgressIndicator(),
                );
            },
          ),
        ));
  }
}
