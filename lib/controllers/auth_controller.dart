import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:vyavsay/services/auth_services/phone_numbers_services.dart';

import '../views/auth/change_number_otp.dart';


class AuthController extends GetxController {
  final nameTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final sendOtpButtonController = RoundedLoadingButtonController();
  final confirmButtonController = RoundedLoadingButtonController();
  PhoneNumberServices phoneNumberServices = PhoneNumberServices();
  String? userType;

  changeNumber() async {
    if(phoneTextController.text.isEmpty) {
      // SB.showWarning(Strings.everyFieldMandatory);
    } else if(!phoneTextController.text.isPhoneNumber) {
      // SB.showWarning('Phone not valid');
      Get.snackbar("Change Phone Number", "Phone Number not valid", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
    }else {
      userType = await phoneNumberServices.changeNumber(
          phone: phoneTextController.text);
      sendOtpButtonController.stop();
      if (userType!=null) {
        // SB.show("Otp Sent", );
        Get.snackbar("Change Phone Number", "Otp Sent", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
        showModalBottomSheet(
            context: Get.context!,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            builder: (context) => ChangeNumberOtp());
      } else {
        // SB.showWarning(Strings.couldntSendOtp);
        Get.snackbar("Change Phone Number", "Couldnt Send Otp", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
      }
    }
    sendOtpButtonController.stop();
  }

  confirmChangeNumber({required String otp}) async {
    bool res = await phoneNumberServices.verifyNumberChange(
        phone: phoneTextController.text, otp: otp,);
    confirmButtonController.stop();
    if (res) {
      // Get.back();
      // Get.back();
      // SB.show("Successfully Changed phone number", );
      Get.snackbar("Change Phone Number", "Successfully Changed phone number", snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
    } else {
      // SB.showWarning('Invalid OTP');
    }
  }
}
