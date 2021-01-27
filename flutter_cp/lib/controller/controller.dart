
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cp/model/objetoEvolucao.dart';
import 'package:flutter_cp/model/objetoPesquisas.dart';
import 'package:flutter_cp/model/pokeapi.dart';
import 'package:flutter_cp/model/objetoPerfil.dart';
import 'package:flutter_cp/view/Perfiltela.dart';

import 'package:flutter_cp/view/Telapesquisa.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ControllerBloc extends BlocBase
{

  final pesquisa = BehaviorSubject<List<ObjetoPesquisa>>();
  final moves = BehaviorSubject<List<String>>();

  final caracteris = BehaviorSubject<List<ObjetoPerfil>>();

  final evolution = BehaviorSubject<List<ObjetoEvolucao>>();

  final PokeApi pokeApi = PokeApi();




  get_pesquisa(dados, nomePokemon)
  {


    List<ObjetoPesquisa>pesquisas = List<ObjetoPesquisa>();
    List<dynamic> types= dados["types"];


    String imagem = dados["sprites"]["front_default"];



    for (int i = 0; i<types.length; i++)
    {

    //  print(types[i]["type"]["name"]);
     pesquisas.add(ObjetoPesquisa(nomePokemon,imagem, types[i]["type"]["name"]));
     print(types[i]["type"]["name"]);

    }

    this.pesquisa.sink.add(pesquisas);

  }

//get_caracteristica(dados, nomePokemon)
//{
// // List<ObjetoPerfil>pesquisas = List<ObjetoPerfil>();
//
//
//}

get_moves (dados, nomePokemon)
  {

    List<ObjetoPerfil>caracteri = List<ObjetoPerfil>();



//    List<ObjetoPerfil>caract = List<ObjetoPerfil>();
   // List<String> listaMoves = List();
    List<dynamic>moves = dados["moves"];
    List<dynamic>stat = dados["stats"];

    int hp = stat[0]["base_stat"];
    int atq = stat[1]["base_stat"];
    int defesa =stat[2]["base_stat"];
    int speed = stat[5]["base_stat"];

    int peso= dados["weight"];
    int peso1 = 0;

    String url_name = dados["sprites"]["front_default"];

    print (dados["weight"]);
    print(dados);
    String tipo =dados["types"][0]["type"]["name"];
    print(tipo);
    print (dados["weight"]);



//    print(moves);
    for (int i = 0; i<moves.length; i++)
    {
  //    listaMoves.add(moves[i]["move"]["name"]);
      caracteri.add(ObjetoPerfil(tipo,url_name,nomePokemon,atq,defesa,hp,speed,peso,moves[i]["move"]["name"]));

    }

   //print(listaMoves);

    this.caracteris.sink.add(caracteri);
  }

  get_evolucoes(dados1)
  {

    List<ObjetoEvolucao>evoluc = List<ObjetoEvolucao>();

    String n1;
    String n2;
    n1 = dados1["chain"]["evolves_to"][0]["species"]["name"];
    n2 = dados1["chain"]["species"]["name"];

    print(dados1);

    print(n1);

    if(n1 == null)
      evoluc.add(ObjetoEvolucao(".", n2));
    if(n2 == null)
      evoluc.add(ObjetoEvolucao(n1, "."));
    if (n1 == null && n2==null)
      evoluc.add(ObjetoEvolucao(".", "."));


    else
      evoluc.add(ObjetoEvolucao(n1, n2));


     print(dados1["chain"]["evolves_to"][0]["species"]["name"]);
     print(dados1["chain"]["species"]["name"]);
    this.evolution.sink.add(evoluc);
  }


  getPokeInfo (String nomePokemon, context) async
  {
    var dados;
    dados = await pokeApi.buscarDados(nomePokemon);

    get_pesquisa(dados, nomePokemon);

   get_moves(dados, nomePokemon);

   getPoke(nomePokemon, context);

    mudarTela(context);


  }

  getPoke (String nomePokemon, context) async
  {

    var dados1;
    dados1 = await pokeApi.buscarEvolucao(nomePokemon);
    get_evolucoes(dados1);

  }

  Tela(context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PerfilTela ()));
  }

  void mudarTela(context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>TelaBusca ()));

  }


}

