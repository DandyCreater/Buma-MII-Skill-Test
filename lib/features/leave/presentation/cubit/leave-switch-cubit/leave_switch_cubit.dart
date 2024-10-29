import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class LeaveSwitchCubit extends Cubit<bool> {
  LeaveSwitchCubit() : super(false);

  void changeSelected(bool selected) => emit(selected);
}
