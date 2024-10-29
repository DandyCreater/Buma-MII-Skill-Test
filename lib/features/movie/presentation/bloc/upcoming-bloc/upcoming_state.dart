part of 'upcoming_bloc.dart';

class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class UpcomingLoaded extends UpcomingState {
  final UpComingRespEntity? data;

  const UpcomingLoaded({required this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}

class UpcomingFailed extends UpcomingState {
  final String? msg;

  const UpcomingFailed({required this.msg});

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
