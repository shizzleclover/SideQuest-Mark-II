// ignore_for_file: avoid_print, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sidequest_mark_ii/Screens/Accounts/signup.dart';
import 'package:sidequest_mark_ii/Screens/Main%20Screens/main.dart';
import 'package:sidequest_mark_ii/utils/constants/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
Future<void> signIn() async{
try{
        await Supabase.instance.client.auth.signInWithPassword(password: _passwordController.text.trim(), 
        email: _emailController.text.trim(),
        
        );
        if(!mounted) return;
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
    } on AuthException catch(e){
      print(e);
    }
}

  bool _isLoading = false;

  void _login() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      print("Login Successful");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SideQuestColors.blc,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 170.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login to your \naccount',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'play',
                  fontSize: 30.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.only(right: 220.w),
                child: const Text('Email', style: TextStyle(color: Colors.white)),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 340.w, // Use ScreenUtil width
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.only(right: 200.w),
                child: const Text('Password', style: TextStyle(color: Colors.white)),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 340.w, // Use ScreenUtil width
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: '*****',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0.r),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: signIn,
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: SideQuestColors.gen,
                    borderRadius: BorderRadius.circular(5.0.r),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: SideQuestColors.gen,
                  borderRadius: BorderRadius.circular(5.0.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0), // Adjust padding as needed
                      child: SvgPicture.asset('Assets/Icons/google.svg'),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Login with Google',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black, // Adjust the text color as needed
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 10.w),
                    GestureDetector(  onTap: () {
                        Navigator.push(
                          context,
                           MaterialPageRoute(builder: (context) => const SignupPage()),);
                    } ,
                    child:  const Text('Register', style: TextStyle(color: Colors.red))),
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
