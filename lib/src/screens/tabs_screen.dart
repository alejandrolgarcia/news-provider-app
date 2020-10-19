import 'package:flutter/material.dart';
import 'package:news_provider_app/src/screens/tab1_screen.dart';
import 'package:news_provider_app/src/screens/tab2_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: SafeArea(
          child: ScreensWidget()
        ),
        bottomNavigationBar: NavigationWidget(),
      ),
    );
  }
}

class NavigationWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (i) => navigationModel.currentPage = i,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Para ti'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Encabezados'
        )
      ]
    );
  }
}

class ScreensWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Screen(),
        Tab2Screen()
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {

  int _currentPage = 0;
  PageController _pageController = new PageController();
  
  int get currentPage => this._currentPage;

  set currentPage( int value ) {
    this._currentPage = value;
    _pageController.animateToPage(value, duration: Duration(milliseconds:250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;

}
