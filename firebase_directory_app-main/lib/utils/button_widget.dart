import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color = Colors.blue,
  }) : super(key: key);

  final String title;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          primary: color,
          elevation: 5,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
