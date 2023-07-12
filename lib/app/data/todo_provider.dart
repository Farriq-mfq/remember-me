import 'package:get/get.dart';
import 'package:remember_me/app/data/api_provider.dart';

class TodoProvider {
  
  final api_provider = Get.find<ApiProvider>();


  dynamic getAllTodos(){
    api_provider.get("url");
  }
}
