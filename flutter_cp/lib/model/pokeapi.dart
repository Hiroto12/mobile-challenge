import 'package:http/http.dart' as http;
import 'dart:convert';

class PokeApi {


  buscarDados (String nomePokemon) async
  {
    http.Response response = await http.get("https://pokeapi.co/api/v2/pokemon/${nomePokemon}");
    var dadosJson = json.decode (response.body);

    print("${nomePokemon}");
    print (dadosJson);
    return dadosJson;

  }
  buscarEvolucao (String nomePokemon) async
  {

    http.Response respo = await http.get("https://pokeapi.co/api/v2/pokemon/${nomePokemon}");
    var dateJson0 = json.decode (respo.body);

    String variavelX = dateJson0["species"]["url"];


    http.Response response = await http.get(variavelX);

    var dateJson1 = json.decode (response.body);

    http.Response response1 = await http.get(dateJson1["evolution_chain"]["url"]);
    var dateJson2 = json.decode(response1.body);


    String variavelY = dateJson2["chain"]["evolves_to"][0]["evolves_to"][0]["species"]["name"];

    print(variavelY);

    print(dateJson2["chain"]["evolves_to"][0]["species"]["name"]);
    print(dateJson2["chain"]["species"]["name"]);
    return dateJson2;




  }

}