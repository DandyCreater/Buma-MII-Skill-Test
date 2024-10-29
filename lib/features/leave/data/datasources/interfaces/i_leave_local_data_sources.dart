import '../../model/leave_resp_model.dart';

abstract class ILeaveLocalDataSources {
  Future<LeaveRespModel?> loadLeaveData();
}
