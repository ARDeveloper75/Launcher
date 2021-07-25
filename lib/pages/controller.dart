import 'package:device_apps/device_apps.dart';
import 'package:get/get.dart';

class appscontroller extends GetxController {
  var applists = [].obs;
  var showbottombar = false.obs;

  Future getApp() async {
    List<Application> _apps = await DeviceApps.getInstalledApplications(
        includeSystemApps: true,
        includeAppIcons: true,
        onlyAppsWithLaunchIntent: true);
    applists.value = _apps;
    return applists;
  }

  @override
  void onInit() {
    getApp();
    super.onInit();
  }
}
