import 'package:flutter/material.dart';

import '../model/postData.dart';

class PostRow extends StatelessWidget {
  final Post postData;

  const PostRow({
    Key? key,
    required this.postData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(18),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  postData.title ?? "",
                  style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
                Flexible(
                  child: Text(
                    postData.body.toString(), //
                    textAlign: TextAlign.center,// Client Name
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.4)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
