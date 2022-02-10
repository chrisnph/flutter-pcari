import 'package:flutter/material.dart';

class SnackbarWidget {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> build(
      BuildContext context, text, position, backgroundColor) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor ?? Colors.grey,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        margin: position == 'top'
            ? EdgeInsets.fromLTRB(
                0,
                0,
                0,
                MediaQuery.of(context).size.height - 200,
              )
            : const EdgeInsets.fromLTRB(
                0,
                0,
                0,
                0,
              ),
        content: Container(
          width: double.infinity,
          margin: EdgeInsets.zero,
          decoration: const BoxDecoration(),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Raleway',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
