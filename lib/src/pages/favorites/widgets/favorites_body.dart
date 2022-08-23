import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/src/controllers/favorites_page_controller.dart';
import 'package:star_wars_app/src/models/favorite.dart';
import 'package:star_wars_app/src/pages/favorites/widgets/favorite_tile.dart';

class FavoritesBody extends StatefulWidget {
  const FavoritesBody({Key? key}) : super(key: key);

  @override
  State<FavoritesBody> createState() => _FavoritesBodyState();
}

class _FavoritesBodyState extends State<FavoritesBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<FavoritePageController>().getFavoriteList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FavoritePageController>();

    return controller.state == FavoritePageState.loading
        ? const Center(child: CircularProgressIndicator())
        : controller.favorites.isNotEmpty
            ? SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.favorites.length,
                  itemBuilder: (context, index) {
                    final List<Favorite> favorite = controller.favorites;
                    final bool isMovie = favorite[index].type == 'movie';
                    return FavoriteTile(
                        text: favorite[index].name, isMovie: isMovie);
                  },
                ),
              )
            : const Center(
                child: Text(
                  'Sem favoritos ainda...',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
  }
}
