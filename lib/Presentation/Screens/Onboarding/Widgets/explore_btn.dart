import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../business_logic/bloc/home_page_bloc.dart';
import '../../../Components/text_builder.dart';
import '../../../Declarations/Constants/constants.dart';

class ExploreBtn extends StatelessWidget {
  const ExploreBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHPadding * 6,
      child: GestureDetector(
        onTap: () => BlocProvider.of<HomePageBloc>(context).add(LoadData()),
        child: Container(
          decoration:
              BoxDecoration(borderRadius: kBorderRadius, color: primaryColor),
          width: double.infinity,
          height: 50,
          child: Center(
            child: TextBuilder(
              textMsg: "Explore",
              textStyle: TextStyle(color: Colors.white, fontSize: kfontSize),
            ),
          ),
        ),
      ),
    );
  }
}
