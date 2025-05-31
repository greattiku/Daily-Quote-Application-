import 'package:daily_qoutes_app/Controller/home_controller.dart';
import 'package:daily_qoutes_app/Controller/qoutes_controller.dart';
import 'package:get/get.dart';



class MyBindings extends Bindings{
  @override
  void dependencies() {
   Get.put(QuoteController(),permanent: true);
   Get.put(HomeController());
  }
  
}