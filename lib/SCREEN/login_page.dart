import 'package:auth_page/SCREEN/homepagebutton.dart';
import 'package:auth_page/SERVICES/post_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final PostController _authController = PostController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
  String email = _emailController.text;
  String password = _passwordController.text;

  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please enter email and password"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
    return;
  }

  final response = await _authController.login({'email': email, 'password': password});

  if (response['statusCode'] == 401) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Invalid email or password"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  } else if (response['statusCode'] == 200) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login successful!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );

    // Navigate to the home page or dashboard after successful login
    // Navigator.pushReplacementNamed(context, '/home');
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Unexpected error occurred. Please try again."),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'E-mail',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Password',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                hintStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: GoogleButton(
                onPressed: _login,
                label: 'Login',
                textColor: Colors.white,
                backgroundColor: const Color(0xFF2B8761),
                borderColor: Colors.transparent,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const Text(
                    'Or Sign In with',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: GoogleButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/register_page'),
                      label: 'Login with Google',
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}






      // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(
                  //       color:
                  //           Colors.red), // Set the enabled border color to red
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(
                  //       color:Colors.red
                  //       ),
                  // ),