import 'package:flutter/material.dart';
import 'package:star_wars_app/src/pages/avatar/avatar_page.dart';
import 'package:star_wars_app/src/pages/characters/characters_page.dart';
import 'package:star_wars_app/src/pages/favorites/favorites_page.dart';
import 'package:star_wars_app/src/pages/home/widgets/tab_button.dart';
import 'package:star_wars_app/src/pages/home/widgets/user_avatar_button.dart';
import 'package:star_wars_app/src/pages/movies/movies_page.dart';
import 'package:star_wars_app/src/pages/website/website_page.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _selectedPage = 0;
  late PageController _pageController;

  void _changePage(int index) {
    setState(() {
      if (_selectedPage == index && index >= 3) {
        _selectedPage = 0;
        _pageController.jumpToPage(0);
      } else {
        _selectedPage = index;
        _pageController.jumpToPage(index);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabButton(
                  text: 'Site Oficial',
                  selectedPage: _selectedPage,
                  pageIndex: 3,
                  press: () {
                    _changePage(3);
                  },
                ),
                UserAvatarButton(
                  selectedPage: _selectedPage,
                  pageIndex: 4,
                  press: () {
                    _changePage(4);
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabButton(
                  text: 'Filmes',
                  pageIndex: 0,
                  selectedPage: _selectedPage,
                  press: () {
                    _changePage(0);
                  },
                ),
                TabButton(
                  text: 'Personagens',
                  pageIndex: 1,
                  selectedPage: _selectedPage,
                  press: () {
                    _changePage(1);
                  },
                ),
                TabButton(
                  text: 'Favoritos',
                  pageIndex: 2,
                  selectedPage: _selectedPage,
                  press: () {
                    _changePage(2);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                MoviesPage(),
                CharactersPage(),
                FavoritesPage(),
                WebsitePage(),
                AvatarPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
