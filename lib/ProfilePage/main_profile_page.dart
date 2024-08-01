import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidequest_mark_ii/ProfilePage/profile_settings.dart';
import 'package:sidequest_mark_ii/constants.dart';
import 'package:sidequest_mark_ii/widgets/bottomnavbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedTabIndex = 0; // Variable to track selected tab

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    void _onIconTap(int index) {
      setState(() {
        _selectedTabIndex = index;
      });
    }

    return Scaffold(
      backgroundColor: back,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 55.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileSettings()),
                          );
                        },
                        icon: SvgPicture.asset('Assets/Icons/gear.svg'),
                      ),
                      SizedBox(width: 90.w),
                      Text(
                        "My Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 90.w),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset('Assets/Icons/bell2.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          height: 200.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: gen),
                            borderRadius: BorderRadius.circular(150.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ClipOval(
                              child: CircleAvatar(
                                radius: 150.0 - 8.0,
                                backgroundImage: AssetImage('Assets/Images/me.jpg'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'John Doe',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    children: [
                      Container(
                        height: 77,
                        width: 344,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Row(
                            children: [
                              Container(
                                height: 57,
                                width: 53.6,
                                decoration: BoxDecoration(
                                  color: gen,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: SvgPicture.asset('Assets/Icons/doc.svg'),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "CV_The_Clovers",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "Views 39",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 57,
                                width: 53.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: SvgPicture.asset('Assets/Icons/down.svg'),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Container(
                                height: 57,
                                width: 53.6,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: SvgPicture.asset('Assets/Icons/share.svg'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white),
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          left: _selectedTabIndex * (ScreenUtil().setWidth(100) + 20.w),
                          top: 0,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 50,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: gen,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildTab('Statistics', 0),
                            _buildTab('Portfolio', 1),
                            _buildTab('Challenges', 2),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  _buildContent(_selectedTabIndex),
                  SizedBox(height: 70.h), // Space to ensure content doesn't overlap with bottom app bar
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomAppBar(
              backgroundColor: bot,
              onIconTap: _onIconTap,
              selectedIndex: _selectedTabIndex,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Text('Statistics Content', style: TextStyle(color: Colors.white))),
        );
      case 1:
        return Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Text('Portfolio Content', style: TextStyle(color: Colors.white))),
        );
      case 2:
        return Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Text('Challenges Content', style: TextStyle(color: Colors.white))),
        );
      default:
        return Container();
    }
  }
}
