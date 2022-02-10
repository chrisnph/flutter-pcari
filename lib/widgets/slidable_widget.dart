import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pcari_contact/providers/contact_provider.dart';
import 'package:pcari_contact/widgets/dialog/alert_dialog_widget.dart';
import 'package:pcari_contact/utilities/contact_utility.dart';
import 'package:pcari_contact/widgets/snackbar_widget.dart';

class SlidableWidget<T> extends StatelessWidget {
  final Map item;
  final Contacts request;
  final Widget child;
  final VoidCallback? onPressed;

  const SlidableWidget({
    Key? key,
    required this.item,
    required this.child,
    required this.request,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        closeOnScroll: true,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 1,
              backgroundColor: const Color(0xFFEBF8F6),
              foregroundColor: const Color(0xFFF2C94C),
              icon: Icons.edit,
              onPressed: (context) => Navigator.pushNamed(
                  context, '/profile/edit',
                  arguments: item),
            ),
            const SizedBox(width: 3.0),
            SlidableAction(
                flex: 1,
                backgroundColor: const Color(0xFFEBF8F6),
                foregroundColor: const Color(0xFFFA0F0F),
                icon: Icons.delete,
                onPressed: (dialogontext) {
                  AlertDialogWidget(
                    textContent:
                        'Are you sure you want to remove contact (${item["first_name"]} ${item["last_name"]})?',
                    continueAction: handleDeleteContact,
                    showSnackbar: showSnackbar,
                    request: request,
                    item: item,
                  ).showAlertDialog(context);
                }),
          ],
        ),
        child: child,
      );

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
      context) {
    return SnackbarWidget.build(
      context,
      'Contact Removed',
      'top',
      const Color(0xFFFD1313),
    );
  }
}
