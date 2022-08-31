import 'package:floward_project/features/listOfUsers/controller/list_of_users_controller.dart';
import 'package:get/get.dart';

import '../features/listOfUsers/provider/list_of_users_provider.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListOfUsersProvider>(() => ListOfUsersProvider());
    Get.lazyPut<ListOfUsersController>(() => ListOfUsersController(Get.find()));
  }
}
