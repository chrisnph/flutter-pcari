import 'package:flutter/material.dart';
import 'button_navbar_widget.dart';
import 'package:provider/provider.dart';
import 'package:pcari_contact/providers/contact_provider.dart';

class NavBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String contactType = context.watch<Contacts>().type;

    return ListTile(
      title: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: <Widget>[
            NavButton(
              title: 'All',
              active: contactType == 'All' || false,
              callback: () => context.read<Contacts>().toggleType('All'),
            ),
            const SizedBox(width: 20),
            NavButton(
              title: 'Favourite',
              active: contactType != 'All' || false,
              callback: () => context.read<Contacts>().toggleType('Favourite'),
            ),
          ],
        ),
      ),
    );
  }
}
