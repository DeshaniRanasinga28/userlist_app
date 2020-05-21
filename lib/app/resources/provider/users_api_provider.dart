import 'dart:async';
import 'dart:convert';
import 'package:userlistapp/app/util/util_api.dart';
import '../../models/users_response.dart';
import 'package:http/http.dart' show Client;

class UsersApiProvider {
  Client client = Client();

  Future<UserseResponse> fetchUserList() async {
    final response = await client.get(UtilApi.userUrl);
    if (response.statusCode == 200) {
      print("object ${json.decode(response.body)}");
      return UserseResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to load post');
    }
  }
}

