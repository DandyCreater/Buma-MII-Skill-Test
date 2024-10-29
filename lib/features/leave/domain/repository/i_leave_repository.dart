import 'package:dartz/dartz.dart';

import '../entity/leave_resp_entity.dart';

abstract class ILeaveRepository {
  Future<Either<String, LeaveRespEntity?>> loadLeaveData();
}
