import 'package:flutter/material.dart';
import 'package:pcari_contact/apis/contact_api.dart';
import 'package:pcari_contact/models/contact_model.dart';

class Contacts with ChangeNotifier {
  String _type = 'All';
  bool loading = false;
  String searchValue = '';
  String get type => _type;
  ContactModel contact = ContactModel(data: []);
  ContactModel searchedContact = ContactModel(data: []);

  void toggleType(val) {
    _type = val;

    notifyListeners();
  }

  void providerSetLoading(val) {
    loading = val;

    notifyListeners();
  }

  void providerSetSearchValue(val) {
    searchValue = val;

    notifyListeners();
  }

  providerGetContacts(context) async {
    loading = true;
    contact = await apiFetchContacts();
    loading = false;

    notifyListeners();
  }

  void providerSetContacts(context) {
    loading = true;
    contact = ContactModel(data: context);
    loading = false;

    notifyListeners();
  }

  providerSetSearchedContacts(context) {
    loading = true;
    searchedContact = ContactModel(data: context);
    loading = false;

    notifyListeners();
  }

  providerDeleteContacts(context) async {
    loading = true;
    contact = await apiFetchContacts();
    loading = false;

    notifyListeners();
  }
}
