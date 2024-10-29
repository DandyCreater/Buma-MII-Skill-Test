part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailSuccess extends MovieDetailState {
  final MovieDetailRespEntity? data;

  const MovieDetailSuccess({required this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}

class MovieDetailFailed extends MovieDetailState {
  final String? msg;

  const MovieDetailFailed({required this.msg});

  @override
  // TODO: implement props
  List<Object> get props => [msg!];
}
