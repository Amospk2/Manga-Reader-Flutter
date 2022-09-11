import 'dart:convert';

import 'package:flutter/foundation.dart';

class Chapter {

  final String chapterPath;
  final List content;
  final bool isDownloaded;
  final int chapterNumber;


  Chapter({
    required this.chapterPath,
    required this.content,
    required this.isDownloaded,
    required this.chapterNumber,
  });



  Chapter copyWith({
    String? chapterPath,
    List? content,
    bool? isDownloaded,
    int? chapterNumber,
  }) {
    return Chapter(
      chapterPath: chapterPath ?? this.chapterPath,
      content: content ?? this.content,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      chapterNumber: chapterNumber ?? this.chapterNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chapterPath': chapterPath,
      'content': content,
      'isDownloaded': isDownloaded,
      'chapterNumber': chapterNumber,
    };
  }

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      chapterPath: map['chapterPath'] as String,
      content: List.from((map['content'] as List)),
      isDownloaded: map['isDownloaded'] as bool,
      chapterNumber: map['chapterNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chapter.fromJson(String source) => Chapter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chapter(chapterPath: $chapterPath, content: $content, isDownloaded: $isDownloaded, chapterNumber: $chapterNumber)';
  }

  @override
  bool operator ==(covariant Chapter other) {
    if (identical(this, other)) return true;
  
    return 
      other.chapterPath == chapterPath &&
      listEquals(other.content, content) &&
      other.isDownloaded == isDownloaded &&
      other.chapterNumber == chapterNumber;
  }

  @override
  int get hashCode {
    return chapterPath.hashCode ^
      content.hashCode ^
      isDownloaded.hashCode ^
      chapterNumber.hashCode;
  }
}
