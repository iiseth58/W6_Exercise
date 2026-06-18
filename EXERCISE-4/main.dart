import 'package:flutter/material.dart';

// DATA
final List<String> jokes = [
  "hi",
  "hi",
  "hi",
  "hi",
  "hi",
  "hi",
  "hi",
  "hi",
  "hi",
  "hi",
  "hi",
  "hi",
  "hi",
  "hi",
];

class FavoriteCardsScreen extends StatefulWidget {
  const FavoriteCardsScreen({super.key});

  @override
  State<FavoriteCardsScreen> createState() => FavoriteCardsScreenState();
}

class FavoriteCardsScreenState extends State<FavoriteCardsScreen> {
  int? favoriteIndex;

  void setFavorite(int index) {
    setState(() {
      favoriteIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Favorite cards',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            jokeText: jokes[index],
            isFavorite: favoriteIndex == index,
            onFavorite: () => setFavorite(index),
          );
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String jokeText;
  final bool isFavorite;
  final VoidCallback onFavorite;

  const FavoriteCard({super.key,required this.jokeText,required this.isFavorite,required this.onFavorite,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jokeText,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FavoriteCardsScreen(),
  ));
}
