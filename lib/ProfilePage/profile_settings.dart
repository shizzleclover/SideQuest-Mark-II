import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidequest_mark_ii/Accounts/login.dart';
import 'package:sidequest_mark_ii/constants.dart';
import 'package:sidequest_mark_ii/widgets/bottomnavbar.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  int _selectedIndex = 0; // Declare and initialize the variable

  void _onIconTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: back,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80.h), // Add padding equal to the bottom app bar height
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 55.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset('Assets/Icons/arrow.svg'),
                      ),
                      SizedBox(width: 90.w),
                      const Text(
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
                  // Image for the profile page
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
                          child: const Padding(
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
                        const Text(
                          'John Doe',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Edit Profile', style: TextStyle(color: Colors.white)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset('Assets/Icons/ios.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text('Support', style: TextStyle(color: Colors.white)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset('Assets/Icons/ios.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text('SideQuest +', style: TextStyle(color: Colors.white)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset('Assets/Icons/ios.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text('Edit Profile', style: TextStyle(color: Colors.white)),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset('Assets/Icons/ios.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(color: bord2, fontSize: 18.sp),
                    ),
                  ),
                  SizedBox(height: 130.h),
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
              selectedIndex: _selectedIndex,
            ),
          ),
        ],
      ),
    );
  }
}
