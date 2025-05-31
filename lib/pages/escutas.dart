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
  // PARA ESTA PÁGINA É NECESSÁRIO QUE PEGUEMOS O VALOR
  // QUE FICOU ARMAZENADO LÁ EM handleRequest (AQUELE MAP
  // COM id e albumInfo) PARA GERAR A PÁGINA DE FAZER A REVIEW.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("a"),
      ),
      body: AlbumViewer(info: widget.albumInfo, editing: widget.editing),
    );
  }
}
