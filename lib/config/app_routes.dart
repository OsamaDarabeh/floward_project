import 'package:floward_project/binding/home_bindings.dart';
import 'package:floward_project/features/listOfPosts/view/list_of_posts_screen.dart';
import 'package:floward_project/features/listOfUsers/view/list_of_users_screen.dart';
import 'package:get/get.dart';

import '../binding/posts_bindings.dart';

class AppRoutes {
  static const listOfUser = Routes.listOfUser;

  static const listOfPosts = Routes.listOfPosts;

  static final routes = [
    GetPage(
        name: Routes.listOfPosts,
        page: () => const ListOfPostsScreen(),
        binding: PostsBindings()),
    GetPage(
        name: Routes.listOfUser,
        page: () => const ListOfUserScreen(),
        binding: HomeBindings()),
  ];
}

class Routes {
  static const listOfUser = '/listOfUsers';
  static const listOfPosts = '/listOfPosts';
}
