import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidequest_mark_ii/ProfilePage/profile_settings.dart';
import 'package:sidequest_mark_ii/constants.dart';
import 'package:sidequest_mark_ii/widgets/bottomnavbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    void _onIconTap(int index) {
      setState(() {
        _selectedIndex = index;
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
                  SizedBox(height: 10.h),
                  Container(
                    height: 300.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
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
              selectedIndex: _selectedIndex,
            ),
          ),
        ],
      ),
    );
  }
}
