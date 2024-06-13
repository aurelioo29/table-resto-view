import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_resto/bloc/menu_resto/pagination/menu_resto_pagination_bloc.dart';
import 'package:flutter_pos_resto/models/menu_resto_model.dart';

class MenuRestoPaginationPage extends StatefulWidget {
  const MenuRestoPaginationPage({super.key});

  @override
  State<MenuRestoPaginationPage> createState() =>
      _MenuRestoPaginationPageState();
}

class _MenuRestoPaginationPageState extends State<MenuRestoPaginationPage> {
  final controller = ScrollController();
  late MenuRestoPaginationBloc bloc;

  void onScroll() {
    double maxScroll = controller.position.maxScrollExtent;
    double currentScroll = controller.position.pixels;
    if (maxScroll == currentScroll) bloc.add(GetMenuRestoPagination());
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<MenuRestoPaginationBloc>(context);
    controller.addListener(onScroll);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Resto List'),
      ),
      body: BlocBuilder<MenuRestoPaginationBloc, MenuRestoPaginationState>(
        builder: (context, state) {
          if (state is MenuRestoPaginationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MenuRestoPaginationError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is MenuRestoPaginationLoaded) {
            return ListView.separated(
              controller: controller,
              itemBuilder: (_, index) {
                if (index < state.listMenuRestoModel.length) {
                  MenuRestoModel menuRestoModel = state
                      .listMenuRestoModel[index];
                  return ListTile(
                    //cached_network_image
                    leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage(menuRestoModel.imageMenu.toString()),
                    ),
                    title: Text(menuRestoModel.name.toString()),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(menuRestoModel.category.toString()),
                        Text(menuRestoModel.price.toString())
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator(),);
                }

              },
              separatorBuilder: (_, index) => const Divider(
                thickness: 1,
              ),
              itemCount: state.hasReachedMax ?
              state.listMenuRestoModel.length : state.listMenuRestoModel.length + 1,
            );
          }
          return Container();
        },
      ),
    );
  }
}
