import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({Key? key, required this.pokemon})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '#${pokemon.id.toString().padLeft(3, '0')} ${pokemon.name.toUpperCase()}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Image.network(
                  pokemon.imageUrl,
                  height: 250,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported,
                      size: 100,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildInfoCard(),
                  SizedBox(height: 20),
                  _buildTypesCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(Icons.height, color: Colors.pink, size: 30),
                SizedBox(height: 8),
                Text(
                  'Altura',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  '${pokemon.height / 10} m',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(height: 40, width: 1, color: Colors.grey[300]),
            Column(
              children: [
                Icon(Icons.fitness_center, color: Colors.pink, size: 30),
                SizedBox(height: 8),
                Text(
                  'Peso',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  '${pokemon.weight / 10} kg',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypesCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Tipos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.types.map((type) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: _getTypeColor(type),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    type.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return Colors.green;
      case 'fire':
        return Colors.orange;
      case 'water':
        return Colors.blue;
      case 'electric':
        return Colors.amber;
      case 'psychic':
        return Colors.purple;
      case 'fighting':
        return Colors.red[900]!;
      case 'flying':
        return Colors.indigo;
      case 'poison':
        return Colors.deepPurple;
      case 'ground':
        return Colors.brown;
      case 'rock':
        return Colors.grey[800]!;
      case 'bug':
        return Colors.lime;
      case 'ghost':
        return Colors.indigo[900]!;
      case 'steel':
        return Colors.blueGrey;
      case 'dragon':
        return Colors.teal;
      case 'dark':
        return Colors.grey[850]!;
      case 'fairy':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}
