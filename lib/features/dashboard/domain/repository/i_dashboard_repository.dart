import 'package:dartz/dartz.dart';

import '../entity/dashboard_menu_resp_entity.dart';

abstract class IDashboardRepository {
  Future<Either<String, DashboardMenuRespEntity?>> loadDashboardMenu();
}
