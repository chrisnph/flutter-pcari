import 'package:flutter/material.dart';
import 'package:pcari_contact/providers/contact_provider.dart';
import 'package:pcari_contact/utilities/contact_utility.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Contacts request = Provider.of<Contacts>(context);
    String searchValue = request.searchValue;
    final contactList =
        searchValue.isEmpty && request.searchedContact.data.isEmpty
            ? request.contact.data
            : request.searchedContact.data;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          prefixIcon: searchValue.isEmpty
              ? const Icon(Icons.search, color: Color(0xFF32BAA5))
              : GestureDetector(
                  onTap: () => handleClearSearchContact(context, _controller),
                  child: const Icon(Icons.close, color: Color(0xFF32BAA5)),
                ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF32BAA5))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF32BAA5))),
          hintText: 'Search Contact',
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
        ),
        textAlign: TextAlign.left,
        onChanged: (value) {
          Provider.of<Contacts>(context, listen: false)
              .providerSetSearchValue(value);
          handleSearchContact(context, contactList);
        },
      ),
    );
  }
}
