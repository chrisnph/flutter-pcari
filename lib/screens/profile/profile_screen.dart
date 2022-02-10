import 'package:flutter/material.dart';
import 'package:pcari_contact/screens/profile/profile_overview.dart';
import 'package:pcari_contact/widgets/appbar_header_widget.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Scaffold(
        appBar: AppBarHeader(),
        body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18,
            ),
            child: ProfileOverview()),
      )),
    );
  }
}
