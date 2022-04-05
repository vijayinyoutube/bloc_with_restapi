import 'package:bloc_with_restapi/Data/Repository/author_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Models/details_models.dart';
import '../../business_logic/bloc/DetailsPage_Bloc/details_page_bloc.dart';
import '../../business_logic/bloc/HomePage_Bloc/home_page_bloc.dart';
import '../Screens/Details_Page/UI/details_page.dart';
import '../Screens/Onboarding/UI/onboarding_page.dart';

class RouteGenerator {
  final HomePageBloc _homePageBloc = HomePageBloc(AuthorRepo());
  final DetailsPageBloc _detailsPageBloc = DetailsPageBloc(AuthorRepo());

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(args.hashCode);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<HomePageBloc>.value(
            value: _homePageBloc,
            child: const HomePage(title: "Onboarding page"),
          ),
        );

      case '/detailspage':
        final args = settings.arguments as DetailsPageModel;
        if (args.authors.isNotEmpty) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<DetailsPageBloc>.value(
              value: _detailsPageBloc,
              child: DetailsPageClas(
                title: "Details page",
                author: args.authors,
                index: args.index,
              ),
            ),
          );
        }
        return _errorRoute();

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
