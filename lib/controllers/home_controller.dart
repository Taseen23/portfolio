import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/home_model.dart';
import '../constants/myinfo.dart';

class HomeController extends GetxController {
  final capabilities = <CapabilityModel>[].obs;
  final stats = <StatModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  void _loadData() {
    capabilities.assignAll([
      CapabilityModel(
        title: MyInfo.nativePerfTitle,
        description: MyInfo.nativePerfDesc,
        icon: Icons.auto_awesome_motion,
        tags: ["DART", "KOTLIN", "C++ CORE"],
      ),
      CapabilityModel(
        title: MyInfo.interfaceDesignTitle,
        description: MyInfo.interfaceDesignDesc,
        icon: Icons.edit_note,
      ),
      CapabilityModel(
        title: MyInfo.scalableBackendTitle,
        description: MyInfo.scalableBackendDesc,
        icon: Icons.storage,
      ),
    ]);

    stats.assignAll([
      StatModel(value: MyInfo.crashFree, label: MyInfo.crashFreeText),
      StatModel(value: MyInfo.experiments, label: MyInfo.experimentsText),
      StatModel(value: MyInfo.yearsOfCode, label: MyInfo.yearsOfCodeText),
    ]);
  }
}
