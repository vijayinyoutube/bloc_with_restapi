import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Data/Models/author_model.dart';
import '../../../../Data/Models/details_models.dart';
import '../../../../business_logic/bloc/HomePage_Bloc/home_page_bloc.dart';
import '../../../Components/image_builder.dart';
import '../../../Components/shimmer.dart';
import '../../../Components/spacers.dart';
import '../../../Components/text_builder.dart';
import '../../../Declarations/Constants/Images/image.dart';
import '../../../Declarations/Constants/constants.dart';
import '../Widgets/btn_widget.dart';
import '../Widgets/list_card.dart';

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
          } else if (state is DetailedView) {
            Navigator.of(context).pushNamed('/detailspage',
                arguments: DetailsPageModel(state.author, state.index));
          }
        },
        builder: (context, state) {
          if (state is HomePageLoading) {
            return buildLoadingLayout();
          } else if (state is HomePageLoaded) {
            return buildLoadedLayout(state.author);
          } else if (state is NoDataState) {
            return buildNoDataLayout(context);
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
              Padding(
                padding: kHPadding,
                child: const TextBuilder(
                  textMsg: "Welcome to the Literature Community!",
                  textAlign: TextAlign.center,
                ),
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
              GeneralBtn(
                text: 'Explore',
                eventFun: () =>
                    BlocProvider.of<HomePageBloc>(cnxt).add(LoadData()),
              ),
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

  Widget buildLoadedLayout(List<AuthorModel> author) =>
      ListCardBuilder(author: author);

  Widget buildNoDataLayout(BuildContext context) => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageBuilder(
            imagePath: onboardingImages[1],
          ),
          HeightSpacer(myHeight: kSpacing),
          GeneralBtn(
            text: 'Reload',
            eventFun: () =>
                BlocProvider.of<HomePageBloc>(context).add(LoadData()),
          )
        ],
      ));

  ScaffoldFeatureController buildErrorLayout(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error'),
        ),
      );
}
