import 'package:bloc_with_restapi/Presentation/Components/spacers.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Declarations/Constants/constants.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: SizedBox(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade400,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildAvatar(),
              WidthSpacer(myWidth: kSpacing),
              buildTextEffect(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAvatar() => CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: 20,
      );

  Widget buildTextEffect(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width - ((kSpacing * 2) + 70),
            color: Colors.grey.shade300,
          ),
          HeightSpacer(myHeight: kSpacing),
          Container(
            height: 15,
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.grey.shade300,
          ),
        ],
      );
}
