import 'package:flutter/material.dart';
import 'package:pcari_contact/apis/contact_api.dart';
import 'package:pcari_contact/providers/contact_provider.dart';
import 'package:provider/provider.dart';

Future<bool> handleDeleteContact(context, request, userId) async {
  final response = await apiDeleteContacts(userId);

  try {
    if (response.reason == null) {
      final contactList = request.contact.data;
      final newContactList =
          contactList.where((contact) => contact['id'] != userId).toList();

      request.providerSetContacts(newContactList);

      return true;
    } else {
      return Future.error({'error': response.reason});
    }
  } catch (e) {
    return Future.error({'error': e});
  }
}

handleFilterFavouriteContact(contactList) {
  return contactList.isEmpty
      ? []
      : contactList.where((contact) => contact['favourite'] == true).toList();
}

handleSearchContact(context, contactList) {
  final searchValue = Provider.of<Contacts>(context, listen: false).searchValue;

  final searchedContact = (contactList.isEmpty || searchValue.isEmpty)
      ? []
      : contactList
          .where((contact) =>
              contact['first_name'].contains(searchValue) ||
              contact['last_name'].contains(searchValue) ||
              contact['email'].contains(searchValue))
          .toList();

  Provider.of<Contacts>(context, listen: false)
      .providerSetSearchedContacts(searchedContact);

  Provider.of<Contacts>(context, listen: false)
      .providerSetSearchValue(searchValue);
}

handleClearSearchContact(
  context,
  _controller,
) {
  _controller.clear();
  Provider.of<Contacts>(context, listen: false).providerSetSearchValue('');
  Provider.of<Contacts>(context, listen: false).providerSetSearchedContacts([]);
  FocusScope.of(context).unfocus();
}

handleToggleFavourite(context, contactId) {
  Contacts request = Provider.of<Contacts>(context, listen: false);
  final contactList = request.contact.data;

  for (var contact in contactList) {
    if (contact['id'] == contactId) {
      contact['favourite'] = !contact['favourite'];
    }
  }

  request.providerSetContacts(contactList);
  handleFilterFavouriteContact(contactList);
}

handleCheckFavourite(context, contactId) {
  dynamic contact = Provider.of<Contacts>(context, listen: false)
      .contact
      .data
      .where((contact) => contact['id'] == contactId)
      .toList();

  return contact[0]['favourite'];
}

handleUpdateContact(context, contactInfo) {
  Contacts request = Provider.of<Contacts>(context, listen: false);
  final contactList = request.contact.data;

  for (var contact in contactList) {
    if (contact['id'] == contactInfo['id']) {
      contact['first_name'] = contactInfo['first_name'];
      contact['last_name'] = contactInfo['last_name'];
      contact['email'] = contactInfo['email'];
      // contact['favourite'] = contactInfo['favourite'];
      // contact['avatar'] = contactInfo['avatar'];
    }
  }

  request.providerSetContacts(contactList);
  handleFilterFavouriteContact(contactList);

  return true;
}
