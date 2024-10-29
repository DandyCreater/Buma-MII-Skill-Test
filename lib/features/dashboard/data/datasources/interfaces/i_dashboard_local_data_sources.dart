import '../../model/dashboard_menu_resp_model.dart';

abstract class IDashboardLocalDataSources {
  Future<DashboardMenuRespModel?> loadDashboardMenu();
}
