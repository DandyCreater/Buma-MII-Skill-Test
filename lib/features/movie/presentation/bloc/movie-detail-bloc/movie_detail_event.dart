part of 'movie_detail_bloc.dart';

class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieDetail extends MovieDetailEvent {
  final String movieId;

  const LoadMovieDetail({required this.movieId});
}
