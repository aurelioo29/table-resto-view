import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_resto/bloc/table_resto/index/table_resto_index_bloc.dart';
import 'package:flutter_pos_resto/models/table_resto_model.dart';

class TableRestoIndexPage extends StatelessWidget {
  const TableRestoIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Table Resto List'),
    ),
      body: BlocBuilder<TableRestoIndexBloc ,TableRestoIndexState>(
        builder: (context, state) {
          switch(state){
            case TableRestoIndexLoading():
              return const Center(child: CircularProgressIndicator(),);

            case TableRestoIndexLoaded():
            //Buat GridView
              return ListView.builder(
                  itemCount: state.tableRestoResponse.listTableResto.length,
                  itemBuilder: (context, index){
                    TableRestoModel tableRestoModel = state.tableRestoResponse.listTableResto[index];
                    return ListTile(
                      title: Text(tableRestoModel.name.toString()
                      ),
                    );
                  });

            case TableRestoIndexError():
              return Center(child: Text(state.message),);

            case TableRestoIndexInitial():
          }
          return Container();
        },
      ),
    );
  }
}
