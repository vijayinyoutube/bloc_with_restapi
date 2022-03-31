import 'package:bloc_with_restapi/Data/Repository/author_repo.dart';
import 'package:bloc_with_restapi/business_logic/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Screens/HomePage/UI/home_page.dart';

class RouteGenerator {
  final HomePageBloc _homePageBloc = HomePageBloc(AuthorRepo());

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomePageBloc>.value(
            value: _homePageBloc,
            child: const HomePage(title: "Bloc with API"),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
