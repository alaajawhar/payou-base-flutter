import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_wallet/shared/utils/dateUtils.dart';

import '../decorations/text_field_decorations.dart';

class CustomDatePicker {
  static Widget dateOfBirthTextField({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime minimumDate,
    required DateTime maximumDate,
    required TextEditingController textEditingController,
  }) {
    return GestureDetector(
        onTap: () => CustomDatePicker.showIOSDatePicker(
              context: context,
              initialDate: initialDate,
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              onDateChanged: (newDate) {
                textEditingController.text =
                    CustomDateUtils.formatDateTime(newDate);
              },
            ),
        child: AbsorbPointer(
          child: TextField(
            keyboardType: TextInputType.datetime,
            controller: textEditingController,
            decoration:
                CustomInputDecorations.placeHolderTextField("Date Of Birth"),
          ),
        ));
  }

  static void showIOSDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime minimumDate,
    required DateTime maximumDate,
    required Function(DateTime) onDateChanged,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height / 3,
          color: Colors.white,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: initialDate,
            minimumDate: minimumDate,
            maximumDate: maximumDate,
            onDateTimeChanged: onDateChanged,
          ),
        );
      },
    );
  }
}
