import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'leave_form_state.dart';

class LeaveFormCubit extends Cubit<LeaveFormState> {
  LeaveFormCubit() : super(LeaveFormState());

  void setInitial() {
    DateTime now = DateTime.now();
    emit(state.copyWith(differentDays: 1));
    emit(state.copyWith(
        startDate: DateTime(now.year, now.month, now.day, 0, 0, 0)));
    emit(state.copyWith(
        endDate: DateTime(now.year, now.month, now.day, 0, 0, 0)
            .add(const Duration(days: 1))));
  }

  void setStartDate(DateTime? startDate, BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate) {
      DateTime? endDate = state.endDate;

      endDate ??= DateTime.now().add(const Duration(days: 1));
      startDate ??= DateTime.now();

      Duration diff = endDate.difference(picked);

      if (diff.isNegative) {
        emit(state.copyWith(endDate: picked.add(const Duration(days: 1))));
        Duration diffRes = state.endDate!.difference(picked);
        emit(state.copyWith(differentDays: diffRes.inDays));
        emit(state.copyWith(startDate: picked));
      } else {
        emit(state.copyWith(differentDays: diff.inDays));
        emit(state.copyWith(startDate: picked));
        emit(state.copyWith(endDate: endDate));
      }
    }
  }

  void setEndDate(DateTime? endDate, BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate ?? DateTime.now(),
      firstDate:
          state.startDate?.add(const Duration(days: 1)) ?? DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != endDate) {
      DateTime? startDate = state.startDate;

      // startDate ??= DateTime.now();
      debugPrint("start Date ${startDate}");
      debugPrint("end Date ${picked}");
      Duration diff = picked.difference(startDate!);

      emit(state.copyWith(differentDays: diff.inDays));
      emit(state.copyWith(startDate: startDate));
      emit(state.copyWith(endDate: picked));
    }
  }
}
