import 'package:flutter/material.dart';
import 'package:news/module/login/presentation/view/login_screen.dart';
import 'package:news/utils/sized.dart';
import 'package:provider/provider.dart';

import 'module/news/presentation/view-model/favorites_provider.dart';
import 'module/news/presentation/view-model/news_provider.dart';
import 'module/news/presentation/views/favorite_screen.dart';
import 'module/news/presentation/views/home_screen.dart';
import 'module/news/presentation/views/news_detail_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtil.init(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black,
        ),
        themeMode: ThemeMode.dark,
        initialRoute: AppRoutes.login,
        routes: {
          AppRoutes.login: (ctx) => const LoginScreen(),
          AppRoutes.home: (ctx) => const HomeScreen(),
          AppRoutes.newsDetail: (ctx) => NewsDetailScreen(),
          AppRoutes.favorites: (ctx) => const FavoritesScreen(),
        },
      ),
    );
  }
}
