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

    // Initialize ScreenUtil
    ScreenUtil.init(context);

    // Function to handle icon tap and navigation
    void _onIconTap(int index) {
      // Handle icon tap and navigation
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
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                children: [
                  SizedBox(height: 50.h),
                    CustomTextField(
                    hintText: 'Search', 
                    iconPath: 'Assets/Icons/search.svg',  // Provide the correct path to your SVG
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Popular Searches',
                    style: TextStyle(color: Colors.white, fontSize: 18.sp),
                  ),
                  SizedBox(height: 10.h),
                  // Example list of popular searches
                  _buildPopularSearches(),
                  SizedBox(height: 60.h), // Space before the bottom app bar
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
        backgroundColor: bot,
        onIconTap: _onIconTap,
        selectedIndex: _selectedIndex,
      ),
    );
  }

  Widget _buildPopularSearches() {
    // Example popular searches
    final List<String> popularSearches = [
      'Flutter Development',
      'Dart Programming',
      'Mobile App Design',
      'UI/UX Best Practices',
      'Tech News',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: popularSearches.map((search) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            search,
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
        );
      }).toList(),
    );
  }
}
