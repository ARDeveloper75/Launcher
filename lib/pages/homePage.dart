import 'package:custom_launcher/pages/controller.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:glass_kit/glass_kit.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = Get.put(appscontroller());

    changingicon(index) {
      if (controller.applists.value[index].packageName == "com.skype.raider") {
        return Image.asset(
          "assets/images/skype.png",
          height: 50,
          width: 50,
        );
      } else if (controller.applists.value[index].packageName ==
          "com.mxtech.videoplayer.pro") {
        return Image.asset(
          "assets/images/logo.png",
          height: 50,
          width: 50,
        );
      } else if (controller.applists.value[index].packageName ==
          "com.miui.gallery") {
        return Image.asset(
          "assets/images/gg.png",
          height: 50,
          width: 50,
        );
      } else {
        return Image.memory(
          controller.applists.value[index].icon,
          height: 50,
          width: 50,
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: Image.asset(
                "assets/images/wallpaper.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              child: Obx(() {
                try {
                  return GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 30,
                    children: List.generate(controller.applists.value.length,
                        (index) {
                      // print(controller.applists[0].packageName);
                      // print(controller.applists[80].packageName);
                      return Container(
                        child: GestureDetector(
                          onTap: () {
                            DeviceApps.openApp(
                                controller.applists[index].packageName);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 50,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(child: changingicon(index)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Wrap(
                                    children: [
                                      Text(
                                        controller
                                            .applists.value[index].appName,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        //overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                } catch (e) {
                  return Center(
                    child: Text("It's Loading"),
                  );
                }
              }),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: GlassContainer.frostedGlass(
                      height: size.height,
                      width: size.width * 0.15,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                DeviceApps.openApp(
                                    controller.applists[0].packageName);
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/skype.png",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                DeviceApps.openApp(
                                    controller.applists[10].packageName);
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/logo.png",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                DeviceApps.openApp(
                                    controller.applists[14].packageName);
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/gg.png",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
