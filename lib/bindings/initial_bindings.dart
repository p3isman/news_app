import 'package:get/get.dart';
import 'package:news_application/controllers/tabs_controller.dart';
import 'package:news_application/services/news_service.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.put(NewsService());
  }
}
