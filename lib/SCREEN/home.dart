import 'package:auth_page/SCREEN/homepagebutton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomePageButton(
                  label: 'Register',
                  onPressed: () =>
                      Navigator.pushNamed(context, '/register_page'),
                  borderColor: Colors.black,
                ),
                HomePageButton(
                  label: 'Login',
                  onPressed: () => Navigator.pushNamed(context, '/login_page'),
                  backgroundColor: const Color(0xFF2B8761),
                  textColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: GoogleButton(
                onPressed: () => Navigator.pushNamed(context, '/register_page'),
                label: 'Login with Google',
                textColor: Colors.black,
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
