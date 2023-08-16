import "dart:math";
import 'package:flutter/material.dart';

import '/model/movie_model.dart';

final List<Movie> initialdata = List.generate(
    50,
    (index) => Movie(
        title: "movie ${index}",
        duration: "${Random().nextInt(100) + 60} minutes"));

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initialdata;
  List<Movie> get movies => _movies;

  final List<Movie> _myList = [];
  List<Movie> get myList => _myList;
  void addToList(Movie favorite) {
    _myList.add(favorite);
    notifyListeners();
  }

  void removeFromList(Movie favorite) {
    _myList.remove(favorite);
    notifyListeners();
  }
}
