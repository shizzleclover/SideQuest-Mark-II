import 'package:flutter/material.dart';
import 'package:sidequest_mark_ii/utils/constants/colors.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SideQuestColors.blc ,
    );
  }
}