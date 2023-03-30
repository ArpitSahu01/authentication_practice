import 'package:authentication_pracitce/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../utils/app_utils.dart';


class RememberCheckBox extends StatefulWidget {
  const RememberCheckBox({Key? key}) : super(key: key);

  @override
  State<RememberCheckBox> createState() => _RememberCheckBoxState();
}

class _RememberCheckBoxState extends State<RememberCheckBox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: _isChecked, onChanged: (value){
          setState(() {
            _isChecked =  value!;
          });
        },
          activeColor: checkBoxColor,
          focusColor: checkBoxColor,
          hoverColor: checkBoxColor,
        ),
        Text("Remember Me",style: kMontserratRegular.copyWith(
            fontSize: 10.0.sp,
            color: checkBoxColor,
        ),),
      ],
    );
  }
}
