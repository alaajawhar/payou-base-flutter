import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pay_wallet/core/constants/app_colors.dart';

import '../../core/app_router.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/logo_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  double pagePadding = 20;

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: SingleChildScrollView(
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const AppLogoWidget(
                            fontSize: 50,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          welcomeText(),
                          const SizedBox(
                            height: 20,
                          ),
                          mobileNumber(usernameController),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      AppButton(
                        text: "Submit",
                        onTap: () {
                          AppRouter.navigateWithClearStack(
                              context, AppRouter.home);
                        },
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget welcomeText() {
    return Text(
      'Enter OTP',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 16,
      ),
    );
  }

  Widget mobileNumber(TextEditingController usernameController) {
    return OtpTextField(
      numberOfFields: 4,
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

  Widget createAccount(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouter.navigateWithClearStack(context, AppRouter.signUp);
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Don't have an account yet? Create one!",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          )),
    );
  }

  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.headline3?.copyWith(color: color);
  }
}
