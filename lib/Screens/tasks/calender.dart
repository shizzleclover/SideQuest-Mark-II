import 'package:flutter/material.dart';
import 'package:sidequest_mark_ii/utils/constants/colors.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: SideQuestColors.blc,
    );
  }
} 