import 'package:flutter/material.dart';

import '../../core/app_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_config.dart';
import '../../shared/widgets/app_button.dart';
import '../../shared/widgets/app_text_field.dart';
import '../../shared/widgets/logo_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                      createAccount(context)
                    ],
                  ),
                  AppButton(
                    text: "Sign In",
                    onTap: () {
                      AppRouter.navigateWithClearStack(
                          context, AppRouter.otpVerification);
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
      'Welcome to ${AppConfig.pay + AppConfig.ou}',
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 16,
      ),
    );
  }

  Widget mobileNumber(TextEditingController usernameController) {
    return AppTextField(
      controller: usernameController,
      hintText: 'Mobile Number',
      obscureText: false,
      keyboardType: TextInputType.number,
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
                "Already have an account? Sign in!",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          )),
    );
  }
}
