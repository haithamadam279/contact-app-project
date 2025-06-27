import 'dart:io';

class Contact {
  final String name;
  final String email;
  final String phone;
  final File? image;

  Contact({
    required this.name,
    required this.email,
    required this.phone,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      image: map['image'],
    );
  }

  Contact copyWith({
    String? name,
    String? email,
    String? phone,
    File? image,
  }) {
    return Contact(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
    );
  }
}
