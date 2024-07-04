import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_resto/core/session_manager.dart';
import 'package:flutter_pos_resto/cubit/appsetting_cubit.dart';
import 'package:flutter_pos_resto/ui/table_resto_index_page.dart';
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
          SizedBox(
            height: 5,
          ),
          Text('ID : ${sessionManager.getActivateId()}'),
          SizedBox(
            height: 5,
          ),
          Text('FirstName : ${sessionManager.getActivateFirstName()}'),
          SizedBox(
            height: 5,
          ),
          Text('LastName : ${sessionManager.getActivateLastName()}'),
          SizedBox(
            height: 5,
          ),
          Text('Email : ${sessionManager.getActivateEmail()}'),
          SizedBox(
            height: 5,
          ),
          FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TableRestoIndexPage(),
                  ),
                );
              },
              child: Text('Pesanan Makanan')),
          SizedBox(
            height: 5,
          ),
          ElevatedButton(
              onPressed: () {
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

  const DashboardButton(
      {required this.icon, required this.label, required this.onPressed});

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
