// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starter_kit/app/app_colors.dart';
import 'package:starter_kit/app/app_constants.dart';
import 'package:starter_kit/pages/WIP_pages/sliver_detail_page/detail_app_bar.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';
import 'package:starter_kit/shared/widgets/jbox.dart';

class SliverDetailPage extends ConsumerWidget {
  const SliverDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          DetailAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tacos Carnitas con Chilles verdes'),
                  Row(
                    children: [
                      Text('Food'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.grey),
                        ),
                      ),
                      Text('60 mins'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  color: AppColors.black.withOpacity(.3),
                                )
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(ImagePath.avatar),
                              ),
                            ),
                          ),
                          JBox(width: 10),
                          Text('Andrea Barrera'),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.primary,
                            ),
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.white,
                            ),
                          ),
                          JBox(width: 10),
                          Text('174 likes'),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Text('Description'),
                  Text(
                      'Carnitas are the Mexican version of pulled pork. Braised first in a spicy sauce, pork shoulder is slow cooked until so tender the meat just shreds easily with a fork. Then it\'s roasted at high heat to make crispy browned bits full of flavor!'),
                  Divider(),
                  Text('Ingredients'),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(color: AppColors.green.withOpacity(.5), shape: BoxShape.circle),
                        child: Icon(Icons.check, color: AppColors.green),
                      ),
                      JBox(width: 10),
                      Text('Carne'),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(color: AppColors.green.withOpacity(.5), shape: BoxShape.circle),
                        child: Icon(Icons.check, color: AppColors.green),
                      ),
                      JBox(width: 10),
                      Text('Carne'),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(color: AppColors.green.withOpacity(.5), shape: BoxShape.circle),
                        child: Icon(Icons.check, color: AppColors.green),
                      ),
                      JBox(width: 10),
                      Text('Carne'),
                    ],
                  ),
                  Divider(),
                  Text('Steps'),
                  JBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: context.secondary),
                        child: Text(
                          '1',
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                      JBox(width: 10),
                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                                'Put the pork, salsa verde, chopped onion, chicken stock, cumin seeds, coriander seeds, and oregano in a large, thick-bottomed pot, and heat on high heat. Bring to a boil, and reduce heat to a low simmer. Cover and simmer until meat pulls away easily with a fork, about 3 hours.')
                          ],
                        ),
                      )
                    ],
                  ),
                  JBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: context.secondary),
                        child: Text(
                          '2',
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                      JBox(width: 10),
                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                                'Preheat oven broiler. Remove meat from the pot and put into a roasting pan. With 2 forks, tear the meat into large shreds, spreading them out in an even layer in the roasting pan. Put pan on the top rack of the oven. Broil for 5 to 10 minutes until edges and some parts are brown and crispy.')
                          ],
                        ),
                      )
                    ],
                  ),
                  JBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: context.secondary),
                        child: Text(
                          '3',
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                      JBox(width: 10),
                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                                'While the meat is browning in the oven, skim the fat from the liquid in the large pot. (Discard but do not put the fat down the drain or you will clog your pipes.) Heat the pot on high and vigorously boil the remaining liquid, stirring, until reduced to 2 1/2 cups, several minutes.')
                          ],
                        ),
                      )
                    ],
                  ),
                  JBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: context.secondary),
                        child: Text(
                          '4',
                          style: context.textTheme.labelMedium,
                        ),
                      ),
                      JBox(width: 10),
                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                                'Return the meat to the pot with the liquid. Stir in chopped cilantro. Season with salt. Serve with heated and softened corn tortillas (20 seconds each in the microwave spread out over a paper towel will heat and softened packaged tortillas sufficiently), diced avocado, crumbed Cotija or grated Monterey jack cheese, sour cream (or crema fresca), and seasoned cabbage slaw..')
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
