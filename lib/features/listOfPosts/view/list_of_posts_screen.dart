import 'package:floward_project/features/listOfPosts/controller/list_of_posts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/error_view.dart';
import '../widgets/post_row.dart';

class ListOfPostsScreen extends GetView<ListOfPostsController> {
  const ListOfPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("list_posts".tr,   style: const TextStyle(
              fontSize: 18,
              fontFamily: 'cairo',
              fontWeight: FontWeight.w800,
              color: Colors.white)),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getListOfPosts();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Image.network(
                    controller.image.value,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: const Color(0xffdc1f1f),
                          value: loadingProgress.expectedTotalBytes != null &&
                                  loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                );
              }),
              controller.obx(
                  (listOfPosts) => Expanded(
                        child: ListView.builder(
                          shrinkWrap: false,
                          itemCount: listOfPosts?.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return PostRow(
                              postData: listOfPosts![index],
                            );
                          },
                        ),
                      ),
                  onLoading: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: CircularProgressIndicator(
                            key: Key("circularProgressIndicatorKey"),
                            color: Colors.black)),
                  ),
                  onError: (error) => ErrorView(
                        error: error.toString(),
                        onPress: () async {
                          controller.getListOfPosts();
                        },
                      )),
            ],
          ),
        ));
  }
}
