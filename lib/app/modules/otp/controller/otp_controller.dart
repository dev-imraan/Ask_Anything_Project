
import 'package:get/get.dart';

class OtpController extends GetxController with OtpControllerInitializer {
  validateOtp(value) {
    if (value.isEmpty) {
      return 'Please enter your Otp';
    } else {
      return null;
    }
  }
}

mixin OtpControllerInitializer {
  
}
