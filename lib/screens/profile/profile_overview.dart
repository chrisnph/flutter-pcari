import 'package:flutter/material.dart';
import 'package:pcari_contact/utilities/contact_utility.dart';
import 'package:pcari_contact/utilities/send_email_utility.dart';
import 'package:pcari_contact/widgets/snackbar_widget.dart';

class ProfileOverview extends StatefulWidget {
  @override
  State<ProfileOverview> createState() => _ProfileOverviewState();
}

class _ProfileOverviewState extends State<ProfileOverview> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    Map contactList = ModalRoute.of(context)?.settings.arguments as Map;
    isFavourite = handleCheckFavourite(context, contactList['id']);
    print(contactList);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/profile/edit',
                arguments: contactList),
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'Edit',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF32BAA5),
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Stack(
          children: [
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    color: const Color(0xFF32BAA5),
                    image: DecorationImage(
                      image: NetworkImage(contactList['avatar']),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(150)),
                    border: Border.all(
                      color: const Color(0xFF32BAA5),
                      width: 6,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 225, top: 212),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        handleToggleFavourite(context, contactList['id']);
                        setState(() {
                          isFavourite = !isFavourite;
                        });

                        SnackbarWidget.build(
                          context,
                          isFavourite
                              ? 'Added to Favourites'
                              : 'Removed from Favourites',
                          'bottom',
                          const Color(0xCCF2C94C),
                        );
                      },
                      child: Icon(
                        isFavourite ? Icons.star : Icons.star_border,
                        color: const Color(0xFFF2C94C),
                        size: 50,
                      ),
                    )),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Center(
            child: Text(
          '${contactList['first_name']} ${contactList['last_name']}',
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )),
        const SizedBox(height: 30),
        Container(
          width: double.infinity,
          color: const Color(0xFFF1F1F1),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Image(image: AssetImage('assets/images/group.png')),
              const SizedBox(height: 15),
              Text(contactList['email']),
              const SizedBox(height: 30),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: SizedBox(
            width: 360,
            height: 47,
            child: TextButton(
              onPressed: () => utilitySendEmail(contactList['email']),
              child: const Text('Send Email',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF32BAA5)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
