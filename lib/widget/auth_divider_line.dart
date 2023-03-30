import 'package:authentication_pracitce/utils/app_utils.dart';
import 'package:authentication_pracitce/utils/extensions.dart';
import 'package:flutter/material.dart';

class AuthDividerLine extends StatelessWidget {
  const AuthDividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25.0.wp,
          height: 2,
          margin: EdgeInsets.symmetric(horizontal: 2.0.wp),
          decoration: BoxDecoration(
          color: checkBoxColor.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(20.0.wp)),
        ),),
        Text("or continue with",style: kMontserratRegular.copyWith(
          fontSize: 10.0.sp,
          color: checkBoxColor,
        ),),
        Container(
          width: 25.0.wp,
          height: 2,
          margin: EdgeInsets.symmetric(horizontal: 2.0.wp),
          decoration: BoxDecoration(
            color: checkBoxColor.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(20.0.wp)),
          ),),
      ],
    );
  }
}
