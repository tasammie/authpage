import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color textColor;
  final Color? backgroundColor;
  final Color borderColor;

  const HomePageButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor = Colors.black,
    this.backgroundColor,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 60.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
          side: BorderSide(color: borderColor),
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: textColor, fontSize: 20),
      ),
    );
  }
}



   // TextButton(
                //   style: TextButton.styleFrom(
                //     // backgroundColor: Colors.deepPurple,
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 18.0, horizontal: 60.0),
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(32.0),
                //         side: const BorderSide(color: Colors.black)),
                //   ),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/register_page');
                //   },
                //   child: const Text(
                //     'Register',
                //     style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 20,
                //     ),
                //   ),
                // ),
                // TextButton(
                //   style: TextButton.styleFrom(
                //     backgroundColor: Colors.green,
                //     padding: const EdgeInsets.symmetric(
                //         vertical: 18.0, horizontal: 60.0),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(32.0),
                //     ),
                //   ),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/login_page');
                //   },
                //   child: const Text(
                //     'Login',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 20,
                //     ),
                //   ),
                // ),
