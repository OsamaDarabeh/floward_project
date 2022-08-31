import 'package:floward_project/features/listOfUsers/controller/list_of_users_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/user_secure_storage.dart';
import '../../../widget/error_view.dart';
import '../widgets/user_row.dart';

class ListOfUserScreen extends GetView<ListOfUsersController> {
  const ListOfUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.more_vert_rounded,
              key: Key("backIcon"),
            ),
            color: Colors.black,
            onPressed: () {
              Get.dialog(Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: const Text(
                              "English",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'cairo',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        onTap: () async {
                          await UserSecureStorage.setLanguage(
                              UserSecureStorage.VALUE_EN_LANGUAGE);
                          Get.updateLocale(const Locale(
                              UserSecureStorage.VALUE_EN_LANGUAGE));
                          Get.back();
                        },
                      ),
                      InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: const Text(
                              "عربي",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'cairo',
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                          ),
                          onTap: () async {
                            await UserSecureStorage.setLanguage(
                                UserSecureStorage.VALUE_AR_LANGUAGE);
                            Get.updateLocale(const Locale(
                                UserSecureStorage.VALUE_AR_LANGUAGE));
                            Get.back();
                          })
                    ],
                  ),
                ),
              ));
            },
          ),
          title: Text("user_list".tr,
              style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'cairo',
                  fontWeight: FontWeight.w800,
                  color: Colors.white)),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.getListOfUsers();
          },
          child: controller.obx(
              (listOfUsers) => ListView.builder(
                    shrinkWrap: false,
                    itemCount: listOfUsers?.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return UserRow(
                        userData: listOfUsers![index],
                        count: index + 1,
                        onTap: () {
                          controller.gotToNextScreen(
                              listOfUsers[index].url.toString());
                        },
                      );
                    },
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
                      controller.getListOfUsers();
                    },
                  )),
        ));
  }
}
