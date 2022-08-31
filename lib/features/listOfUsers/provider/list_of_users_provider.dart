import 'package:floward_project/data/api.dart';
import 'package:get/get.dart';

import '../../../data/api_basic_helper.dart';
import '../model/userData.dart';

class ListOfUsersProvider extends GetConnect {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  Future<List<UserData>> getListOfUsers() async {
    var response = await apiBaseHelper.get(API.listOfUsers);
    return Future.value(listOfUsersFromJson(response));
  }
}
