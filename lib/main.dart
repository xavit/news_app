import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_service.dart';
import 'package:news_app/src/pages/tabs_page.dart';
import 'package:news_app/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Puedo tener varios Providers
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'Material App',
        home: TabsPage(),
      ),
    );
  }
}
