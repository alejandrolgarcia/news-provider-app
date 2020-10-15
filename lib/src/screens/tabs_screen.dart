import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: ScreensWidget(),
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
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red
        ),

        Container(
          color: Colors.green
        )
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {

  int _currentPage = 0;
  
  int get currentPage => this._currentPage;

  set currentPage( int value ) {
    this._currentPage = value;
    notifyListeners();
  }

}
