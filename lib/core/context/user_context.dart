import 'package:flutter/material.dart';
import 'package:nodelabs_case/product/model/movie_model.dart';
import 'package:nodelabs_case/product/model/user_model.dart';

final class UserContext extends ChangeNotifier {
  UserModel? _user;
  final List<MovieModel> _favorites = [];

  UserModel? get user => _user;
  List<MovieModel> get favorites => _favorites;

  void updateUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void addFavorite(MovieModel movie) {
    _favorites.add(movie);
    notifyListeners();
  }

  void updateFavorites(List<MovieModel> favorites) {
    _favorites.clear();
    _favorites.addAll(favorites);
    notifyListeners();
  }

  bool isFavorite(MovieModel movie) {
    return _favorites.any((fav) => fav.id == movie.id);
  }

  void removeFavorite(MovieModel movie) {
    _favorites.removeWhere((fav) => fav.id == movie.id);
    notifyListeners();
  }

  void logOut() {
    _favorites.clear();
    _user = null;
    notifyListeners();
  }
}
