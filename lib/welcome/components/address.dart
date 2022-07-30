
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyavsay/welcome/components/custom_textfield.dart';

import '../../controllers/user_address_controller.dart';

class AddressScreen extends StatefulWidget {
  var userAddressController = Get.put(UserAddressController());
  AddressScreen({ Key? key }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController stateController = TextEditingController();

  TextEditingController areaController = TextEditingController();

  TextEditingController districtController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();

  TextEditingController address2Controller = TextEditingController();

  onPressOfSaveAddress() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('areaName', areaController.text);
    sharedPreferences.setString('districtName', districtController.text);
    sharedPreferences.setString('stateName', stateController.text);
    sharedPreferences.setString('pincode', pincodeController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            SizedBox(height: 20,),
            Text(
                'Change your Address',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20,),
            CustomTextField(areaController, "Address 1", true),
            SizedBox(height: 20,),
            CustomTextField(address2Controller, "Address 2", true),
            SizedBox(height: 20,),
            CustomTextField(districtController, "City", true),
            SizedBox(height: 20,),
            CustomTextField(stateController, "State", true),
            SizedBox(height: 20,),
            CustomTextField(pincodeController, "Pincode", true),
            SizedBox(height: 20,),
            Container(
                    width: Get.width * 0.78,
                    child: ElevatedButton(
                      onPressed: () async {
                        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        var userId = sharedPreferences.getString('userId');
                        widget.userAddressController.addUserAddress(areaController.text, address2Controller.text, districtController.text, pincodeController.text, stateController.text, userId);
                        // final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
            // sharedPreferences.setString('areaName', areaController.text);
            // sharedPreferences.setString('districtName', districtController.text);
            // sharedPreferences.setString('stateName', stateController.text);
            // sharedPreferences.setString('pincode', pincodeController.text);
            Navigator.of(context).pop();
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Payment(price: "100", delivery: "", total: "100", deliveryTime: "${DateTime.now()}",)),
            //   );
        
                      },
                      child: Text("Change Address"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff134DA5).withOpacity(0.93)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)))),
                    ),
                  )
          ]),
        ),
      ),
    );
  }
}