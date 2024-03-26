import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:pay_wallet/core/constants/app_colors.dart';

import '../../../core/app_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/logo_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final mobileNumberController = TextEditingController();
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
                        otpHasSentToYouText(),
                        const SizedBox(height: 20),
                        otpTextField(mobileNumberController),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Padding(
                      // Add the bottom padding equal to the keyboard's height
                      padding: EdgeInsets.only(
                        bottom: bottomPadding,
                      ),
                      child: AppButton(
                        text: "Verify",
                        onTap: () {
                          Get.offAllNamed(AppRouter.signUp,
                              arguments: 'Your data here');
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

  Widget otpHasSentToYouText() {
    return Text(
      'An OTP has just been sent to you!',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 16,
      ),
    );
  }

  Widget otpTextField(TextEditingController mobileNumberController) {
    return OtpTextField(
      numberOfFields: 4,
      autoFocus: true,
      focusedBorderColor: AppColors.primaryColor,
      styles: [
        createStyle(AppColors.primaryColor),
        createStyle(AppColors.primaryColor),
        createStyle(AppColors.primaryColor),
        createStyle(AppColors.primaryColor),
      ],
      showFieldAsBox: false,
      borderWidth: 4.0,
      onCodeChanged: (String code) {
        //handle validation or checks here if necessary
      },
      onSubmit: (String verificationCode) {
        // runs when every textfield is filled
      },
    );
  }

  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.headline3?.copyWith(color: color);
  }

  dismissKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
