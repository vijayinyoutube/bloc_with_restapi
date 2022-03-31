import 'dart:convert';

class AuthorModel {
  final int id;
  final String content;
  final String name;
  final String photoUrl;
  AuthorModel({
    required this.id,
    required this.content,
    required this.name,
    required this.photoUrl,
  });

  AuthorModel copyWith({
    int? id,
    String? content,
    String? name,
    String? photoUrl,
  }) {
    return AuthorModel(
      id: id ?? this.id,
      content: content ?? this.content,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'name': name,
      'photoUrl': photoUrl,
    };
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return AuthorModel(
      id: map['messages']['id'] ?? 0,
      content: map['messages']['content'] ?? '',
      name: map['messages']['author']['name'] ?? '',
      photoUrl: map['messages']['author']['photoUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  // factory AuthorModel.fromJson(String source) {

  //   // var parsed = jsonDecode(source) as Map<String, dynamic>;

  //   // return parsed.map((key, value) => AuthorModel.fromMap(json)).toList();
  // }

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['messages']['id'] ?? 0,
      content: json['messages']['content'] ?? '',
      name: json['messages']['author']['name'] ?? '',
      photoUrl: json['messages']['author']['photoUrl'] ?? '',
    );
  }

  @override
  String toString() {
    return 'AuthorModel(id: $id, content: $content, name: $name, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthorModel &&
        other.id == id &&
        other.content == content &&
        other.name == name &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ content.hashCode ^ name.hashCode ^ photoUrl.hashCode;
  }
}
