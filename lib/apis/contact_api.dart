import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pcari_contact/models/contact_model.dart';

Future<ContactModel> apiFetchContacts() async {
  ContactModel? result;
  String uri = dotenv.env['API_URL'] ?? "";

  final response = await http.get(
    Uri.parse(uri),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );

  Map<String, dynamic> _response = json.decode(response.body);

  try {
    _response['code'] = response.statusCode;

    if (response.statusCode != 200) {
      _response['reason'] = 'failed to fetch contacts';
    }

    result = ContactModel.fromJson(_response);
  } catch (e) {
    _response['code'] = response.statusCode;
    _response['reason'] = e;

    result = ContactModel.fromJson(_response);
  }

  // hardcode
  result.data.asMap().forEach((index, contact) {
    index % 2 == 1 ? contact['favourite'] = true : contact['favourite'] = false;
  });

  return result;
}

Future<ContactModel> apiDeleteContacts(userId) async {
  ContactModel result;
  String uri = '${dotenv.env["API_URL"]}/$userId';

  final response = await http.delete(
    Uri.parse(uri),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );

  // hardcode
  Map<String, dynamic> _response = {
    "page": 1,
    "per_page": 6,
    "total": 12,
    "total_pages": 2,
    "data": []
  };

  try {
    _response['code'] = response.statusCode;

    if (_response['code'] != 204) {
      _response['reason'] = 'failed to delete contact';
    }

    result = ContactModel.fromJson(_response);
  } catch (e) {
    _response['code'] = response.statusCode;
    _response['reason'] = e;

    result = ContactModel.fromJson(_response);
  }

  return result;
}
