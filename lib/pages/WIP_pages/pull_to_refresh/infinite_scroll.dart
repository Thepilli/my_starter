import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfiniteScroll extends StatefulWidget {
  const InfiniteScroll({super.key});

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll> {
  final controller = ScrollController();
  List<String> items = [];
  bool hasMore = true;
  int page = 1;
  bool isLoading = false;

  Future fetch() async {
    if (isLoading) return;
    isLoading = true;
    const limit = 25;
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);

      setState(() {
        page++;
        isLoading = false;
        if (newItems.length < limit) {
          hasMore = false;
        }
        items.addAll(newItems.map<String>((item) {
          final number = item['id'];
          return 'imte $number';
        }).toList());
      });
    }
  }

  @override
  void initState() {
    fetch();
    super.initState();

    controller.addListener(
      () {
        if (controller.position.maxScrollExtent == controller.offset) {
          fetch();
        }
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('infinite scroll'),
      ),
      body: ListView.builder(
        controller: controller,
        itemCount: items.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < items.length) {
            return ListTile(
              title: Text(items[index]),
            );
          } else {
            return Center(
              child: hasMore ? const CircularProgressIndicator() : const Text('No More Items'),
            );
          }
        },
      ),
    );
  }
}
