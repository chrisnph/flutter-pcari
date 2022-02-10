import 'package:pcari_contact/utilities/send_email_utility.dart';
import 'package:flutter/material.dart';

Widget buildListTile(context, contactList) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 16.0,
    ),
    leading: CircleAvatar(
      radius: 28.0,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/loading.gif',
          image: contactList['avatar'],
          fit: BoxFit.cover,
        ),
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(
                      '${contactList["first_name"]} ${contactList["last_name"]} ',
                      style: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    contactList['favourite']
                        ? const Icon(
                            Icons.star,
                            color: Color(0xFFF2C94C),
                          )
                        : const SizedBox(),
                    const SizedBox(height: 4.0),
                  ]),
                  const SizedBox(height: 8.0),
                  Text(
                    contactList['email'],
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => utilitySendEmail(contactList['email']),
                child: const Image(
                  image: AssetImage('assets/images/frame.png'),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    onTap: () {
      Navigator.pushNamed(
        context,
        '/profile',
        arguments: contactList,
      );
    },
  );
}
