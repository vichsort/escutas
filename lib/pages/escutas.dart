import 'package:flutter/material.dart';
import '../components/album.dart';

class EscutasPage extends StatefulWidget {
  final Map<String, dynamic> albumInfo;
  final bool editing;

  const EscutasPage({
    super.key,
    required this.albumInfo,
    required this.editing,
  });

  @override
  State<EscutasPage> createState() => _EscutasPageState();
}

class _EscutasPageState extends State<EscutasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Escutas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AlbumViewer(info: widget.albumInfo, editing: widget.editing),
      ),
    );
  }
}
