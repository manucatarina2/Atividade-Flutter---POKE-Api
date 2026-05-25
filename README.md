# Pokedex Rosa - App Flutter

Um aplicativo Pokedex desenvolvido em Flutter que consome a PokeAPI para listar e buscar Pokemon.

## Funcionalidades

- Lista os 20 primeiros Pokemon ao iniciar
- Busca por nome ou ID do Pokemon
- Exibe imagem, nome, numero e tipos de cada Pokemon
- Tela de detalhes com informacoes adicionais (altura, peso, tipos)
- Tratamento de erros (Pokemon nao encontrado, offline)
- Indicador de carregamento
- Interface responsiva com tema rosa

## Tecnologias Utilizadas

- Flutter
- Dart
- PokeAPI (https://pokeapi.co/)
- HTTP package para requisicoes

## Dependencias

dependencies:
flutter:
sdk: flutter
cupertino_icons: ^1.0.8
http: ^1.1.0

## Estrutura do Projeto

lib/
├── main.dart
├── models/
│ └── pokemon_model.dart
├── services/
│ └── pokemon_service.dart
└── screens/
├── pokedex_screen.dart
└── pokemon_detail_screen.dart


## Como Executar

1. Clone o repositorio
2. Execute `flutter pub get` para instalar as dependencias
3. Conecte um dispositivo ou inicie um emulador
4. Execute `flutter run`

## API Utilizada

- Endpoint para lista inicial: https://pokeapi.co/api/v2/pokemon?limit=20
- Endpoint para busca: https://pokeapi.co/api/v2/pokemon/{nome_ou_id}

## Endpoints

A aplicacao utiliza dois endpoints principais da PokeAPI:

1. Lista inicial: Retorna os 20 primeiros Pokemon com nome e url
2. Busca especifica: Retorna detalhes completos de um Pokemon especifico

## Tratamento de erros 

- Pokemon nao encontrado: Exibe mensagem amigavel quando o ID ou nome nao existe
- Erro de conexao: Exibe mensagem quando o dispositivo esta offline
- Carregamento: Mostra indicador de progresso enquanto aguarda a resposta da API

## Personalizacao

O tema do aplicativo pode ser alterado modificando a cor primarySwatch no arquivo main.dart:
- Colors.red (vermelho)
- Colors.pink (rosa)
- Colors.blue (azul)
- Colors.green (verde)

## Licenca

Este projeto foi desenvolvido para fins educacionais.

