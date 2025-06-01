import 'token.dart';
import 'get_album.dart';

Future<Map<String, dynamic>> handleRequest(String uri) async {
  String token = await getToken();

  String id = dismantleUri(uri);
  Map<String, dynamic> albumInfo = await getAlbum(token, id);

  return {'id': id, 'albumInfo': albumInfo};
}
