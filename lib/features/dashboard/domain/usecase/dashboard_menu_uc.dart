import 'package:dartz/dartz.dart';

import '../entity/dashboard_menu_resp_entity.dart';
import '../repository/i_dashboard_repository.dart';

class DashboardMenuUC {
  IDashboardRepository repository;

  DashboardMenuUC(this.repository);

  Future<Either<String, DashboardMenuRespEntity?>> call() =>
      repository.loadDashboardMenu();
}
