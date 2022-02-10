import 'package:flutter/material.dart';
import 'package:pcari_contact/screens/profile/profile_edit_form.dart';
import 'package:pcari_contact/widgets/appbar_header_widget.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  bool isFavourite = false;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final contactList = ModalRoute.of(context)?.settings.arguments as Map;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBarHeader(),
          // resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(150)),
                              border: Border.all(
                                color: const Color(0xFF32BAA5),
                                width: 6,
                              )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 225, top: 212),
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF32BAA5),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child: Center(
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.all(30),
                      child: ProfileEditForm(
                        data: contactList,
                      )),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          )),
    );
  }
}
