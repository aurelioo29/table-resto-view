part of 'order_menu_create_bloc.dart';

@immutable
sealed class OrderMenuCreateState {}

final class OrderMenuCreateInitial extends OrderMenuCreateState {}

final class OrderMenuCreateLoading extends OrderMenuCreateState {}

final class OrderMenuCreateSuccess extends OrderMenuCreateState {
  final OderMenuCreateResponse orderMenuCreateResponse;
  OrderMenuCreateSuccess({required this.orderMenuCreateResponse});
}

final class OrderMenuCreateError extends OrderMenuCreateState {
  final String message;
  OrderMenuCreateError({required this.message});
}
