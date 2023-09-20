import 'package:flutter/material.dart';
import 'package:starter_kit/app/app_colors.dart';

class Course {
  final String difficulty;
  final String name;
  final String timeLenght;
  final String image;
  final Color color;

  final int quizes;
  final String topic;

  Course({
    required this.name,
    required this.timeLenght,
    required this.image,
    required this.color,
    required this.quizes,
    required this.difficulty,
    required this.topic,
  });
}

List<Course> courses = [
  Course(
    name: "Introduction to Programming",
    timeLenght: "12 weeks",
    image: "assets/images/chip.png",
    color: AppColors.purple,
    quizes: 10,
    difficulty: "Beginner",
    topic: "Web 3.0",
  ),
  Course(
    name: "Data Science and Machine Learning",
    timeLenght: "16 weeks",
    image: "assets/images/search.png",
    color: AppColors.green,
    quizes: 12,
    difficulty: "Intermediate",
    topic: "Crypto",
  ),
  Course(
    name: "Web Development Masterclass",
    timeLenght: "20 weeks",
    image: "assets/images/heart.png",
    color: AppColors.gradient1,
    quizes: 15,
    difficulty: "Advanced",
    topic: "NFTs",
  ),
  Course(
    name: "Digital Marketing Essentials",
    timeLenght: "8 weeks",
    image: "assets/images/lock.png",
    color: AppColors.orange,
    quizes: 8,
    difficulty: "Expert",
    topic: "Blockchain",
  ),
];
