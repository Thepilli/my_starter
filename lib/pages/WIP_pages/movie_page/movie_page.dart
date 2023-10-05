// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:starter_kit/models/movie.dart';
import 'package:starter_kit/pages/WIP_pages/movie_page/animated_offset.dart';
import 'package:starter_kit/pages/WIP_pages/movie_page/movie_detail.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late PageController _pageController;
  late PageController _bgController;
  List<Movie> movies = [];
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    movies = rawData
        .map(
          (data) => Movie(
            title: data['title'],
            image: data['image'],
            index: data['index'],
          ),
        )
        .toList();
    _bgController = PageController(initialPage: currentIndex);
    _pageController = PageController(viewportFraction: .8, initialPage: currentIndex)
      ..addListener(() {
        setState(() {
          pageValue = _pageController.page!;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    print(pageValue);
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: SizedBox(
              key: ValueKey(movies[currentIndex].image),
              height: double.maxFinite,
              width: double.maxFinite,
              child: Image.asset(
                movies[currentIndex].image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * .5),
            height: height * .5,
            width: double.maxFinite,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: const [Colors.white, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          AnimatedOffset(
            pageController: _pageController,
            pageValue: pageValue,
            child: (index, context) {
              return MovieDetail(movie: movies[index]);
            },
            pageCount: movies.length,
            onPageChangeCallback: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
