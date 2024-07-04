part of 'order_menu_create_bloc.dart';

@immutable
sealed class OrderMenuCreateEvent {}

final class OrderMenuCreatePressed extends OrderMenuCreateEvent {
  final OrderMenuParam orderMenuParam;
  OrderMenuCreatePressed({required this.orderMenuParam});
}
