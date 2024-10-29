part of 'leave_form_cubit.dart';

class LeaveFormState extends Equatable {
  DateTime? startDate;
  DateTime? endDate;
  int? differentDays = 1;

  LeaveFormState({this.startDate, this.endDate, this.differentDays});

  LeaveFormState copyWith(
          {DateTime? startDate, DateTime? endDate, int? differentDays}) =>
      LeaveFormState(
          startDate: startDate ?? this.startDate,
          endDate: endDate ?? this.endDate,
          differentDays: differentDays ?? this.differentDays);

  @override
  // TODO: implement props
  List<Object?> get props => [startDate, endDate, differentDays];
}
