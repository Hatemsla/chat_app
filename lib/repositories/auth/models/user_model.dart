import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  UserModel({
    required this.uid,
    required this.email,
    required this.phoneNumber,
    this.about,
    this.displayName,
    this.avatar,
    required this.isOnline,
  });

  final String uid;
  final String email;
  final String phoneNumber;
  final String? about;
  final String? displayName;
  final String? avatar;
  final bool isOnline;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'phoneNumber': phoneNumber,
      'about': about,
      'displayName': displayName,
      'avatar': avatar,
      'isOnline': isOnline,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      about: map['about'] != null ? map['about'] as String : null,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      isOnline: map['isOnline'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
