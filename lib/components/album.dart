import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
              width: 250,
              height: 250,
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(
                  widget.info["albumInfo"]["Name"],
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    final artistUrl =
                        widget.info["albumInfo"]["Artist"][0]["Link"];
                    launchUrl(Uri.parse(artistUrl));
                  },
                  child: Text(widget.info["albumInfo"]["Artist"][0]["Name"]),
                ),
                Text(widget.info["albumInfo"]["Release"]),
                Text('${widget.info["albumInfo"]["Number_tracks"]} Faixas'),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(),
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
