import 'package:bloc_with_restapi/Presentation/Components/image_builder.dart';
import 'package:bloc_with_restapi/Presentation/Components/spacers.dart';
import 'package:bloc_with_restapi/Presentation/Declarations/Constants/Images/image.dart';
import 'package:bloc_with_restapi/Presentation/Declarations/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/bloc/home_page_bloc.dart';
import '../../../Components/shimmer.dart';
import '../../../Components/text_builder.dart';
import '../Widgets/explore_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return buildInitialInput(context);
          }
        },
      ),
    );
  }

  Widget buildInitialInput(BuildContext cnxt) => SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(cnxt).size.width,
          height: MediaQuery.of(cnxt).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageBuilder(imagePath: onboardingImages[0]),
              const HeightSpacer(myHeight: 50.00),
              const TextBuilder(
                textMsg: "Welcome to the Literature Community!",
                textAlign: TextAlign.center,
              ),
              HeightSpacer(myHeight: kSpacing),
              const SizedBox(
                width: 275,
                child: TextBuilder(
                  textMsg:
                      "Get to know about great english scholars and their articles.",
                  textStyle: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              const HeightSpacer(myHeight: 50.00),
              const ExploreBtn(),
            ],
          ),
        ),
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
