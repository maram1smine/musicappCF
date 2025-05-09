class CreateUser {
  String firstName;
  String lastName;
  String email;
  List<String> songs;
  List<PhotoDto> photos;
  CreateUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    List<String>? songs,
    List<PhotoDto>? photos,
  })  : songs = songs ?? [],
        photos = photos ?? [];
  void addPhoto(PhotoDto p) {
    photos.add(p);
  }

  void addSong(String s) {
    songs.add(s);
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'songs': songs,
      'photos': photos.map((photo) => photo.toJson()).toList()
    };
  }
}

class PhotoDto {
  String uri;
  PhotoDto(this.uri);
  Map<String, dynamic> toJson() {
    return {'URI': uri};
  }
}
