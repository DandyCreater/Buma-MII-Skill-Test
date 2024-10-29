import 'package:dartz/dartz.dart';

import '../../domain/entity/leave_resp_entity.dart';
import '../../domain/repository/i_leave_repository.dart';
import '../datasources/interfaces/i_leave_local_data_sources.dart';
import '../model/leave_resp_model.dart';

class LeaveRepository extends ILeaveRepository {
  ILeaveLocalDataSources localDataSource;

  LeaveRepository(this.localDataSource);
  @override
  Future<Either<String, LeaveRespEntity?>> loadLeaveData() async {
    try {
      LeaveRespModel? result = await localDataSource.loadLeaveData();
      if (result != null) {
        return right(result.toEntity());
      } else {
        return left("Leave Data Empty!");
      }
    } catch (e) {
      return const Left("Something Wrong!");
    }
  }
}
