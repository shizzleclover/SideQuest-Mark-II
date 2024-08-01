import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidequest_mark_ii/constants.dart';
import 'package:sidequest_mark_ii/widgets/bottomnavbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);

    // Function to handle icon tap and navigation
    void _onIconTap(int index) {
      setState(() {
        _selectedIndex = index;
      });
      // Handle icon tap and navigation here
      // Example:
      // if (index == 0) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen()));
      // }
    }

    return Scaffold(
      backgroundColor: back,

      // Side drawer configuration
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                'Sidebar',
                style: TextStyle(color: Colors.white, fontSize: 24.sp),
              ),
            ),
            ListTile(
              title: Text('Item 1', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              title: Text('Item 2', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            // Add more ListTiles as needed
          ],
        ),
      ),

      // Main body of the page
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w), // Use ScreenUtil
              child: Column(
                children: [
                  SizedBox(height: 60.h), // Use ScreenUtil

                  // Header row with drawer icon, title, and SVG icon
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer(); // Open the drawer
                        },
                        child: Container(
                          height: 40.h, // Use ScreenUtil
                          width: 40.h, // Use ScreenUtil
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100.r), // Use ScreenUtil
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w), // Use ScreenUtil
                      Text(
                        'Hello, Clover',
                        style: TextStyle(color: Colors.white, fontSize: 24.sp), // Use ScreenUtil
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/icons/', // Ensure correct path
                        height: 50.h, // Use ScreenUtil
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h), // Use ScreenUtil

                  // Scrollable row for categories
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildCategoryContainer(80.w, 35.h),
                        _buildCategoryContainer(80.w, 35.h),
                        _buildCategoryContainer(120.w, 35.h),
                        _buildCategoryContainer(160.w, 35.h),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h), // Use ScreenUtil

                  // Section for 'courses' title and separator
                  _buildSectionTitle('courses'),

                  // Scrollable row for course containers
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildCourseContainer(220.w, 160.h, cont2),
                        SizedBox(width: 5.w), // Use ScreenUtil
                        _buildCourseContainer(220.w, 160.h, gen4),
                        SizedBox(width: 5.w), // Use ScreenUtil
                        _buildCourseContainer(220.w, 160.h, cont2),
                        SizedBox(width: 5.w), // Use ScreenUtil
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h), // Use ScreenUtil

                  // Another section for 'courses' title and separator
                  _buildSectionTitle('Lectures'),

                  // Scrollable row for more course containers
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildCourseContainer(220.w, 160.h, cont2),
                        SizedBox(width: 5.w), // Use ScreenUtil
                        _buildCourseContainer(220.w, 160.h, gen),
                        SizedBox(width: 5.w), // Use ScreenUtil
                        _buildCourseContainer(220.w, 160.h, gen4),
                        SizedBox(width: 5.w), // Use ScreenUtil
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h), // Use ScreenUtil

                  // Final section for 'courses' title and separator
                  _buildSectionTitle('Activities'),

                  // Scrollable row for final set of course containers
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildCourseContainer(330.w, 150.h, cont2),
                        SizedBox(width: 5.w),
                        _buildCourseContainer(330.w, 150.h, cont2),
                        SizedBox(width: 5.w),
                        _buildCourseContainer(330.w, 150.h, cont2),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h), // Use ScreenUtil

                  // Final section for 'Activities' title and separator
                  _buildSectionTitle('Friends'),

                  // Scrollable row for final set of course containers
                  SingleChildScrollView(
                    
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildCourseContainer(180.w, 200.h, cont2),
                        SizedBox(width: 5.w),
                       _buildCourseContainer(180.w, 200.h, cont2),
                        SizedBox(width: 5.w),
                         _buildCourseContainer(180.w, 200.h, cont2),
                      ],
                    ),
                  ),
                  SizedBox(height: 60.h), // Adjust height as needed to ensure content doesn't overlap with bottom app bar
                ],
              ),
            ),
          ),
          // Custom bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomAppBar(
              backgroundColor: bot,
              onIconTap: _onIconTap,
              selectedIndex: _selectedIndex,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create category containers
  Widget _buildCategoryContainer(double width, double height) {
    return Container(
      width: width, // Use ScreenUtil
      height: height, // Use ScreenUtil
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(50.r), // Use ScreenUtil
      ),
    );
  }

  // Helper method to create course containers
  Widget _buildCourseContainer(double width, double height, Color color) {
    return Container(
      width: width, // Use ScreenUtil
      height: height, // Use ScreenUtil
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r), // Use ScreenUtil
        color: color,
      ),
    );
  }

  // Helper method to create section titles and separators
  Widget _buildSectionTitle(String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.grey, fontSize: 20.sp), // Use ScreenUtil
            )
          ],
        ),
        SizedBox(height: 10.h), // Add space below the title
      ],
    );
  }
}
