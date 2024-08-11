import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sidequest_mark_ii/Screens/splashpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize Supabase
    await Supabase.initialize(
      url: 'https://tvijkvllbyjmlwqyqhsp.supabase.co', // Your Supabase URL
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR2aWprdmxsYnlqbWx3cXlxaHNwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjI1MjI3NDEsImV4cCI6MjAzODA5ODc0MX0.6McaFGWgjvpPdELAEjyEH6bFrhQyEszNpxGOLxbZHAs', // Your Supabase API Key
    );
    // ignore: avoid_print
    print("Supabase initialized successfully");
  } catch (e) {
    // ignore: avoid_print
    print("Error initializing Supabase: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        theme: ThemeData.light(),
        home: const SplashScreen(), // Ensure SplashScreen is defined
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
