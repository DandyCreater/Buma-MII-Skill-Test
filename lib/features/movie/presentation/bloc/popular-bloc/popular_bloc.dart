import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/popular_resp_entity.dart';
import '../../../domain/usecase/popular_uc.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularUc popularUc;
  PopularBloc(this.popularUc) : super(PopularInitial()) {
    on<FetchPopular>((event, emit) async {
      emit(PopularLoading());
      try {
        final result = await popularUc.call();
        result.fold((l) {
          emit(PopularFailed(msg: l));
        }, (r) {
          emit(PopularLoaded(data: r));
        });
      } catch (e) {
        emit(const PopularFailed(msg: "Popular Data Error"));
      }
    });
  }
}
