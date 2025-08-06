enum UserEndpointEnum {
  login('/login'),
  register('/register'),
  profile('/profile'),
  uploadPhoto('/upload_photo');

  const UserEndpointEnum(this._path);

  final String _path;

  String get path => '/user$_path';
}
