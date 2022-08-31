import 'package:get/get.dart';

import '../features/listOfPosts/controller/list_of_posts_controller.dart';
import '../features/listOfPosts/provider/list_of_posts_provider.dart';

class PostsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListOfPostsProvider>(() => ListOfPostsProvider());
    Get.lazyPut<ListOfPostsController>(() => ListOfPostsController(Get.find()));
  }
}
