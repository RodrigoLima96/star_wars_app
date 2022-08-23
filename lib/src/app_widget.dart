import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_app/src/controllers/characters_page_controller.dart';
import 'package:star_wars_app/src/controllers/favorites_page_controller.dart';
import 'package:star_wars_app/src/controllers/movies_page_controller.dart';
import 'package:star_wars_app/src/pages/home/home_page.dart';
import 'package:star_wars_app/src/repository/movies_repository.dart';
import 'package:star_wars_app/src/services/favorite_service.dart';
import 'package:star_wars_app/src/services/movies_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => MoviesService()),
        Provider(create: (context) => FavoriteService.instance),
        Provider(
            create: (context) =>
                MoviesRepository(context.read(), context.read())),
        ChangeNotifierProvider(
            create: (context) => MoviesPageController(context.read())),
        ChangeNotifierProvider(
            create: (context) => CharactersPageController(context.read())),
        ChangeNotifierProvider(
            create: (context) => FavoritePageController(context.read())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Star Wars App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
