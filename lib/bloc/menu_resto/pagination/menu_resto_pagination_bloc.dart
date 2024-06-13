import 'package:bloc/bloc.dart';
import 'package:flutter_pos_resto/models/menu_resto_model.dart';
import 'package:flutter_pos_resto/repo/menu_resto_repository.dart';
import 'package:meta/meta.dart';

part 'menu_resto_pagination_event.dart';
part 'menu_resto_pagination_state.dart';

class MenuRestoPaginationBloc
    extends Bloc<MenuRestoPaginationEvent, MenuRestoPaginationState> {
  final menuRestoRepository = MenuRestoRepository();
  MenuRestoPaginationBloc() : super(MenuRestoPaginationInitial()) {
    on<GetMenuRestoPagination>((event, emit) async {
      try {
        List<MenuRestoModel> list;
        if (state is MenuRestoPaginationInitial) {
          list = await menuRestoRepository.getMenuRestoPagination(10, 0);
          emit(MenuRestoPaginationLoaded(listMenuRestoModel: list));
        } else {
          MenuRestoPaginationLoaded menuRestoPaginationLoaded =
              state as MenuRestoPaginationLoaded;
          list = await menuRestoRepository.getMenuRestoPagination(
              10, menuRestoPaginationLoaded.listMenuRestoModel.length);
          emit(list.isEmpty
              ? menuRestoPaginationLoaded.copyWith(hasReachedMax: true)
              : menuRestoPaginationLoaded.copyWith(
            list: menuRestoPaginationLoaded.listMenuRestoModel + list
          ));
        }
      } catch (e) {
        emit(MenuRestoPaginationError(message: e.toString()));
      }
    });
  }
}
