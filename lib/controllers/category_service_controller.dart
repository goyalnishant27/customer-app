import 'package:get/get.dart';
import 'package:vyavsay/models/category_service_model.dart';
import 'package:vyavsay/services/home_services/store_service.dart';

class CategoryServiceController extends GetxController {

  var categoriesList = <CategoryService>[];
  StoreServices storeServices = StoreServices();
  var categoryType = "";
  var searchCategroryString = "";
  var searchCategoryList = <CategoryService>[];

  // @override
  // void onInit(){
  //   super.onInit();
  //   getCategoryData();
  // }

  getCategoryData() async {
    searchCategoryList = [];
    searchCategroryString = "";
    var categories = await storeServices.getCategory(categoryType);
    categoriesList = categories;
    update();
  }

  updateCategoryType(category){
    categoryType = category;
    update();
  }

  searchCategory(query){
    searchCategroryString = query;
    var cate = categoriesList.where((farm) {
      final farmNameLower = farm.businessName!.toLowerCase();
      final searchLower = query.toLowerCase();
      return farmNameLower.contains(searchLower);
    }).toList();
    searchCategoryList = cate;
    update();
  }

  clearSearch(){
    searchCategoryList = [];
    searchCategroryString = "";
    update();
  }

}