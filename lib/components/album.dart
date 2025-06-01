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
  Map<String, dynamic> grades = {
    "👑👑👑": 10,
    "👑👑": 9.8,
    "👑": 9.5,
    "#": 9,
    "##": 8.5,
    "###": 8,
    "good normal": 7,
    "mid normal": 5,
    "bad normal": 4,
    "~ bad ~": 3,
    "~ bad ~ 💀": 2,
    "~ bad ~ 💀💀": 1,
    "~ bad ~ 💀💀💀": 0,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.network(
              widget.info["Cover"],
              errorBuilder: (context, error, stackTrace) {
                return Text('Erro ao carregar a imagem');
              },
              width: 250,
              height: 250,
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(widget.info["Name"], style: TextStyle(fontSize: 20)),
                GestureDetector(
                  onTap: () {
                    final artistUrl = widget.info["Artist"][0]["Link"];
                    launchUrl(Uri.parse(artistUrl));
                  },
                  child: Text(
                    widget.info["Artist"][0]["Name"],
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  'Data de lançamento: ${widget.info["Release"]}',
                  textAlign: TextAlign.left,
                ),
                Text(
                  '${widget.info["Number_tracks"]} Faixas',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Divider(),
        Expanded(
          child: ListView.builder(
            itemCount: widget.info['Tracks']?.length ?? 0,
            itemBuilder: (context, index) {
              final track = widget.info['Tracks'][index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  leading: track['Explicit'] == true
                      ? Icon(Icons.explicit, color: Colors.red)
                      : null,
                  title: Text(track['Title'] ?? 'Título indisponível'),
                  trailing: DropdownButton<String>(
                    icon: Icon(Icons.more_vert),
                    items: grades.keys.map((key) {
                      return DropdownMenuItem<String>(
                        value: key,
                        child: Text(key),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      print("TRACK: ${track['Title']}, NOTA: $newValue");
                      setState(() {
                        track['Grade'] = newValue;
                      });
                      print(track['Grade']);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
