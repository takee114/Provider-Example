import 'package:flutter/material.dart';
import 'package:my_provider/model/movie_model.dart';
import 'package:provider/provider.dart';
import '/provider/movie_provider.dart';
import 'fav_movies.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              "Provider",
            ),
          ),
          backgroundColor: Color.fromARGB(255, 133, 185, 209)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyFavorite(),
                  ),
                );
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: Text(
                "Go to My favorit movies(${myList.length})",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final currentMovie = movies[index];
                  return Card(
                    key: ValueKey(currentMovie.title),
                    color: Colors.blue,
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        currentMovie.title,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        currentMovie.duration ?? "No information",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite),
                        color: myList.contains(currentMovie)
                            ? Colors.red
                            : Colors.white,
                        iconSize: 30,
                        onPressed: () {
                          if (myList.contains(currentMovie)) {
                            context
                                .read<MovieProvider>()
                                .removeFromList(currentMovie);
                          } else {
                            context
                                .read<MovieProvider>()
                                .addToList(currentMovie);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
