import 'package:flutter/material.dart';
import 'package:pay_wallet/core/constants/app_colors.dart';
import 'package:pay_wallet/shared/widgets/date_picker_widget.dart';

import '../../core/app_router.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/logo_widget.dart';
import '../../shared/widgets/text_fields.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SetPasswordScreen> {
  final passwordTextEditingController = TextEditingController();
  final repeatPasswordTextEditingController = TextEditingController();
  final double _horizontalPadding = 25;

  @override
  Widget build(BuildContext context) {
    // Calculate the bottom padding based on the keyboard's visibility
    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: dismissKeyboard,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppLogoWidget(
                          fontSize: 50,
                        ),
                        const SizedBox(height: 20),
                        welcomeText(),
                        const SizedBox(height: 20),
                        password(passwordTextEditingController),
                        const SizedBox(height: 10),
                        repeatPassword(repeatPasswordTextEditingController),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Padding(
                      // Add the bottom padding equal to the keyboard's height
                      padding: EdgeInsets.only(
                        bottom: bottomPadding,
                      ),
                      child: AppButton(
                        text: "Set",
                        onTap: () {
                          AppRouter.navigateWithClearStack(
                              context, AppRouter.home);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget welcomeText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: Text(
        'Creating an account has never been easier!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 14,
        ),
      ),
    );
  }

  Widget password(TextEditingController textEditingController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: CustomTextField.password(
          textEditingController: textEditingController,
          placeHolder: "Password"),
    );
  }

  Widget repeatPassword(TextEditingController textEditingController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: CustomTextField.password(
          textEditingController: textEditingController,
          placeHolder: "Repeat Password"),
    );
  }

  Widget lastName(TextEditingController textEditingController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: CustomTextField.name(textEditingController, "Last Name"),
    );
  }

  Widget dateOfBirth(TextEditingController textEditingController) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: CustomDatePicker.dateOfBirthTextField(
            context: context,
            initialDate: DateTime(1996, 1, 1),
            minimumDate: DateTime(1900),
            maximumDate: DateTime.now(),
            textEditingController: textEditingController));
  }

  dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
