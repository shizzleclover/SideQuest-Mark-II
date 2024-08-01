// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthService {
//   final SupabaseClient _client = Supabase.instance.client;

//   // Register a new user
//   Future<String?> register(String email, String password) async {
//     final response = await _client.auth.signUp(email, password);
//     if (response.error != null) {
//       // Handle errors here
//       return response.error!.message;
//     }
//     return null;
//   }

//   // Log in an existing user
//   Future<String?> login(String email, String password) async {
//     final response = await _client.auth.signInWithPassword(
//       email: email,
//       password: password,
//     );
//     if (response.error != null) {
//       // Handle errors here
//       return response.error!.message;
//     }
//     return null;
//   }

//   // Log out the current user
//   Future<String?> logout() async {
//     final response = await _client.auth.signOut();
//     if (response.error != null) {
//       // Handle errors here
//       return response.error!.message;
//     }
//     return null;
//   }

//   // Get the current user
//   User? getCurrentUser() {
//     return _client.auth.currentUser;
//   }
// }
