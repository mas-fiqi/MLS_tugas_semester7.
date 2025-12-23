import 'package:flutter/material.dart';
import 'package:learning_management_system/core/constants/colors.dart';
import 'package:learning_management_system/features/authentication/presentation/widgets/login_clipper.dart';
import 'package:learning_management_system/features/home/presentation/pages/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
        width: double.infinity,
        color: kBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo / Icon
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    size: 64,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Title
                const Text(
                  "LMS Hybrid",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                 Text(
                  "Welcome back, Future Leader!",
                  style: TextStyle(
                    fontSize: 14,
                    color: kSubtitleColor.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 48),

                // Inputs are handled by InputDecorationTheme in app_theme.dart, so we just use standard fields
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: "Email / NIP / NIM",
                  ),
                  style: const TextStyle(color: kTextColor),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: _isObscure,
                  style: const TextStyle(color: kTextColor),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: kSubtitleColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                
                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement Forgot Password Logic
                    },
                    child: Text(
                      "Lupa Password?",
                      style: TextStyle(color: kPrimaryColor.withOpacity(0.8)),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text(
                      "MASUK",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
