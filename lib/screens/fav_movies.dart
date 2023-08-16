import 'package:flutter/material.dart';
import 'package:my_provider/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';

class MyFavorite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFavoriteState();
}

class MyFavoriteState extends State<MyFavorite> {
  @override
  Widget build(BuildContext context) {
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          ),
          title: Center(
            child: Text(
              "My Favorite",
            ),
          ),
          backgroundColor: Color.fromARGB(255, 133, 185, 209)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  final currentMovie = myList[index];
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
                      trailing: TextButton(
                        child: Text(
                          "Remove",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        onPressed: () {
                          context
                              .read<MovieProvider>()
                              .removeFromList(currentMovie);
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
