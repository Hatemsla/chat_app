// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class GroupModel {
  final String name;
  final String about;
  final String avatar;
  final String creator;
  final bool isGroup;
  final List<String> members;
  GroupModel({
    required this.name,
    required this.about,
    required this.avatar,
    required this.creator,
    required this.isGroup,
    required this.members,
  });

  GroupModel copyWith({
    String? name,
    String? about,
    String? avatar,
    String? creator,
    bool? isGroup,
    List<String>? members,
  }) {
    return GroupModel(
      name: name ?? this.name,
      about: about ?? this.about,
      avatar: avatar ?? this.avatar,
      creator: creator ?? this.creator,
      isGroup: isGroup ?? this.isGroup,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'about': about,
      'avatar': avatar,
      'creator': creator,
      'isGroup': isGroup,
      'members': members,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
        name: map['name'] as String,
        about: map['about'] as String,
        avatar: map['avatar'] as String,
        creator: map['creator'] as String,
        isGroup: map['isGroup'] as bool,
        members: List<String>.from(
          (map['members'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory GroupModel.fromJson(String source) =>
      GroupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Group(name: $name, about: $about, avatar: $avatar, creator: $creator, isGroup: $isGroup, members: $members)';
  }

  @override
  bool operator ==(covariant GroupModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.about == about &&
        other.avatar == avatar &&
        other.creator == creator &&
        other.isGroup == isGroup &&
        listEquals(other.members, members);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        about.hashCode ^
        avatar.hashCode ^
        creator.hashCode ^
        isGroup.hashCode ^
        members.hashCode;
  }
}
