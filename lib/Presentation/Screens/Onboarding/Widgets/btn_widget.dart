import 'package:flutter/material.dart';

import '../../../Components/text_builder.dart';
import '../../../Declarations/Constants/constants.dart';

class GeneralBtn extends StatelessWidget {
  const GeneralBtn({Key? key, required this.text, required this.eventFun})
      : super(key: key);

  final String text;

  final Function eventFun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHPadding * 6,
      child: GestureDetector(
        onTap: () => eventFun(),
        child: Container(
          decoration:
              BoxDecoration(borderRadius: kBorderRadius, color: primaryColor),
          width: double.infinity,
          height: 50,
          child: Center(
            child: TextBuilder(
              textMsg: text,
              textStyle: TextStyle(color: Colors.white, fontSize: kfontSize),
            ),
          ),
        ),
      ),
    );
  }
}
