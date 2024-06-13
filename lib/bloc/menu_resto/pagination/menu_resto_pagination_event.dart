part of 'menu_resto_pagination_bloc.dart';

@immutable
sealed class MenuRestoPaginationEvent {}

final class GetMenuRestoPagination extends MenuRestoPaginationEvent{}