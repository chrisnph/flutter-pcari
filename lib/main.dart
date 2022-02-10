import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pcari_contact/providers/contact_provider.dart';
// import 'package:pcari_contact/providers/profile_provider.dart';
import 'package:pcari_contact/screens/profile/profile_edit.dart';
import 'package:provider/provider.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/contacts/contacts_screen.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Contacts()),
      // ChangeNotifierProvider(create: (_) => ContactProfile()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyContacts(),
        '/profile': (context) => Profile(),
        '/profile/edit': (context) => const ProfileEdit(),
      },
    ),
  ));
}
