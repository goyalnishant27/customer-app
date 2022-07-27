import 'package:get/get.dart';
import 'package:vyavsay/models/category_service_model.dart';
import 'package:vyavsay/services/home_services/store_service.dart';

class CategoryServiceController extends GetxController {

  var categoriesList = <CategoryService>[];
  StoreServices storeServices = StoreServices();
  var categoryType = "";

  // @override
  // void onInit(){
  //   super.onInit();
  //   getCategoryData();
  // }

  getCategoryData() async {
    var categories = await storeServices.getCategory(categoryType);
    categoriesList = categories;
    update();
  }

  updateCategoryType(category){
    categoryType = category;
    update();
  }

}