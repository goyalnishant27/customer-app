import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../controllers/auth_controller.dart';

class ChangeNumberOtp extends StatefulWidget {
  const ChangeNumberOtp({Key? key}) : super(key: key);

  @override
  State<ChangeNumberOtp> createState() => _ChangeNumberOtpState();
}

class _ChangeNumberOtpState extends State<ChangeNumberOtp> {
  final controller = Get.put(AuthController());
  final _timOut = 30;
  String otp = '';
  Timer? _timer;
  int _start = 30;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Enter OTP sent to ${controller.phoneTextController.text.substring(0,4)}XXXXXX',
                  // 'Enter OTP sent to XXXXXX',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      navigator?.pop();
                    },
                    child: Image.asset('images/cancel.png')),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0,),
              child: PinCodeTextField(
                onChanged: (str) {
                  setState(() {
                    otp = str;
                  });
                },
                appContext: context,
                length: 6,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  borderWidth: 1,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_start == 0) {
                  startTimer();
                  controller.changeNumber();
                }
              },
              child: Text(
                'Resend OTP ${_start == 0 ? '' : 'in 00:${_start.toString().padLeft(2, '0')} sec'}',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            RoundedLoadingButton(
                controller: controller.confirmButtonController,
                onPressed: otp.length!=6
                    ? null
                    : () {
                        controller.confirmChangeNumber(otp: otp);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                color: Colors.blue,
                child: Text('Continue')),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    _start = _timOut;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
