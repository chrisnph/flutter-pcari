import 'package:email_launcher/email_launcher.dart';

utilitySendEmail(emailAddress) async {
  Email email = Email(
    to: [emailAddress],
    cc: [''],
    bcc: [''],
    subject: '',
    body: '',
  );

  await EmailLauncher.launch(email);
}
