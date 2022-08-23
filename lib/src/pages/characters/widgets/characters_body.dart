import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/src/controllers/characters_page_controller.dart';
import 'package:star_wars_app/src/models/character.dart';
import 'package:star_wars_app/src/shared/app_list_tile.dart';

class CharactersBody extends StatefulWidget {
  const CharactersBody({Key? key}) : super(key: key);

  @override
  State<CharactersBody> createState() => _CharactersBodyState();
}

class _CharactersBodyState extends State<CharactersBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CharactersPageController>().getCharactersList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CharactersPageController>();

    return controller.state == CharactersPageState.loading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.characters.length,
              itemBuilder: (context, index) {
                final List<Character> character = controller.characters;

                return AppListTile(
                  text: character[index].name,
                  isFavorite: character[index].isFavorite!,
                  function: () {
                    controller.insertOrDeleteFavorite(
                      id: character[index].id,
                      index: index,
                      name: character[index].name,
                    );
                  },
                );
              },
            ),
          );
  }
}
