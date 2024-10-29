import 'package:buma_mii_skill_test/features/movie/data/datasources/movie_remote_datasources.dart';
import 'package:get_it/get_it.dart';

import '../../features/dashboard/data/datasources/dashboard_local_data_sources.dart';
import '../../features/dashboard/data/datasources/interfaces/i_dashboard_local_data_sources.dart';
import '../../features/dashboard/data/repository/dashboard_repository.dart';
import '../../features/dashboard/domain/repository/i_dashboard_repository.dart';
import '../../features/dashboard/domain/usecase/dashboard_menu_uc.dart';
import '../../features/dashboard/presentation/bloc/dashboard-menu-bloc/dashboard_menu_bloc.dart';
import '../../features/leave/data/datasources/interfaces/i_leave_local_data_sources.dart';
import '../../features/leave/data/datasources/leave_local_data_sources.dart';
import '../../features/leave/data/repository/leave_repository.dart';
import '../../features/leave/domain/repository/i_leave_repository.dart';
import '../../features/leave/domain/usecase/leave_data_uc.dart';
import '../../features/leave/presentation/bloc/leave-data-bloc/leave_data_bloc.dart';
import '../../features/leave/presentation/cubit/leave-form-cubit/leave_form_cubit.dart';
import '../../features/leave/presentation/cubit/leave-switch-cubit/leave_switch_cubit.dart';
import '../../features/leave/presentation/cubit/leave-type-cubit/leave_type_cubit.dart';
import '../../features/movie/data/datasources/interfaces/i_movie_remote_datasources.dart';
import '../../features/movie/data/repository/movie_repository.dart';
import '../../features/movie/domain/repository/i_movie_repository.dart';
import '../../features/movie/domain/usecase/movice_detail_uc.dart';
import '../../features/movie/domain/usecase/now_playing_uc.dart';
import '../../features/movie/domain/usecase/popular_uc.dart';
import '../../features/movie/domain/usecase/upcoming_uc.dart';
import '../../features/movie/presentation/bloc/movie-detail-bloc/movie_detail_bloc.dart';
import '../../features/movie/presentation/bloc/now-playing-bloc/now_playing_bloc.dart';
import '../../features/movie/presentation/bloc/popular-bloc/popular_bloc.dart';
import '../../features/movie/presentation/bloc/upcoming-bloc/upcoming_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => DashboardMenuBloc(sl()));
  sl.registerFactory(() => LeaveDataBloc(sl()));
  sl.registerFactory(() => NowPlayingBloc(sl()));
  sl.registerFactory(() => PopularBloc(sl()));
  sl.registerFactory(() => UpcomingBloc(sl()));
  sl.registerFactory(() => MovieDetailBloc(sl()));

  //Cubit
  sl.registerFactory(() => LeaveTypeCubit());
  sl.registerFactory(() => LeaveSwitchCubit());
  sl.registerFactory(() => LeaveFormCubit());

  //UseCase
  sl.registerLazySingleton(() => DashboardMenuUC(sl()));
  sl.registerLazySingleton(() => LeaveDataUc(sl()));
  sl.registerLazySingleton(() => NowPlayingUc(sl()));
  sl.registerLazySingleton(() => PopularUc(sl()));
  sl.registerLazySingleton(() => UpComingUc(sl()));
  sl.registerLazySingleton(() => MovieDetailUc(sl()));

  //Repository
  sl.registerLazySingleton<IDashboardRepository>(
      () => DashboardRepository(sl()));
  sl.registerLazySingleton<ILeaveRepository>(() => LeaveRepository(sl()));
  sl.registerLazySingleton<IMovieRepository>(() => MovieRepository(sl()));

  //DataSources
  sl.registerLazySingleton<IDashboardLocalDataSources>(
      () => DashboardLocalDataSources());
  sl.registerLazySingleton<ILeaveLocalDataSources>(
      () => LeaveLocalDataSources());
  sl.registerLazySingleton<IMovieRemoteDataSources>(
      () => MovieRemoteDataSources());
}
