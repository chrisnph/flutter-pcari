import 'package:flutter/material.dart';
import 'button_widget.dart';

class CustomDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ButtonWidget(
        text: 'Custom Dialog',
        onClicked: () => showCustomDialog(context),
      );

  void showCustomDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => Column(
          children: [
            const SizedBox(height: 12.0),
            const Text('This is a Custom Dialog'),
            const SizedBox(height: 12.0),
            const Text('Custom Dialog Content'),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
}
