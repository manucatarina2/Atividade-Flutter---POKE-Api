import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/pokemon_model.dart';

class PokemonService {
  static const String baseUrl = 'https://pokeapi.co/api/v2';

  Future<List<Pokemon>> getInitialPokemons() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/pokemon?limit=20'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];

        List<Pokemon> pokemons = [];

        for (var pokemonData in results) {
          final pokemon = await getPokemonDetails(pokemonData['name']);
          pokemons.add(pokemon);
        }

        return pokemons;
      } else {
        throw Exception('Falha ao carregar Pokémon');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }

  Future<Pokemon> getPokemonDetails(String nameOrId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/pokemon/${nameOrId.toLowerCase()}'),
      );

      if (response.statusCode == 200) {
        return Pokemon.fromJson(json.decode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('Pokémon não encontrado');
      } else {
        throw Exception('Erro ao carregar Pokémon');
      }
    } catch (e) {
      if (e.toString().contains('Não encontrado')) {
        throw Exception('Pokémon não encontrado');
      }
      throw Exception('Erro de conexão. Verifique sua internet.');
    }
  }

  Future<Pokemon> searchPokemon(String query) async {
    if (query.isEmpty) {
      throw Exception('Digite um nome ou ID');
    }
    return await getPokemonDetails(query);
  }
}
