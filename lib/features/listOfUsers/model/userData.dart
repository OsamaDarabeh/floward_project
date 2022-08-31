// To parse this JSON data, do
//
//     final listOfUsers = listOfUsersFromJson(jsonString);

import 'dart:convert';

List<UserData> listOfUsersFromJson(String str) => List<UserData>.from(
    json.decode(str).map((x) => UserData.fromJson(x)));

String listOfUsersToJson(List<UserData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData {
  UserData({
    this.albumId,
    this.userId,
    this.name,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? userId;
  String? name;
  String? url;
  String? thumbnailUrl;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        albumId: json["albumId"],
        userId: json["userId"],
        name: json["name"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "userId": userId,
        "name": name,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
