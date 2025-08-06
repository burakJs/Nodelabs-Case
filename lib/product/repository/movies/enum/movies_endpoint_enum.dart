enum MoviesEndpointEnum {
  list('/list'),
  favorites('/favorites'),
  updateFavorite('/favorite');

  const MoviesEndpointEnum(this._path);

  final String _path;

  String get path => '/movie$_path';
}
