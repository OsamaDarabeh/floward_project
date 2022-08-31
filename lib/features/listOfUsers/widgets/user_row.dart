import 'package:flutter/material.dart';

import '../model/userData.dart';

class UserRow extends StatelessWidget {
  final UserData userData;
  final int count;
  final Function() onTap;

  const UserRow(
      {Key? key,
      required this.userData,
      required this.onTap,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(18),
      child: InkWell(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(userData.thumbnailUrl != null
                        ? userData.thumbnailUrl!
                        : 'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userData.name ?? "",
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      Text(
                        count.toString(), //Client Name
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            )),
      ),
    );
  }
}
