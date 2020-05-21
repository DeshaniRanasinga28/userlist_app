import 'dart:async';
import '../models/users_response.dart';
import 'provider/users_api_provider.dart';

class Repository{
  final usersApiProvider = UsersApiProvider();

  Future<UserseResponse> fetchUserList () => usersApiProvider.fetchUserList();
}