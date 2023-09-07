class Movie {
  final String title;
  final String image;
  final int index;

  Movie({
    required this.title,
    required this.image,
    required this.index,
  });
}

List<Map<String, dynamic>> rawData = [
  {
    'title': 'movie title 1',
    'image': 'assets/images/image1.jpg',
    'index': 1,
  },
  {
    'title': 'movie title 2',
    'image': 'assets/images/image2.jpg',
    'index': 2,
  },
  {
    'title': 'movie title 3',
    'image': 'assets/images/image3.jpg',
    'index': 3,
  },
  {
    'title': 'movie title 4',
    'image': 'assets/images/image4.jpg',
    'index': 4,
  },
];
