// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  clientName: json['clientName'] as String,
  clientPhone: json['clientPhone'] as String,
  clientAddress: json['clientAddress'] as String,
  clientEmail: json['clientEmail'] as String,
  notes: json['notes'] as String,
  orderId: json['orderId'] as String,
  orderName: json['orderName'] as String,
  orderDate: DateTime.parse(json['orderDate'] as String),
  orderStatus: json['orderStatus'] as String,
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'clientName': instance.clientName,
      'clientPhone': instance.clientPhone,
      'clientAddress': instance.clientAddress,
      'clientEmail': instance.clientEmail,
      'notes': instance.notes,
      'orderId': instance.orderId,
      'orderName': instance.orderName,
      'orderStatus': instance.orderStatus,
      'orderDate': instance.orderDate.toIso8601String(),
    };
