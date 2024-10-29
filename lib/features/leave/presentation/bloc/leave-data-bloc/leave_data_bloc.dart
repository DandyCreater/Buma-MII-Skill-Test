import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/leave_resp_entity.dart';
import '../../../domain/usecase/leave_data_uc.dart';

part 'leave_data_event.dart';
part 'leave_data_state.dart';

class LeaveDataBloc extends Bloc<LeaveDataEvent, LeaveDataState> {
  LeaveDataUc leaveDataUc;
  LeaveDataBloc(this.leaveDataUc) : super(LeaveDataInitial()) {
    on<FetchLeaveData>((event, emit) async {
      try {
        final result = await leaveDataUc.call();
        result.fold((l) {
          emit(LeaveDataFailed(msg: l));
        }, (r) {
          emit(LeaveDataLoaded(data: r));
        });
      } catch (e) {
        emit(const LeaveDataFailed(msg: "Leave Data Error"));
      }
    });
  }
}
