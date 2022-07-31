import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/select_city_controller.dart';

class GoogleSearchCities extends StatefulWidget {
  var selectCityController = Get.find<SelectCityController>();
  GoogleSearchCities({ Key? key }) : super(key: key);

  @override
  State<GoogleSearchCities> createState() => _GoogleSearchCitiesState();
}

class _GoogleSearchCitiesState extends State<GoogleSearchCities> {

  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        margin: EdgeInsets.only(left: 10, right: 20, top: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                  // margin: EdgeInsets.only(left: 20, top: 15),
                  child: Row(
                    children: [
                      GestureDetector(onTap: (){
                        Navigator.pop(context);
                      }, child: Icon(Icons.arrow_back_ios)),
                      SizedBox(width: 10,),
                      //  Text("${snapshot.categoryDescription!.businessName}", style: TextStyle(fontSize: 16.0),),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.95,
                              child:                               
                                   TextField(
                                    controller: cityController,
                                    decoration: InputDecoration(
                                      hintText: "Enter your City",
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
                                    ),
                                    // onChanged: (val){
                                    //   if(cityCont.isCitySelected == false){
                                    //     widget.storeController.getStores(val);
                                    //   }else{
                                    //     widget.storeController.getCity(val);
                                    //   }
                                    // },
                                 
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        
                            ElevatedButton(onPressed: (){
                              widget.selectCityController.updateCityName("${cityController.text}");
                              Navigator.pop(context);
                            }, child: Text("Save"), style: ElevatedButton.styleFrom(primary: Color(0xff134DA5).withOpacity(0.93)),)
              ]),
        ),)),
    );
  }
}