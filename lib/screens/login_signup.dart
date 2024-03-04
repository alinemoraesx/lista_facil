import 'package:flutter/material.dart';

import '../constants/colors.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  LoginSignupScreenState createState() => LoginSignupScreenState();
}

class LoginSignupScreenState extends State<LoginSignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleLoginSignup() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _submitForm() {
    // Implement your authentication logic here
    // For example, print the user input
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    print('Is Login: $_isLogin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.bg100,
      appBar: AppBar(
        backgroundColor: ColorsConstants.primary100,
        elevation: 0,
        title: Text(_isLogin ? 'Login' : 'Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text(_isLogin ? 'Login' : 'Signup'),
            ),
            SwitchListTile(
              title: const Text('Switch to Signup'),
              value: _isLogin,
              onChanged: (value) {
                _toggleLoginSignup();
              },
            ),
          ],
        ),
      ),
    );
  }
}
