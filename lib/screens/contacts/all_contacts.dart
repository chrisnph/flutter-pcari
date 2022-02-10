import 'package:flutter/material.dart';
import 'package:pcari_contact/widgets/slidable_widget.dart';
import 'contact_list_tile_screen.dart';

Widget allContacts(request, contactList) {
  return Expanded(
    child: ListView.builder(
      padding: const EdgeInsets.only(bottom: 50),
      shrinkWrap: true,
      itemCount: contactList.length,
      itemBuilder: (context, index) {
        return SlidableWidget(
          child: buildListTile(context, contactList[index]),
          onPressed: () {},
          item: contactList[index],
          request: request,
        );
      },
    ),
  );
}
