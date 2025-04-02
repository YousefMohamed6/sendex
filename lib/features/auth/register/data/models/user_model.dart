import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String email;
  final String firstName;
  final String lastName;
  final String address;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.address,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
