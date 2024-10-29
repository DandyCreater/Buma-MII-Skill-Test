import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class LeaveTypeCubit extends Cubit<String> {
  LeaveTypeCubit() : super("Cuti");

  void changeSelected(String value) => emit(value);
}
