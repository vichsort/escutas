import 'package:flutter/material.dart';

class EscutasPage extends StatefulWidget {
  final Future<Map<String, dynamic>> albumInfo;

  const EscutasPage({super.key, required this.albumInfo});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Map<String, dynamic>>(
              future: widget.albumInfo,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Ocorreu um erro: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Image.network(
                    snapshot.data?["albumInfo"]["Cover"],
                    errorBuilder: (context, error, stackTrace) {
                      return Text('Erro ao carregar a imagem');
                    },
                  );
                } else {
                  return Text(
                    'Não foi possível realizar a verificação. Talvez verificar sua conexão possa resolver seu problema!',
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
