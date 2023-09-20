// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starter_kit/app/app_colors.dart';
import 'package:starter_kit/models/course.dart';
import 'package:starter_kit/providers/topic_index_provider.dart';
import 'package:starter_kit/shared/extensions/build_context.dart';
import 'package:starter_kit/shared/widgets/jbox.dart';

class SandboxPage extends ConsumerWidget {
  SandboxPage({super.key});

  final List<String> topics = [
    'All topics',
    'Basics',
    'NFTs',
    'Cryptos',
    'Investing',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int topicIndex = ref.watch(topicIndexProvider);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/noise.png',
              )),
          gradient: LinearGradient(
            colors: [AppColors.gradient1, AppColors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0,
              0.4,
            ],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              leading: SvgPicture.asset('assets/icons/filter.svg'),
              actions: [
                CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.gradient1.withOpacity(.5),
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.search))),
                const JBox(width: 15),
                CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.gradient1.withOpacity(.5),
                    child: IconButton(onPressed: () {}, icon: const Icon(Icons.person))),
              ],
            ),
            Text(
              'Boldly Navigate the Seas of Web 3.0',
              style: context.textTheme.titleLarge?.copyWith(color: AppColors.white),
            ),
            Text(
              'Embark on a journey through the enigmatic realms of Web3.O that will leave you questioning atoms and NFTs',
              style: context.textTheme.bodyLarge?.copyWith(color: AppColors.white),
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                separatorBuilder: (context, index) => const VerticalDivider(
                  color: AppColors.grey,
                  indent: 0,
                  width: 1,
                  thickness: 2,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: topics.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(topicIndexProvider.notifier).onTap(index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: topicIndex == index ? AppColors.primaryLight : AppColors.black,
                          border: const Border.symmetric(horizontal: BorderSide(color: AppColors.grey))),
                      child: Text(
                        topics[index],
                        style: context.textTheme.bodyMedium?.copyWith(
                            color: topicIndex == index ? AppColors.black : AppColors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .7),
                itemCount: courses.length,
                itemBuilder: (BuildContext context, int index) {
                  Course course = courses[index];
                  return CourseCard(course: course);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  Course course;
  CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CourseChip(label: course.difficulty),
              const JBox(width: 10),
              CourseChip(label: course.topic),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: course.color, blurRadius: 30, spreadRadius: 5, offset: const Offset(0, 0))]),
              child: Image.asset(
                course.image,
                height: 100,
              ),
            ),
          ),
          Flexible(
            child: Text(
              course.name,
              style: context.textTheme.titleSmall?.copyWith(color: AppColors.white, fontWeight: FontWeight.normal),
              maxLines: 2,
            ),
          ),
          Row(
            children: [
              Text(
                course.timeLenght,
                style: context.textTheme.bodySmall?.copyWith(color: AppColors.white),
              ),
              Text(
                ' * ',
                style: context.textTheme.bodySmall?.copyWith(color: AppColors.white),
              ),
              Text(
                '${course.quizes} quizes',
                style: context.textTheme.bodySmall?.copyWith(color: AppColors.white),
              ),
              const JBox(width: 10),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(border: Border.all(color: AppColors.grey), shape: BoxShape.circle),
                child: const Icon(
                  Icons.start,
                  color: AppColors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CourseChip extends StatelessWidget {
  final String label;
  const CourseChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: context.textTheme.bodyMedium?.copyWith(color: AppColors.white),
      ),
    );
  }
}
