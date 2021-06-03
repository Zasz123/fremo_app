import 'package:fremo_app/models/user.dart';

class Comment {
  final int id;
  final String body;
  final User writer;
  final DateTime createdAt;

  Comment({
    this.id,
    this.body,
    this.writer,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'body': this.body,
      'writer': this.writer,
      'createdAt': this.createdAt,
    };
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      body: json['body'],
      writer: json['writer'],
      createdAt: json['createdAt'],
    );
  }
}
