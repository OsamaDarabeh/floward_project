import 'package:floward_project/features/listOfPosts/model/postData.dart';
import 'package:get/get.dart';

import '../../../config/const.dart';
import '../provider/list_of_posts_provider.dart';

class ListOfPostsController extends GetxController with StateMixin<List<Post>> {
  static ListOfPostsController get to => Get.find();
  ListOfPostsProvider listOfPostsProvider;

  ListOfPostsController(this.listOfPostsProvider);

  var image = "".obs;

  @override
  void onInit() async {
    super.onInit();
    image(Get.arguments[userImage]);
    getListOfPosts();
  }

  Future<void> getListOfPosts() async {
    change(null, status: RxStatus.loading());
    try {
      var listOfPosts = await listOfPostsProvider.getListOfPosts();
      change(listOfPosts, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error(err.toString()));
    }
  }
}
