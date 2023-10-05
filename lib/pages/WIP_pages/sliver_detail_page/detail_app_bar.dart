import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:starter_kit/app/app_colors.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      leadingWidth: 80,
      leading: Container(
        margin: const EdgeInsets.only(left: 30),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: AppColors.white.withOpacity(.2), shape: BoxShape.circle),
              height: 50,
              width: 50,
              child: const Icon(Icons.chevron_left),
            ),
          ),
        ),
      ),
      expandedHeight: 275,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor: AppColors.white,
      elevation: 0,
      pinned: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            alignment: Alignment.center,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(99), color: AppColors.grey),
              height: 5,
              width: 40,
            ),
          )),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: Image.asset(
          'assets/images/sliver_img.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
