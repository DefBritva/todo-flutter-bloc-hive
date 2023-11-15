import 'package:flutter/material.dart';
import 'package:my_todo_list/features/favorits/presentation/widgets/fav_appbar.dart';
import 'package:my_todo_list/features/favorits/presentation/widgets/fav_body.dart';
import 'package:my_todo_list/features/favorits/presentation/widgets/menu_drawer.dart';

class FavoritsPage extends StatelessWidget {
  const FavoritsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: FavoritesAppBar(),
      body: FavoritsBody(),
      endDrawer: FavoritesMenuDrawer(),
    );
  }
}
