part of 'now_playing_bloc.dart';

class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final NowPlayingRespEntity data;

  const NowPlayingLoaded({required this.data});
}

class NowPlayingFailed extends NowPlayingState {
  final String? msg;

  const NowPlayingFailed({required this.msg});
}
