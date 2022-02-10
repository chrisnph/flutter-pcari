import 'package:flutter/material.dart';
import 'package:pcari_contact/screens/contacts/list_contacts_screen.dart';
import 'package:pcari_contact/widgets/searchbar/searchbar_widget.dart';
import '../../widgets/appbar_header_widget.dart';
import '../../widgets/navbar/layout_navbar_widget.dart';

class MyContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarHeader(),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 18.0, 25.0, 0.0),
            child: Column(
              children: [
                Expanded(child: SearchBarWidget()),
                Expanded(flex: 1, child: NavBarLayout()),
                Expanded(flex: 7, child: ContactList()),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () => {},
              child: const Icon(Icons.add),
              backgroundColor: const Color(0xFF32BAA5)),
        ),
      ),
    );
  }
}
