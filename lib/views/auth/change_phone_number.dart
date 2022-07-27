import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../controllers/auth_controller.dart';

class ChangeNumberDialog extends StatelessWidget {
  ChangeNumberDialog({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),                child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Change your \nwhatsapp number',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset('images/cancel.png')),
            ],
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: controller.phoneTextController,
            maxLength: 10,
            decoration: InputDecoration(
              isDense: true,
              labelText: 'Whatsapp Number',
              prefixIcon: Icon(
                Icons.whatsapp,
                color: Colors.green,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          RoundedLoadingButton(controller: controller.sendOtpButtonController,
              onPressed: (){
                controller.changeNumber();
              },
              color: Colors.blue,
              child: Text('Confirm')),
        ],
      ),
      ),
    );
  }
}