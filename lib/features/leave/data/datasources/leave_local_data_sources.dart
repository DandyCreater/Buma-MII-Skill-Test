import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../cores/helper/constanta_string.dart';
import '../model/leave_resp_model.dart';
import 'interfaces/i_leave_local_data_sources.dart';

class LeaveLocalDataSources implements ILeaveLocalDataSources {
  @override
  Future<LeaveRespModel?> loadLeaveData() async {
    try {
      final result = await rootBundle.loadString(AppConstanta.leaveDataJson);
      final data = jsonDecode(result);
      return LeaveRespModel.fromJson(data);
    } catch (e) {
      return null;
    }
  }
}
