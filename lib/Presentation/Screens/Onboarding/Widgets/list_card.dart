import 'package:bloc_with_restapi/Presentation/Components/spacers.dart';
import 'package:bloc_with_restapi/Presentation/Components/text_builder.dart';
import 'package:bloc_with_restapi/Presentation/Declarations/Constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../../Data/Models/author_model.dart';

class ListCardBuilder extends StatelessWidget {
  const ListCardBuilder({Key? key, required this.author}) : super(key: key);

  final List<AuthorModel> author;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return buildIndividualCard(index);
      },
    );
  }

  Widget buildIndividualCard(int index) => Padding(
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
                    const CircleAvatar(
                        backgroundColor: Colors.blue, radius: 30),
                    WidthSpacer(myWidth: kSpacing),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: TextBuilder(
                            textMsg: author[index].name,
                            textStyle: const TextStyle(
                                fontSize: 19.00, fontWeight: FontWeight.bold),
                          ),
                        ),
                        HeightSpacer(myHeight: kSpacing / 2),
                        TextBuilder(
                          textMsg: ((DateTime.now().year) -
                                  DateTime.parse(author[index].dataUpdate).year)
                              .toString(),
                          textStyle: const TextStyle(fontSize: 15.00),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.red),
                    WidthSpacer(myWidth: kSpacing * 2),
                    OutlinedButton(
                      onPressed: () {},
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
      );
}
