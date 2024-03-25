import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../decorations/text_field_decorations.dart';

class CustomTextField {
  static TextField mobileNumber(TextEditingController textEditingController) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: CustomInputDecorations.placeHolderTextField('Mobile Number'),
    );
  }

  static TextField email(TextEditingController textEditingController) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.emailAddress,
      decoration: CustomInputDecorations.placeHolderTextField('Email'),
    );
  }

  static TextField name(
      TextEditingController textEditingController, String? placeHolder) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.name,
      decoration: CustomInputDecorations.placeHolderTextField(placeHolder),
    );
  }

  static TextField password(
      {required TextEditingController textEditingController,
      String placeHolder = 'Password'}) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: CustomInputDecorations.placeHolderTextField(placeHolder),
    );
  }
}
