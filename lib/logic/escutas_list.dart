// ARMAZENA AS ESCUTAS EM OBJETOS DENTRO DE UMA LISTA
List<Map<String, dynamic>> escutas = [];

void addEscuta(
  String cover,
  String id,
  String link,
  String titulo,
  String artista,
  int numeroFaixas,
  String notaMedia,
  Map<String, String> faixasNotas,
  String? consideracoes,
) {
  escutas.add({
    'Cover': cover,
    'Uri': 'spotify:album:$id',
    'Id': id,
    'Link': link,
    'Title': titulo,
    'Artist': artista,
    'Tracks': numeroFaixas,
    'Average': notaMedia,
    'Grades': faixasNotas,
    'Details': consideracoes,
  });
}
