import 'package:flutter/material.dart';
import 'package:pay_wallet/core/constants/app_colors.dart';

import '../../core/app_router.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/logo_widget.dart';
import '../../shared/widgets/text_fields.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final mobileNumberController = TextEditingController();
  final double _horizontalPadding = 25;

  @override
  Widget build(BuildContext context) {
    // Calculate the bottom padding based on the keyboard's visibility
    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: dismissKeyboard,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
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
                        mobileNumber(mobileNumberController),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Padding(
                      // Add the bottom padding equal to the keyboard's height
                      padding: EdgeInsets.only(
                        bottom: bottomPadding,
                      ),
                      child: AppButton(
                        text: "Sign In",
                        onTap: () {
                          AppRouter.navigate(
                              context, AppRouter.otpVerification);
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
          'Welcome back you\'ve been missed!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          ),
        ));
  }

  Widget mobileNumber(TextEditingController mobileNumberController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: CustomTextField.mobileNumber(mobileNumberController),
    );
  }

  dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
