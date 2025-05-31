import 'token.dart';
import 'get_album.dart';

Future<Map<String, dynamic>> handleRequest() async {
  String token = await getToken();

  String id = dismantleUri("spotify:album:79ONNoS4M9tfIA1mYLBYVX");
  Map<String, dynamic> albumInfo = await getAlbum(token);

  return {'id': id, 'albumInfo': albumInfo};
}
