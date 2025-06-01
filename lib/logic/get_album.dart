// PEGA O ALBUM

import 'dart:convert';
import 'package:http/http.dart' as http;

String dismantleUri(String uri) {
  List<String> split = uri.split('spotify:album:');
  String id = split[1];
  return id;
}

Future<Map<String, dynamic>> getAlbum(String token, id) async {
  final url = Uri.parse("https://api.spotify.com/v1/albums/$id?market=br");

  final response = await http.get(
    url,
    headers: {"Authorization": "Bearer $token"},
  );

  if (response.statusCode != 200) {
    throw ("Houve um erro com a requisição. Status code: ${response.statusCode}");
  }
  final jsonResult = jsonDecode(response.body);
  Map<String, dynamic> res = {
    // CAPA DO ALBUM
    "Cover": jsonResult["images"][0]["url"],

    // NOME DO ALBUM
    "Name": jsonResult["name"],

    // NOME E LINK PRO PERFIL
    "Artist": jsonResult["artists"].map((artist) {
      return {
        "Name": artist["name"],
        "Link": artist["external_urls"]["spotify"],
      };
    }).toList(),

    // LANÇAMENTO DO ALBUM
    "Release": jsonResult["release_date"],

    // NUMERO DE FAIXAS
    "Number_tracks": jsonResult["total_tracks"],

    // FAIXAS
    "Tracks": jsonResult["tracks"]["items"].map((track) {
      return {
        "Title": track["name"],
        "Number": track["disc_number"],
        "Link": track["external_urls"]["spotify"],
        "Duration_ms": track["duration_ms"],
        "Explicit": track["explicit"],
      };
    }).toList(),
  };

  return res;
}
