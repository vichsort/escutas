# Escutas
Projeto desenvolvido para a disciplina de `DESENVOLVIMENTO DE SISTEMAS PARA DISPOSITIVOS MÓVEIS` que consiste na review de cada faixa separadamente de um álbum. Esses albuns são adquiridos por meio da API gratuíta disponibilizada pelo Spotify. Por meio dela, enviamos a requisição com um corpo padrão e um ID, que fará a coleta dos dados e disponibiliza-os num meio visual que permite a interação do usuário de uma forma simples. Essas análises, entituladas 'escutas' são armazenadas e podem ser visualizadas em qualquer momento. 

## Lógica inicial
- Token é gerado em `token.dart`
- Requisições são feitas em `get_album.dart`
- Tudo é unido em `request.dart`
- Sua review é realizada em `escutas.dart`
- Essa review é armazenada em `escutas_list.dart`
- Você pode ver as reviews em `home.dart`

## Passo a passo do que é realizado
### 1 (token)
GERAR A CHAVE PARA A REQUISIÇÃO E USAR COMO PARÂMETRO

### 2
PEDIR PRO USUARIO A URI DO ALBUM VIA INPUT <br>
COLOCOU A URI E CLICOU EM PROXIMO<br>

### 3 (get_album)
SEPARAR A URI <br>
PARA ISSO, FUNÇÃO 'dismantleUri' <br>

FAZER A REQUISIÇÃO <br>
PARA ISSO, FUNÇÃO 'getAlbum' <br>

### 4 (track em 'edit=true')
DISPLAY DAS FAIXAS SEPARADAMENTE  <br>
PARA ISSO, WIDGET 'track' CONSTRUIDO A CADA MUSICA, MONTADO NA TELA <br>
ONDE? `escutas.dart`

### 5 
DEIXAR O USUÁRIO INTERAGIR COM AS NOTAS DE MANEIRA REANKEADA. USUÁRIO PODE ESCOLHER SALVAR, RESETAR OU DELETAR

### 6 (Banco de dados)
ARMAZENAR DE UMA FORMA DIFERENTE OS DADOS:
- String Cover
- String Id, 
- String Link,
- String Titulo, 
- String Artista, 
- int NumeroFaixas, 
- String NotaMedia, 
- Map<String, String> FaixasNotas -> essas serão dispostas de forma diferente futuramente...
Guardar esses dados em um objeto, tentando armazenar tudo da forma mais compacta possível

### 7 
GERAR UM CARD COM ALGUMAS AS MESMAS INFORMAÇÕES, ASSOCIANDO ELAS DE MANEIRA PADRÃO <br>
ISSO VAI ACONTECEM EM `card.dart`, mas o display de vários desses card será em `home.dart` <br>

### 8 (track em 'edit=false')
PERMITIR O USUÁRIO CLICAR NO CARD E VISUALIZAR INDIVIDUALMENTE, NUM SENTIDO SIMILAR AO  <br>
QUINTO PASSO, MAS COM DIFERENÇAS PERCEPTIVEIS PARA NÃO CONFUNDIR. <br>
PARA ISSO, WIDGET 'track' CONSTRUIDO A CADA MUSICA <br>
ONDE? `escutas.dart`.


