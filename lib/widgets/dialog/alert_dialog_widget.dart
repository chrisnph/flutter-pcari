import 'package:flutter/material.dart';
import 'button_widget.dart';
import 'package:pcari_contact/providers/contact_provider.dart';

class AlertDialogWidget extends StatelessWidget {
  final String? textTitle;
  final String textContent;
  final Function(dynamic, dynamic, dynamic) continueAction;
  final Map<dynamic, dynamic> item;
  final Contacts request;
  final dynamic showSnackbar;

  const AlertDialogWidget({
    this.textTitle,
    required this.textContent,
    required this.continueAction,
    required this.request,
    required this.item,
    required this.showSnackbar,
  });

  @override
  Widget build(BuildContext context) => ButtonWidget(
        text: 'Alert Dialog',
        onClicked: () => showAlertDialog(context),
      );

  void showAlertDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          title: Text(textTitle ?? ""),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  textContent,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF000000),
                    fontFamily: 'Raleway',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Container(
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                border:
                    Border(top: BorderSide(width: 2, color: Color(0xFFDCDCDC))),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                        right: BorderSide(width: 2, color: Color(0xFFDCDCDC)),
                      )),
                      child: TextButton(
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                              color: Color(0xFFFD1313),
                              fontFamily: 'Raleway',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () async {
                          bool isContinued = await continueAction(
                              context, request, item['id']);
                          Navigator.of(context).pop();

                          if (isContinued) {
                            showSnackbar(context);
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      child: const Text(
                        'No',
                        style: TextStyle(
                            color: Color(0xFF32BAA5),
                            fontFamily: 'Raleway',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
