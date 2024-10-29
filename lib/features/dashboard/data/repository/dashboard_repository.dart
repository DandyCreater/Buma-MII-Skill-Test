import 'package:dartz/dartz.dart';

import '../../domain/entity/dashboard_menu_resp_entity.dart';
import '../../domain/repository/i_dashboard_repository.dart';
import '../datasources/interfaces/i_dashboard_local_data_sources.dart';
import '../model/dashboard_menu_resp_model.dart';

class DashboardRepository extends IDashboardRepository {
  IDashboardLocalDataSources localDataSources;

  DashboardRepository(this.localDataSources);

  @override
  Future<Either<String, DashboardMenuRespEntity?>> loadDashboardMenu() async {
    try {
      DashboardMenuRespModel? result =
          await localDataSources.loadDashboardMenu();
      if (result != null) {
        return right(result.toEntity());
      } else {
        return left("Menu Data Empty");
      }
    } catch (e) {
      return const Left("Something Wrong!");
    }
  }
}
