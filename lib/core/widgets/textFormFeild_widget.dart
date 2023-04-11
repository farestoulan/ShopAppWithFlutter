import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function onSubmit,
  required Function onChange,
  required Function onTap,
  bool isClickable = true,
  bool isPassword = false,
  //required Function validate,
  required String msg,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixOnPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (string) {
        onSubmit();
      },
      onChanged: (string) {
        onChange();
      },
      validator: (String? string) {
        if (string!.isEmpty) {
          return msg;
        }
        return null;
      },
      onTap: onTap(),
      enabled: isClickable,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixOnPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
