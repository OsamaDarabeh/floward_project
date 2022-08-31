import 'package:floward_project/data/api.dart';
import 'package:get/get.dart';

import '../../../data/api_basic_helper.dart';
import '../model/postData.dart';

class ListOfPostsProvider extends GetConnect {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  Future<List<Post>> getListOfPosts() async {
    var response = await apiBaseHelper.get(API.listOfPost);
    return Future.value(postsFromJson(response));
  }
}
