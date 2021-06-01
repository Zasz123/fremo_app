import 'package:fremo_app/models/user.dart';

class Memo {
  final int id;
  final String title;
  final String body;
  final DateTime createdAt;
  final User writer;

  Memo({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.writer,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'body': this.body,
      'createdAt': this.createdAt,
      'writer': this.writer,
    };
  }

  factory Memo.fromJson(Map<String, dynamic> json) {
    return Memo(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      createdAt: DateTime.parse(json['createdAt']),
      writer: User.fromJson(json['writer']),
    );
  }
}
