// ignore: file_names
import 'package:http/http.dart';
import 'dart:convert';

Future<dynamic> fetchImage() async {
  try {
    // make the request
    Response response = await get(
        Uri.parse('https://dev-gcjnx63q3ceamyw.api.raw-labs.com/app/shaastra'));
    return jsonDecode(response.body);
  } catch (e) {
    throw Exception('Failed to load Images');
  }
}
