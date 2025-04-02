import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  final String clientName;
  final String clientPhone;
  final String clientAddress;
  final String clientEmail;
  final String notes;
  final String orderId;
  final String orderName;
  final String orderStatus;
  final DateTime orderDate;

  OrderModel({
    required this.clientName,
    required this.clientPhone,
    required this.clientAddress,
    required this.clientEmail,
    required this.notes,
    required this.orderId,
    required this.orderName,
    required this.orderDate,
    required this.orderStatus,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
