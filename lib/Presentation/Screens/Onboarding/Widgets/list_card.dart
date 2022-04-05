import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Data/API/api.dart';
import '../../../../Data/Models/author_model.dart';
import '../../../../Data/SharedPref/onboard_page.dart';
import '../../../../business_logic/bloc/HomePage_Bloc/home_page_bloc.dart';
import '../../../Components/spacers.dart';
import '../../../Components/text_builder.dart';
import '../../../Declarations/Constants/constants.dart';

class ListCardBuilder extends StatelessWidget {
  const ListCardBuilder({Key? key, required this.author}) : super(key: key);

  final List<AuthorModel> author;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: author.length,
      itemBuilder: (context, index) {
        return buildIndividualCard(context, index);
      },
    );
  }

  Widget buildIndividualCard(BuildContext context, int index) =>
      GestureDetector(
        onTap: () =>
            BlocProvider.of<HomePageBloc>(context).add(ShowDetailedView(index)),
        child: Padding(
          padding: kPadding * 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: kBorderRadius * 2,
              color: Colors.transparent,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Padding(
              padding: kPadding * 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "$apiBaseUrl${author[index].photoUrl}"),
                      ),
                      WidthSpacer(myWidth: kSpacing),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                            child: TextBuilder(
                              textMsg: author[index].name,
                              textStyle: const TextStyle(
                                  fontSize: 19.00, fontWeight: FontWeight.bold),
                            ),
                          ),
                          HeightSpacer(myHeight: kSpacing / 2),
                          TextBuilder(
                            textMsg:
                                "${((DateTime.now().year) - DateTime.parse(author[index].dataUpdate).year).toString()} years ago.",
                            textStyle: const TextStyle(fontSize: 15.00),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      FutureBuilder(
                        future: OnboardPref().getisFav(author[index].id),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return IconButton(
                              onPressed: () =>
                                  BlocProvider.of<HomePageBloc>(context)
                                      .add(FavData(author[index].id, true)),
                              icon: snapshot.data == true
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(Icons.favorite_outline,
                                      color: Colors.red),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      WidthSpacer(myWidth: kSpacing * 2),
                      OutlinedButton(
                        onPressed: () => BlocProvider.of<HomePageBloc>(context)
                            .add(DeleteData(index)),
                        child: const TextBuilder(
                          textMsg: "Delete",
                          textStyle:
                              TextStyle(color: Colors.red, fontSize: 15.00),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.00),
                          ),
                          side: const BorderSide(width: 2.0, color: Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
