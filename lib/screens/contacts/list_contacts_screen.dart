import 'package:flutter/material.dart';
import 'package:pcari_contact/providers/contact_provider.dart';
import 'package:pcari_contact/screens/contacts/all_contacts.dart';
import 'package:pcari_contact/utilities/contact_utility.dart';
import 'package:provider/provider.dart';

import 'favourite_contacts.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String contactType = context.watch<Contacts>().type;
    Contacts request = Provider.of<Contacts>(context);
    List contactList = request.searchedContact.data.isEmpty &&
            Provider.of<Contacts>(context).searchValue.isEmpty
        ? request.contact.data
        : request.searchedContact.data;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            contactList.isNotEmpty && contactType == 'All'
                ? allContacts(request, contactList)
                : favouriteContacts(request, contactType,
                    handleFilterFavouriteContact(contactList))
          ]),
    );
  }
}
