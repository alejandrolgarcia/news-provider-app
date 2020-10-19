import 'package:flutter/material.dart';
import 'package:news_provider_app/src/services/news_service.dart';
import 'package:provider/provider.dart';
import 'package:news_provider_app/src/screens/tabs_screen.dart';
import 'package:news_provider_app/src/theme/theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewsService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: myTheme,
        home: TabsScreen()
      ),
    );
  }
}