import 'package:floward_project/features/listOfUsers/model/userData.dart';
import 'package:floward_project/features/listOfUsers/provider/list_of_users_provider.dart';
import 'package:get/get.dart';

import '../../../config/app_routes.dart';
import '../../../config/const.dart';

class ListOfUsersController extends GetxController
    with StateMixin<List<UserData>> {
  static ListOfUsersController get to => Get.find();
  ListOfUsersProvider listOfUsersProvider;

  ListOfUsersController(this.listOfUsersProvider);

  @override
  void onInit() async {
    super.onInit();
    getListOfUsers();
  }

  Future<void> getListOfUsers() async {
    change(null, status: RxStatus.loading());
    try {
      var listOfUsers = await listOfUsersProvider.getListOfUsers();
      change(listOfUsers, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error(err.toString()));
    }
  }

  void gotToNextScreen(String url) {
    Get.toNamed(AppRoutes.listOfPosts, arguments: {userImage: url});
  }
}
