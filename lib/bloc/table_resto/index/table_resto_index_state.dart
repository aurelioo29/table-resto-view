part of 'table_resto_index_bloc.dart';

@immutable
sealed class TableRestoIndexState {}

// final class TableRestoIndexInitial extends TableRestoIndexState {}
// final class TableRestoIndexLoading extends TableRestoIndexState {} sedang mengambil data
// final class TableRestoIndexLoaded extends TableRestoIndexState {} data sudah ada tinggal diambil
// final class TableRestoIndexError extends TableRestoIndexState {} error terkait koneksi

final class TableRestoIndexInitial extends TableRestoIndexState {}

final class TableRestoIndexLoading extends TableRestoIndexState {

}

final class TableRestoIndexLoaded extends TableRestoIndexState {
  final TableRestoResponse tableRestoResponse;

  TableRestoIndexLoaded({required this.tableRestoResponse});
}

final class TableRestoIndexError extends TableRestoIndexState {
  final String message;

  TableRestoIndexError({required this.message});
}

