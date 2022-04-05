import 'package:bloc_with_restapi/Presentation/Components/spacers.dart';
import 'package:bloc_with_restapi/Presentation/Components/text_builder.dart';
import 'package:bloc_with_restapi/Presentation/Declarations/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Data/API/api.dart';
import '../../../../Data/Models/author_model.dart';
import '../../../../business_logic/bloc/DetailsPage_Bloc/details_page_bloc.dart';

class DetailsPageClas extends StatelessWidget {
  const DetailsPageClas(
      {Key? key,
      required this.title,
      required this.author,
      required this.index})
      : super(key: key);
  final String title;

  final int index;

  final List<AuthorModel> author;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: primaryColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<DetailsPageBloc, DetailsPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is DetailsPageLoading) {
            return buildInitialLayout();
          } else if (state is DetailsPageLoaded) {
            return buildInitialLayout();
          } else {
            return buildInitialLayout();
          }
        },
      ),
    );
  }

  Widget buildInitialLayout() => SingleChildScrollView(
        child: Padding(
          padding: kPadding,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeightSpacer(myHeight: kSpacing * 5),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 65,
                  backgroundImage:
                      NetworkImage("$apiBaseUrl${author[index].photoUrl}"),
                ),
                HeightSpacer(myHeight: kSpacing),
                TextBuilder(textMsg: author[index].name.toString()),
                HeightSpacer(myHeight: kSpacing * 5),
                SizedBox(
                  height: 100,
                  child: TextBuilder(
                    textMsg: author[index].content.toString(),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
