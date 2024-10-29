part of 'dashboard_menu_bloc.dart';

class DashboardMenuState extends Equatable {
  const DashboardMenuState();

  @override
  List<Object> get props => [];
}

class DashboardMenuInitial extends DashboardMenuState {}

class DashboardMenuLoading extends DashboardMenuState {}

class DashboardMenuLoaded extends DashboardMenuState {
  final DashboardMenuRespEntity? menuData;

  const DashboardMenuLoaded({required this.menuData});

  @override
  // TODO: implement props
  List<Object> get props => [menuData!];
}

class DashboardMenuFailed extends DashboardMenuState {
  final String? msg;

  const DashboardMenuFailed({required this.msg});

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
