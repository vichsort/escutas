# Escutas
Projeto desenvolvido para a disciplina de `DESENVOLVIMENTO DE SISTEMAS PARA DISPOSITIVOS MÓVEIS` que consiste na review de cada faixa separadamente de um álbum. Esses albuns são adquiridos por meio da API gratuíta disponibilizada pelo Spotify. Por meio dela, enviamos a requisição com um corpo padrão e um ID, que fará a coleta dos dados e disponibiliza-os num meio visual que permite a interação do usuário de uma forma simples. Essas análises, entituladas 'escutas' são armazenadas e podem ser visualizadas em qualquer momento. <br><br>

O verdadeiro projeto será desenvolvido em outro repositório. Aqui, ficará apenas este rascunho com ideias para o desenvolvimento final. Como um playground, os testes realizados funcionarão aqui como backup.

## Lógica inicial
- Front-end (Flutter)
- - Pede dados de um álbum.
- - Exibe dados do álbum.
- - Permite que o usuário atribua notas às faixas
- - Envia notas ao back-end. <br>
- Back-end (Node, jwt, express)
- - Sistema de refresh
- - Verifica se o álbum já existe no banco.
- - Se não existir, busca via API do Spotify.
- - Retorna dados ao Flutter.
- - Recebe notas e armazena no banco de dados. <br>
- Database (PostgreSQL)
- - Recebe ALBUM (id (Spotify), titulo, artista, capa, link e numero de faixas)
- - Recebe FAIXA (id (uuid), id do álbum (chave estrangeira), nome da faixa e rating)

```javascript
if (albumRequerido in bancoDeDados) {
    // 1. Pega informações do álbum (title, artist, cover, etc.)
    // 2. Retorna faixas sem considerar notas específicas de usuários
    // 3. Flutter exibe dados e permite rankear as faixas
    // 4. Backend recebe a nota individual do usuário (com UUID diferente) e armazena
    // 5. Calcula média atualizada e salva
} else {
    // 1. Backend busca álbum na API do Spotify
    // 2. Salva no banco de dados as infos do álbum (sem notas ainda)
    // 3. Retorna dados ao Flutter
    // 4. Flutter exibe e permite rankear
    // 5. Notas são salvas como antes
}
```

