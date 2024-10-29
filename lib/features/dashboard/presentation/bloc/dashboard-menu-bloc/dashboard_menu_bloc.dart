import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/dashboard_menu_resp_entity.dart';
import '../../../domain/usecase/dashboard_menu_uc.dart';

part 'dashboard_menu_event.dart';
part 'dashboard_menu_state.dart';

class DashboardMenuBloc extends Bloc<DashboardMenuEvent, DashboardMenuState> {
  DashboardMenuUC dashboardMenuUc;
  DashboardMenuBloc(this.dashboardMenuUc) : super(DashboardMenuInitial()) {
    on<FetchMenu>((event, emit) async {
      try {
        final result = await dashboardMenuUc.call();
        result.fold((l) {
          emit(DashboardMenuFailed(msg: l));
        }, (r) {
          emit(DashboardMenuLoaded(menuData: r));
        });
      } catch (e) {
        emit(const DashboardMenuFailed(msg: "Dashboard Menu Error"));
      }
    });
  }
}
