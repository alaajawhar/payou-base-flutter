import 'package:get/get.dart';
import 'package:pay_wallet/core/app_router.dart';

import '../../../shared/backend/auth_service.dart';

class AuthorizationController extends GetxController {
  final AuthService _authService = AuthService();

  signIn({required String username}) {
    UserLookUpRequest request = UserLookUpRequest();
    request.username = username;
    _authService.userLookUp(request).then((response) {
      if (response.isActive) {
        Get.offAllNamed(AppRouter.otpVerification, arguments: 'Your data here');
      }
    });
  }

  signUp({required String username, required String password}) {}
}
