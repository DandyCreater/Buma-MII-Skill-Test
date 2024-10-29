import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../cores/helper/constanta_string.dart';
import '../model/dashboard_menu_resp_model.dart';
import 'interfaces/i_dashboard_local_data_sources.dart';

class DashboardLocalDataSources implements IDashboardLocalDataSources {
  @override
  Future<DashboardMenuRespModel?> loadDashboardMenu() async {
    try {
      final res = await rootBundle.loadString(AppConstanta.dashboardMenuJson);
      final data = jsonDecode(res);
      return DashboardMenuRespModel.fromJson(data);
    } catch (e) {
      debugPrint("error $e");
      return null;
    }
  }
}
