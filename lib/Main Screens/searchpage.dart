// lib/screens/search_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidequest_mark_ii/constants.dart';
import 'package:sidequest_mark_ii/widgets/SearchBox.dart';
import 'package:sidequest_mark_ii/widgets/bottomnavbar.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    ScreenUtil.init(context);

    void _onIconTap (int index) {
       // Handle icon tap and navigation
      // Example:
      // if (index == 0) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen()));
      // }
      _selectedIndex = index;
    }
    return Scaffold(
      backgroundColor: back,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  const CustomTextField(
                    
                    hintText: 'Search',
                    iconPath: 'Assets/icons/search.svg',  // Provide the correct path to your SVG
                  ),
                  SizedBox(height: 20.h,),
              const   Align(
  alignment: Alignment.centerLeft,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text('Popular Searches', style: TextStyle(color: Colors.white)),
    ],
  ),
),
                ],
            
              ),
            ),
          ),
          CustomBottomAppBar(
            backgroundColor: bot,
             onIconTap: _onIconTap, selectedIndex: _selectedIndex,
             )
        ],
      ),
    );
  }
}
