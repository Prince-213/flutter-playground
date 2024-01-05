

import 'dart:convert';

import 'package:flutter/material.dart';

@immutable 
class UserData {
  final String name;
  final String address;
  const UserData({
    required this.name,
    required this.address,
  });


  UserData copyWith({
    String? name,
    String? address,
  }) {
    return UserData(
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      name: map['name'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) => UserData.fromMap(json.decode(source));

  @override
  String toString() => 'UserData(name: $name, address: $address)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserData &&
      other.name == name &&
      other.address == address;
  }

  @override
  int get hashCode => name.hashCode ^ address.hashCode;
}
