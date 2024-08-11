// ignore_for_file: avoid_print, library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sidequest_mark_ii/Screens/Accounts/login.dart';
import 'package:sidequest_mark_ii/Screens/Main%20Screens/main.dart';
import 'package:sidequest_mark_ii/utils/constants/colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  bool _isLoading = false;

  // SignUp user
 // SignUp user
// SignUp user
// SignUp user
Future<void> signUp() async {
  setState(() {
    _isLoading = true;
  });

  try {
    // ignore: unused_local_variable
    final response = await Supabase.instance.client.auth.signUp(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      data: {'username': _usernameController.text.trim()},
    );

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  } on PlatformException catch (e) {
    // Print the error message to the console
    print(e.message);
    // Show an error dialog to the user
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(e.message!),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  } catch (e) {
    // Print any other exceptions that occur
    print(e);
  } finally {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:SideQuestColors.blc ,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Create \nAccount',
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
                  Container(
                    width: 340.w,
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
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(right: 150.w),
                    child: const Text('Username-Create one', style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    width: 340.w,
                    child: TextFormField(
                      controller: _usernameController,
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
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.only(right: 200.w),
                    child: Text('Password', style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    width: 340.w,
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: '**********',
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
                    onTap: () {
                      signUp(); // Call the sign-up method here
                    },
                    child: Container(
                      height: 54.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: SideQuestColors.gen,
                        borderRadius: BorderRadius.circular(5.0.r),
                      ),
                      child: Center(
                        child: Text('Create an account', style: TextStyle(fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: Text('Login', style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
