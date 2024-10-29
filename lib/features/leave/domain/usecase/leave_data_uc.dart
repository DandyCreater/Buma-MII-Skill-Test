import 'package:dartz/dartz.dart';

import '../entity/leave_resp_entity.dart';
import '../repository/i_leave_repository.dart';

class LeaveDataUc {
  ILeaveRepository repository;

  LeaveDataUc(this.repository);

  Future<Either<String, LeaveRespEntity?>> call() => repository.loadLeaveData();
}
