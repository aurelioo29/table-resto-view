import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_resto/core/session_manager.dart';
import 'package:flutter_pos_resto/cubit/appsetting_cubit.dart';
// import '../bloc/table_resto/index/table_resto_index_bloc.dart';

class HomePage extends StatelessWidget {

  final sessionManager = SessionManager();

  @override
  Widget build(BuildContext context) {
    debugPrint('token: ${sessionManager.getActivateToken()}');
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Aksi ketika tombol pengaturan ditekan
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Token : ${sessionManager.getActivateToken()}'),
          SizedBox(height: 5,),
          Text('ID : ${sessionManager.getActivateId()}'),
          SizedBox(height: 5,),
          Text('FirstName : ${sessionManager.getActivateFirstName()}'),
          SizedBox(height: 5,),
          Text('LastName : ${sessionManager.getActivateLastName()}'),
          SizedBox(height: 5,),
          Text('Email : ${sessionManager.getActivateEmail()}'),
          SizedBox(height: 5,),
          // GridView.count(
          //   crossAxisCount: 2, // Dua kolom dalam grid
          //   crossAxisSpacing: 10,
          //   mainAxisSpacing: 10,
          //   children: [
          //     DashboardButton(
          //       icon: Icons.shopping_cart,
          //       label: 'Keranjang',
          //       onPressed: () {
          //         // Aksi ketika tombol keranjang ditekan
          //       },
          //     ),
          //     DashboardButton(
          //       icon: Icons.restaurant_menu,
          //       label: 'Menu Resto',
          //       onPressed: () {
          //         // Aksi ketika tombol menu resto ditekan
          //       },
          //     ),
          //     DashboardButton(
          //       icon: Icons.table_chart,
          //       label: 'Table Resto',
          //       onPressed: () {
          //         // Aksi ketika tombol table resto ditekan
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => BlocProvider(
          //               create: (context) => TableRestoIndexBloc()..add(GetTableRestoIndexEvent()),
          //               child: TableRestoIndexPage(),
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ],
          // ),
          SizedBox(height: 5,),
          ElevatedButton(
              onPressed: (){
                sessionManager.signOut();
                context.read<AppsettingCubit>().checkSession();
              },
              child: Text('SignOut')),
        ],
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const DashboardButton({required this.icon, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 10.0),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}