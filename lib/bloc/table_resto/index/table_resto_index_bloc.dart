import 'package:bloc/bloc.dart';
import 'package:flutter_pos_resto/repo/table_resto_repository.dart';
import 'package:flutter_pos_resto/response/table_resto_response.dart';
// import 'package:meta/meta.dart';
import 'package:meta/meta.dart';
//bloc untuk logic bisnis aplikasi

part 'table_resto_index_event.dart';
part 'table_resto_index_state.dart';

class TableRestoIndexBloc extends Bloc<TableRestoIndexEvent, TableRestoIndexState> {
  final tableRestoRepository = TableRestoRepository();

  TableRestoIndexBloc() : super(TableRestoIndexInitial()) {
    on<GetTableRestoIndexEvent>((event, emit) async{
      emit(TableRestoIndexLoading());
      try{
        TableRestoResponse response = await tableRestoRepository.getAllTableResto();
        emit(TableRestoIndexLoaded(tableRestoResponse: response));
      } catch(e){
        //emit apa yang akan dieksekusi
        emit(TableRestoIndexError(message: e.toString()));
      }

    });
  }
}