import 'package:go_router/go_router.dart';
import 'package:cms_pda/widgets/gradient_elevate_button.dart';
import 'package:cms_pda/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _userController.dispose();
    super.dispose();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onLogin(BuildContext context) {
    print('username: ${_userController.text}');
    print('passwordk: ${_passwordController.text}');
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('科陆CMS'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0XFF209cff),
              Color.fromARGB(255, 75, 99, 214),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              fit: BoxFit.fitWidth,
              height: 160,
            ),
            const SizedBox(
              height: 36,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  LoginTextForm(
                    hintText: '用户名',
                    prefixIcon: Icons.person,
                    controller: _userController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  LoginTextForm(
                    hintText: '密码',
                    prefixIcon: Icons.lock,
                    controller: _passwordController,
                    suffixIcon: GestureDetector(
                      onTap: _toggleObscureText,
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
                    obscureText: _obscureText,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GradientElevatedButton(
                      onPressed: () => _onLogin(context),
                      linearGradient: const LinearGradient(
                        colors: [
                          Color(0xfff9d423),
                          Color(0xffff4e50),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(40),
                      child: const Text(
                        '登录',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// background-image: linear-gradient(to right, #f9d423 0%, #ff4e50 100%);