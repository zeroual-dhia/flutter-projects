import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  var selected_index = 0;
  var favorites = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selected_index) {
      case 0:
        page = myHome(
          favorites: favorites,
        );
      case 1:
        page = Favourites(
          myfavorites: favorites,
        );
      default:
        throw UnimplementedError('no widget for $selected_index');
    }

// ...

    return Scaffold(
      body: Row(children: [
        SafeArea(
          child: NavigationRail(
            extended: false,
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.favorite), label: Text("Favorites"))
            ],
            selectedIndex: selected_index,
            onDestinationSelected: (value) {
              setState(() {
                selected_index = value;
              });
            },
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.grey,
          child: page,
        ))
      ]),
    );
  }
}

class myHome extends StatefulWidget {
  var favorites = <WordPair>[];
  myHome({super.key, required this.favorites});

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  var current = WordPair.random();

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (widget.favorites.contains(current)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WordCard(word: current),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      if (widget.favorites.contains(current)) {
                        widget.favorites.remove(current);
                      } else {
                        widget.favorites.add(current);
                      }
                    });
                  },
                  label: Text(
                    "Like",
                    style: TextStyle(color: Colors.red[900]),
                  ),
                  icon: Icon(
                    icon,
                    color: Colors.red[900],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        current = WordPair.random();
                      });
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.red[900]),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WordCard extends StatelessWidget {
  const WordCard({super.key, required this.word});
  final WordPair word;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[900],
      margin: EdgeInsets.all(15),
      child: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Text(
            word.asLowerCase,
            style: TextStyle(color: Colors.white, fontSize: 30),
          )),
    );
  }
}

class Favourites extends StatefulWidget {
  var myfavorites = <WordPair>[];
  Favourites({super.key, required this.myfavorites});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text("You have ${widget.myfavorites.length} favorites"),
          ),
          ...(widget.myfavorites).map((fav) => ListTile(
              onTap: () {},
              leading: Icon(Icons.favorite),
              title: Text(fav.toString()),
            )).toList(),
        ],
      )),
    );
  }
}

 /*for (var fav in widget.myfavorites)
           */