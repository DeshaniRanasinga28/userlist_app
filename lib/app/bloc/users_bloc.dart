import '../resources/users_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/users_response.dart';

class UersBloc{
  final _repository = Repository();

  final _usersFetcher = PublishSubject<UserseResponse>();

  Observable<UserseResponse> get allUsers => _usersFetcher.stream;

  fetchUsers() async{
    UserseResponse itemModel = await _repository.fetchUserList();
    _usersFetcher.sink.add(itemModel);
  }

}

final bloc = UersBloc();