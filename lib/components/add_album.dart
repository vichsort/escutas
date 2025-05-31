// POP UP PARA ADICIONAR ALBUM
// AQUI SE PEDE URI. TEST: spotify:album:79ONNoS4M9tfIA1mYLBYVX

import 'package:flutter/material.dart';
import '../logic/request.dart';
import '../pages/escutas.dart';

class AddAlbumPopup extends StatefulWidget {
  const AddAlbumPopup({super.key});

  @override
  State<AddAlbumPopup> createState() => _AddAlbumPopupState();
}

class _AddAlbumPopupState extends State<AddAlbumPopup> {
  final TextEditingController _albumUriController = TextEditingController();

  @override
  void dispose() {
    _albumUriController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Album',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _albumUriController,
                decoration: InputDecoration(
                  labelText: 'Album URI',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed:
                        _albumUriController.text.startsWith('spotify:album:')
                        ? () async {
                            // Mostra loading
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            );

                            // Aguarda o resultado
                            Map<String, dynamic> info = await handleRequest(
                              _albumUriController.text,
                            );

                            // Fecha o loading
                            Navigator.of(context).pop();

                            // Navega para a próxima página com o resultado
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EscutasPage(albumInfo: info, editing: true),
                              ),
                            );
                          }
                        : null,
                    child: Text('Confirm'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
