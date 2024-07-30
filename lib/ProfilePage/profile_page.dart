import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sidequest_mark_ii/Accounts/login.dart';
import 'package:sidequest_mark_ii/constants.dart';
import 'package:sidequest_mark_ii/widgets/bottomnavbar.dart';
 

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: back,
       body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(children: [
            SizedBox(height: 55.h),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  icon:SvgPicture.asset('Assets/Icons/gear.svg'),),

                  SizedBox(width: 90.w,),
                  Text("My Profile", style: TextStyle(color: Colors.white),),
                   SizedBox(width: 90.w,),
                    IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  icon:SvgPicture.asset('Assets/Icons/bell2.svg'),),
               ],
            ),
SizedBox(width: 90.w,),
SizedBox(height: 30.h,),
Center(
  child: Column(
    children: [
      Container(
        height: 100.0,  // Adjust to your desired height
        width: 100.0,   // Adjust to your desired width
        decoration: BoxDecoration(
          border: Border.all(color: gen), // Replace 'Colors.blue' with your color
          borderRadius: BorderRadius.circular(50.0), // Half of the height/width for a circle
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0), // Adjust the padding to control the gap between the border and the image
          child: ClipOval(
            child: CircleAvatar(
              radius: 50.0 - 8.0, // Subtract padding from radius to keep image centered
              backgroundImage: AssetImage('Assets/Images/me.jpg'), // Correct usage of AssetImage
            ),
          ),
        ),
      ),
      SizedBox(height: 30.h,),
      Text('John Doe', style: TextStyle(color: Colors.white),)
    ],
  ),
),


          ],
          ),
        ),
       ),
      
        );
  }
}
