import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/upcoming_resp_entity.dart';
import '../../../domain/usecase/upcoming_uc.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpComingUc upComingUc;
  UpcomingBloc(this.upComingUc) : super(UpcomingInitial()) {
    on<FetchUpcoming>((event, emit) async {
      emit(UpcomingLoading());
      try {
        final result = await upComingUc.call();
        result.fold((l) {
          emit(UpcomingFailed(msg: l));
        }, (r) {
          emit(UpcomingLoaded(data: r));
        });
      } catch (e) {
        emit(const UpcomingFailed(msg: "Data Upcoming Error!"));
      }
    });
  }
}
