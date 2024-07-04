import 'package:bloc/bloc.dart';
import 'package:flutter_pos_resto/params/order_menu_param.dart';
import 'package:flutter_pos_resto/repo/order_menu_repository.dart';
import 'package:flutter_pos_resto/response/oder_menu_create_response.dart';
import 'package:meta/meta.dart';

part 'order_menu_create_event.dart';
part 'order_menu_create_state.dart';

class OrderMenuCreateBloc
    extends Bloc<OrderMenuCreateEvent, OrderMenuCreateState> {
  final orderMenuRepository = OrderMenuRepository();
  OrderMenuCreateBloc() : super(OrderMenuCreateInitial()) {
    on<OrderMenuCreatePressed>((event, emit) async {
      // TODO: implement event handler
      emit(OrderMenuCreateLoading());
      final param = OrderMenuParam(
          tableResto: event.orderMenuParam.tableResto,
          waitress: event.orderMenuParam.waitress,
          userCreate: event.orderMenuParam.userCreate);
      try {
        OderMenuCreateResponse response =
            await orderMenuRepository.addOrderMenu(param);
        emit(OrderMenuCreateSuccess(orderMenuCreateResponse: response));
      } catch (e) {
        emit(OrderMenuCreateError(message: e.toString()));
      }
    });
  }
}
