// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:starter_kit/app/app_colors.dart';
import 'package:starter_kit/models/movie.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';
import 'package:starter_kit/shared/widgets/animated_button.dart';
import 'package:starter_kit/shared/widgets/my_rounded_button.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.fromLTRB(10, height * .4, 10, 0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          children: [
            ClipRRect(
              child: Image.asset(
                movie.image,
                height: height * .4,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            Text(movie.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => Icon(Icons.star)),
            ),
            AnimatedButton(onTap: () {}, child: MyRoundedButton(color: context.primary, label: 'Buy Tickets'))
          ],
        ),
      ),
    );
  }
}
