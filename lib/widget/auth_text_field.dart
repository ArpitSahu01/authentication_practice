import 'package:authentication_pracitce/utils/app_utils.dart';
import 'package:authentication_pracitce/utils/extensions.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {

  String title;
  IconData? icon;
  String hintText;
  bool hideText ;

  AuthTextField({Key? key, required this.title, this.icon, this.hideText = false,required this.hintText}) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obsureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,style: kMontserratMedium.copyWith(
          fontSize: 12.0.sp
        ),),
        SizedBox(height: 10,),
        TextFormField(
          obscureText: widget.hideText ? _obsureText : false,
          decoration: InputDecoration(
            prefixIcon: widget.icon == null ? null: Icon(widget.icon),
            hintText: widget.hintText,
            border: const OutlineInputBorder(),
            suffixIcon: widget.hideText ? _obsureText ?IconButton(onPressed: (){
              setState(() {
                _obsureText = false;
              });
            }, icon: const Icon(Icons.visibility_off_outlined)):IconButton(onPressed: (){
              setState(() {
                _obsureText = true;
              });
            }, icon: const Icon(Icons.visibility_outlined)) : null,
          ),
        ),
      ],
    );
  }
}
