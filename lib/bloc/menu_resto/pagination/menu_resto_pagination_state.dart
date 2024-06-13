part of 'menu_resto_pagination_bloc.dart';

@immutable
sealed class MenuRestoPaginationState {}

final class MenuRestoPaginationInitial extends MenuRestoPaginationState {}

final class MenuRestoPaginationLoading extends MenuRestoPaginationState {}

final class MenuRestoPaginationLoaded extends MenuRestoPaginationState {
  final List<MenuRestoModel> listMenuRestoModel;
  final bool hasReachedMax;
  MenuRestoPaginationLoaded(
      {this.listMenuRestoModel = const <MenuRestoModel>[],
        this.hasReachedMax = false});

  MenuRestoPaginationLoaded copyWith(
      {List<MenuRestoModel>? list, bool? hasReachedMax}) {
    return MenuRestoPaginationLoaded(
      listMenuRestoModel: list ?? this.listMenuRestoModel,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

final class MenuRestoPaginationError extends MenuRestoPaginationState {
  final String message;
  MenuRestoPaginationError({required this.message});
}