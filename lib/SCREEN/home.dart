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
                  label: 'login',
                  onPressed: () => Navigator.pushNamed(context, '/login_page'),
                  borderColor: Colors.black,
                  backgroundColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                // backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 100.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    side: const BorderSide(color: Colors.grey, width: 1.0)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/register_page');
              },
              child: const Text(
                'Login with Google',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
