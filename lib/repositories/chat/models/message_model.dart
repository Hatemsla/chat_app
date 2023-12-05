// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType { text, image, audio, video }

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final MessageType type;
  final Timestamp timestamp;

  Message(
      {required this.senderId,
      required this.senderEmail,
      required this.receiverId,
      required this.message,
      required this.timestamp,
      required this.type});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
      'type': type.index
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
        senderId: map['senderId'] as String,
        senderEmail: map['senderEmail'] as String,
        receiverId: map['receiverId'] as String,
        message: map['message'] as String,
        timestamp: map['timestamp'] as Timestamp,
        type: MessageType.values[map['type'] as int]);
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);
}
