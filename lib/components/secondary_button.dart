import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SecondaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 48),
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(label,
                style: const TextStyle(
                  color: Color(0xFF1F3C88),
                )),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(
                  width: 1, color: Color(0xFF1F3C88)), //border width and color
              shape: RoundedRectangleBorder(
                  //to set border radius to button
                  borderRadius: BorderRadius.circular(5)),
            )),
      ),
    );
  }
}
