// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
// import 'package:login_fenix/models/login.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../util/login.dart';

class LoginService {
  final storage = const FlutterSecureStorage();

  Future<bool> login(String username, String password) async {
    print(username);
    print(password);
    // var url =
    //     Uri.https('api-develop.solopcloud.com', 'api/adempiere/user/login');
    // var response = await http
    //     .post(url, body: {'user_name': username, 'user_pass': password});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    // print(await http.read(Uri.https('example.com', 'foobar.txt')));
    final url =
        Uri.http('api-develop.solopcloud.com', 'api/adempiere/user/login');
    final resp = await http
        .post(url, body: {'username': username, 'password': password});
    print(resp);
    // return false;
    final response = loginFromJson(resp.body);
    final code = response.code;
    final result = response.result;
    print(response);
    print(code);
    if (code == 200) {
      return true;
    } else {
      print(result);
      return false;
    }
  }
}
