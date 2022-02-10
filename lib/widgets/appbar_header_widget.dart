import 'package:flutter/material.dart';
import 'package:pcari_contact/providers/contact_provider.dart';
import 'package:provider/provider.dart';

class AppBarHeader extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<AppBarHeader> createState() => _AppBarHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarHeaderState extends State<AppBarHeader> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<Contacts>().loading;
    Contacts request = Provider.of<Contacts>(context);
    String? routeName = ModalRoute.of(context)?.settings.name;

    return AppBar(
      title: Text(
        ModalRoute.of(context)?.settings.name == '/'
            ? 'My Contacts'
            : 'Profile',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway',
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFF32BAA5),
      actions: [
        if (routeName == '/')
          Row(
            children: [
              isLoading
                  ? const Padding(
                      padding: EdgeInsets.only(right: 24),
                      child: SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      ),
                    )
                  : TextButton.icon(
                      onPressed: () async {
                        request.providerSetLoading(true);
                        await request.providerGetContacts(context);
                        request.providerSetLoading(false);
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                        size: 24,
                      ),
                      label: const Text(''),
                    )
            ],
          )
      ],
    );
  }
}
