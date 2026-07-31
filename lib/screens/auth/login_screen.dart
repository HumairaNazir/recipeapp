import 'package:flutter/material.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/outline_btn_widget.dart';
import '../../widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  static const Color _bgColor = Color(0xFFFFA726);
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_bgColor, Colors.white70],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/login.png',
                      height: 180,
                      fit: BoxFit.contain,
                    ),
                  ),

                  Text('Welcome Back', style: twentyEight700TextStyle()),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to save your favourite recipes and sync them across devices',
                    textAlign: TextAlign.center,
                    style: eighteen400TextStyle(),
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Email",
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    obscureText: _obscureText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password? ',
                        style: underlineTextStyle(color: Colors.deepOrange),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ButtonWidget(text: 'Sign In'),

                  const SizedBox(height: 28),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'OR',
                          style: fourteen600TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  OutlineButtonWidget(
                    text: 'Continue as Guest',
                    textColor: Colors.deepOrange,
                    icon: Icons.person,
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  OutlineButtonWidget(
                    text: 'Continue With Google',
                    imagePath: 'assets/images/google.png',
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an Account? ',
                        style: fourteen600TextStyle(color: Colors.grey),
                      ),
                      Text(
                        ' Sign Up',
                        style: fourteen600TextStyle(color: Colors.deepOrange),
                      ),
                    ],
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
