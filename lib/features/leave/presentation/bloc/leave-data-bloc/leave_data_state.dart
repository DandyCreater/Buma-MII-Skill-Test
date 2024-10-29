part of 'leave_data_bloc.dart';

class LeaveDataState extends Equatable {
  const LeaveDataState();

  @override
  List<Object> get props => [];
}

class LeaveDataInitial extends LeaveDataState {}

class LeaveDataLoading extends LeaveDataState {}

class LeaveDataLoaded extends LeaveDataState {
  final LeaveRespEntity? data;

  const LeaveDataLoaded({required this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}

class LeaveDataFailed extends LeaveDataState {
  final String? msg;

  const LeaveDataFailed({required this.msg});

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
