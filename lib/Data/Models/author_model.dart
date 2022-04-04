import 'dart:convert';

class AuthorModel {
  final int id;
  final String content;
  final String name;
  final String photoUrl;
  final String dataUpdate;
  
  AuthorModel({
    required this.id,
    required this.content,
    required this.name,
    required this.photoUrl,
    required this.dataUpdate,
  });

  AuthorModel copyWith({
    int? id,
    String? content,
    String? name,
    String? photoUrl,
    String? dataUpdate,
  }) {
    return AuthorModel(
      id: id ?? this.id,
      content: content ?? this.content,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      dataUpdate: dataUpdate ?? this.dataUpdate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'name': name,
      'photoUrl': photoUrl,
      'dataUpdate': dataUpdate,
    };
  }

  


   factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      id: map['id']?.toInt() ?? 0,
      content: map['content'] ?? '',
      name: map['author']['name'] ?? '',
      photoUrl: map['author']['photoUrl'] ?? '',
      dataUpdate: map['updated'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthorModel(id: $id, content: $content, name: $name, photoUrl: $photoUrl, dataUpdate: $dataUpdate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AuthorModel &&
      other.id == id &&
      other.content == content &&
      other.name == name &&
      other.photoUrl == photoUrl &&
      other.dataUpdate == dataUpdate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      content.hashCode ^
      name.hashCode ^
      photoUrl.hashCode ^
      dataUpdate.hashCode;
  }
}
