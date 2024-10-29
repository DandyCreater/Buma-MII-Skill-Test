import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/movie_detail_resp_entity.dart';
import '../../../domain/usecase/movice_detail_uc.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailUc movieDetailUc;
  MovieDetailBloc(this.movieDetailUc) : super(MovieDetailInitial()) {
    on<LoadMovieDetail>((event, emit) async {
      emit(MovieDetailLoading());
      try {
        final result = await movieDetailUc.call(event.movieId);
        result.fold((l) {
          emit(MovieDetailFailed(msg: l));
        }, (r) {
          emit(MovieDetailSuccess(data: r));
        });
      } catch (e) {
        emit(const MovieDetailFailed(msg: "Movie Detail Error"));
      }
    });
  }
}
