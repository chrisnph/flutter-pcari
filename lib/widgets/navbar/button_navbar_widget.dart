import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final bool active;

  const NavButton({
    required this.title,
    required this.callback,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: 'Raleway',
          color: active ? Colors.white : Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: active ? const Color(0xFF32BAA5) : Colors.white,
        elevation: 5.0,
      ),
    );
  }
}
