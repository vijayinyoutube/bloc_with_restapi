import 'package:bloc_with_restapi/Presentation/Declarations/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/bloc/home_page_bloc.dart';
import '../../../Components/shimmer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: [
        Padding(
            padding: kHPadding * 2,
            child: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () =>
                    BlocProvider.of<HomePageBloc>(context).add(LoadData())))
      ]),
      body: BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
          if (state is HomePageError) {
            buildErrorLayout(context);
          }
        },
        builder: (context, state) {
          if (state is HomePageLoading) {
            return buildLoadingLayout();
          } else if (state is HomePageLoaded) {
            return buildLoadedLayout();
          } else {
            return buildInitialInput();
          }
        },
      ),
    );
  }

  Widget buildInitialInput() => const Center(
        child: Text("Please click the refresh icon at the top to load data."),
      );

  Widget buildLoadingLayout() => ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return const ShimmerWidget();
      });

  Widget buildLoadedLayout() => const Center(
        child: Text("Loaded!!"),
      );
  ScaffoldFeatureController buildErrorLayout(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your age!'),
        ),
      );
}
