// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  const CustomerModel({
    required this.accId,
    required this.accMail,
    required this.accName,
    required this.accSurname,
    required this.accVerified,
    required this.accCreationDate,
  });

  final String accId;
  final String accMail;
  final String accName;
  final String accSurname;
  final bool accVerified;
  final String accCreationDate;

  CustomerModel copyWith({
    String? accId,
    String? accMail,
    String? accName,
    String? accSurname,
    bool? accVerified,
    String? accCreationDate,
  }) {
    return CustomerModel(
      accId: accId ?? this.accId,
      accMail: accMail ?? this.accMail,
      accName: accName ?? this.accName,
      accSurname: accSurname ?? this.accSurname,
      accVerified: accVerified ?? this.accVerified,
      accCreationDate: accCreationDate ?? this.accCreationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'acc_id': accId,
      'acc_mail': accMail,
      'acc_name': accName,
      'acc_surname': accSurname,
      'acc_verified': accVerified,
      'acc_creation_date': accCreationDate,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      accId: map['acc_id'] as String,
      accMail: map['acc_mail'] as String,
      accName: map['acc_name'] as String,
      accSurname: map['acc_surname'] as String,
      accVerified: map['acc_verified'] as bool,
      accCreationDate: map['acc_creation_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      accId,
      accMail,
      accName,
      accSurname,
      accVerified,
      accCreationDate,
    ];
  }
}
