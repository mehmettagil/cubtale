import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String accToken;
  final String accId;
  final String accName;
  final String accSurname;
  final String accRole;
  const UserModel({
    required this.accToken,
    required this.accId,
    required this.accName,
    required this.accSurname,
    required this.accRole,
  });

  UserModel copyWith({
    String? accToken,
    String? accId,
    String? accName,
    String? accSurname,
    String? accRole,
  }) {
    return UserModel(
      accToken: accToken ?? this.accToken,
      accId: accId ?? this.accId,
      accName: accName ?? this.accName,
      accSurname: accSurname ?? this.accSurname,
      accRole: accRole ?? this.accRole,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'acc_token': accToken,
      'acc_id': accId,
      'acc_name': accName,
      'acc_surname': accSurname,
      'acc_role': accRole,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      accToken: map['acc_token'] as String,
      accId: map['acc_id'] as String,
      accName: map['acc_name'] as String,
      accSurname: map['acc_surname'] as String,
      accRole: map['acc_role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      accToken,
      accId,
      accName,
      accSurname,
      accRole,
    ];
  }
}
