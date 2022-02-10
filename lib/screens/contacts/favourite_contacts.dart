import 'package:flutter/material.dart';
import 'package:pcari_contact/widgets/slidable_widget.dart';

import 'contact_list_tile_screen.dart';

Widget favouriteContacts(request, contactType, contactList) {
  return contactList.isEmpty
      ? Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 50.0,
                bottom: 20.0,
              ),
              child: Image(
                image: AssetImage('assets/images/amico.png'),
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 167),
              child: Text(
                contactType == 'Favourite'
                    ? 'No list of contact here, add contact now'
                    : '',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      : Expanded(
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
