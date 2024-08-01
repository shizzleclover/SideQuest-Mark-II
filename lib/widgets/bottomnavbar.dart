import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidequest_mark_ii/Main%20Screens/main.dart';
import 'package:sidequest_mark_ii/Main%20Screens/searchpage.dart';
import 'package:sidequest_mark_ii/ProfilePage/main_profile_page.dart';
import 'package:sidequest_mark_ii/tasks/calender.dart';
import 'package:sidequest_mark_ii/tasks/news.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Color backgroundColor;
  final Function(int) onIconTap;
  final int selectedIndex; // New parameter for the selected index

  CustomBottomAppBar({
    required this.backgroundColor,
    required this.onIconTap,
    required this.selectedIndex, // Initialize the parameter
  });

  @override
  Widget build(BuildContext context) {
    // Ensure ScreenUtil is initialized in the main entry point
    ScreenUtil.init(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h), // Add padding to create space from the screen edges
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 5),
            ),
          ],
        ),
        height: 45.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: selectedIndex == 0 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                onIconTap(0);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: selectedIndex == 1 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                onIconTap(1);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Searchpage()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: selectedIndex == 2 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                onIconTap(2);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.message,
                color: selectedIndex == 3 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                onIconTap(3);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalenderPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: selectedIndex == 4 ? Colors.white : Colors.grey,
              ),
              onPressed: () {
                onIconTap(4);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
