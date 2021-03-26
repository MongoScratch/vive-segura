import 'dart:io' show Platform;
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userID;
  String name = '';
  String phoneNumber = '';
  String email = '';
  String gender = '';
  String alert = '';
  String address = '';

  Timestamp lastOnlineTimestamp = Timestamp.now();
  bool selected = false;
  bool active = false;
  String identefierSO = Platform.operatingSystem;
  Settings settings = Settings(allowPushNotifications: true);

  User({
    this.alert,
    this.name,
    this.email,
    this.phoneNumber,
    this.active,
    this.lastOnlineTimestamp,
    this.userID,
    this.gender,
    this.address
  });

  String fullName() {
    return '$name';
  }
}

class Settings {
  bool allowPushNotifications = true;
  Settings({this.allowPushNotifications});
  factory Settings.fromJson(Map<dynamic, dynamic> parsedJson) {
    return new Settings(
        allowPushNotifications: parsedJson['allowPushNotifications'] ?? true);
  }
  Map<String, dynamic> toJson() {
    return {'allowPushNotifications': this.allowPushNotifications};
  }
}
