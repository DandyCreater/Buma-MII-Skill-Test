part of 'popular_bloc.dart';

class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  final PopularRespEntity? data;

  const PopularLoaded({required this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}

class PopularFailed extends PopularState {
  final String? msg;

  const PopularFailed({required this.msg});

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
