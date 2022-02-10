import 'package:flutter/material.dart';
import 'package:pcari_contact/utilities/contact_utility.dart';
import 'package:pcari_contact/widgets/snackbar_widget.dart';

class ProfileEditForm extends StatefulWidget {
  final dynamic data;

  const ProfileEditForm({
    Key? key,
    required this.data,
  });

  @override
  State<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController =
        TextEditingController(text: widget.data['first_name']);
    TextEditingController lastNameController =
        TextEditingController(text: widget.data['last_name']);
    TextEditingController emailController =
        TextEditingController(text: widget.data['email']);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'First Name',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFF32BAA5),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: firstNameController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                hintText: 'First Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "First Name can't be empty";
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Last Name',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFF32BAA5),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: lastNameController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                hintText: 'Last Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Last Name can't be empty";
              }
              return null;
            },
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Email',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color(0xFF32BAA5),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                hintText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email can't be empty";
              }
              return null;
            },
          ),
          const SizedBox(height: 50),
          Center(
            child: SizedBox(
              width: 360,
              height: 47,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF32BAA5),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    dynamic newContactInfo = {
                      'id': widget.data['id'],
                      'first_name': firstNameController.text,
                      'last_name': lastNameController.text,
                      'email': emailController.text,
                      'favourite': widget.data['favourite'],
                      'avatar': widget.data['avatar'],
                    };

                    bool isUpdated =
                        handleUpdateContact(context, newContactInfo);

                    if (isUpdated) {
                      SnackbarWidget.build(
                        context,
                        'Updated Contact',
                        'bottom',
                        const Color(0xCC32BAA5),
                      );
                    }

                    Navigator.popUntil(context, ModalRoute.withName('/'));

                    Navigator.pushNamed(
                      context,
                      '/profile',
                      arguments: newContactInfo,
                    );
                  }
                },
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
