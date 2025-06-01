import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'track.dart';

class AlbumViewer extends StatefulWidget {
  final Map<String, dynamic> info;
  final bool editing;

  const AlbumViewer({super.key, required this.info, required this.editing});

  @override
  State<AlbumViewer> createState() => _AlbumViewerState();
}

class _AlbumViewerState extends State<AlbumViewer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(
              widget.info["albumInfo"]["Cover"],
              errorBuilder: (context, error, stackTrace) {
                return Text('Erro ao carregar a imagem');
              },
              width: 500,
              height: 500,
            ),
            Column(
              children: [
                Text(
                  widget.info["albumInfo"]["Name"],
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final artistUrl = widget.info["albumInfo"]["Link"];
                    launchUrl(Uri.parse(artistUrl));
                  },
                  child: Text(
                    widget.info["albumInfo"]["Artist"][0]["Name"],
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.info['albumInfo']['Tracks']?.length ?? 0,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  widget.info['albumInfo']['Tracks'][index]['Title'] ??
                      'Título indisponível',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
