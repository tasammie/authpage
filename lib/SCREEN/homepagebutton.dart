import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color textColor;
  final Color? backgroundColor;
  final Color? borderColor;

  const HomePageButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor = Colors.black,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(32.0),
        border: Border.all(color: borderColor!),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }
}

// class GoogleButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final Color textColor;
//   final Color? backgroundColor;
//   final Color borderColor;
//   final String label;

//   const GoogleButton({
//     super.key,
//     required this.onPressed,
//     this.textColor = Colors.black,
//     this.backgroundColor,
//     this.borderColor = Colors.grey,
//     required this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: backgroundColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(32.0),
//             side: BorderSide(color: borderColor, width: 1.0),
//             // side: BorderSide(color: borderColor ?? Colors.grey, width: 1.0),
//           ),
//         ),
//         onPressed: onPressed,
//         child: Text(
//           label,
//           style: TextStyle(color: textColor, fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
