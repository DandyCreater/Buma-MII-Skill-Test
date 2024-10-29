import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/entity/now_playing_resp_entity.dart';
import '../../../domain/usecase/now_playing_uc.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingUc nowPlayingUc;
  NowPlayingBloc(this.nowPlayingUc) : super(NowPlayingInitial()) {
    on<FetchNowPlaying>((event, emit) async {
      emit(NowPlayingLoading());
      try {
        final result = await nowPlayingUc.call();
        result.fold((l) {
          emit(NowPlayingFailed(msg: l));
        }, (r) {
          emit(NowPlayingLoaded(data: r));
        });
      } catch (e) {
        emit(const NowPlayingFailed(msg: "Now Playing Error !"));
      }
    });
  }
}
