part of 'order_cubit.dart';

@freezed
class OrderState<T> with _$OrderState<T> {
  const factory OrderState.initial() = Initial;
  const factory OrderState.loading() = Loading;
  const factory OrderState.success(T orders) = Success;
  const factory OrderState.failure(String message) = Failure;
}
