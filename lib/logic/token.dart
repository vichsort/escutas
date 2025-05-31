// GERA O TOKEN

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> getToken() async {
  String clientId = "b32de28dde7146a38b60792a88de04b4";
  String clientSecret = 'c420a85191d441b7b5ce89dc3b92f4aa';

  final url = Uri.parse('https://accounts.spotify.com/api/token');

  final authRequisitos = '$clientId:$clientSecret';
  final authSeparado = utf8.encode(authRequisitos);
  final authEncriptado = base64.encode(authSeparado);

  final headers = {
    'Authorization': 'Basic $authEncriptado',
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  final data = {
    'grant_type': 'client_credentials',
    'code': '200',
    'redirect_uri': 'https://github.com/vichsort',
  };

  final response = await http.post(url, headers: headers, body: data);

  if (response.statusCode != 200) {
    throw Exception(
      'Algo ocorreu durante a geração do token (Status code ${response.statusCode})',
    );
  }

  final jsonResult = jsonDecode(response.body);
  final token = jsonResult['access_token'];
  return token;
}
