import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos_resto/models/table_resto_model.dart';

class OrderMenuPage extends StatelessWidget {
  TableRestoModel tableRestoModel;
  OrderMenuPage({super.key, required this.tableRestoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesananan ${tableRestoModel.name}'),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }
}
