import 'package:buma_mii_skill_test/cores/helper/flavor_config.dart';
import 'package:buma_mii_skill_test/cores/routes/app_routes.dart';
import 'package:buma_mii_skill_test/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'cores/injection/injection_container.dart' as di;
import 'cores/injection/injection_container.dart';
import 'features/leave/presentation/cubit/leave-form-cubit/leave_form_cubit.dart';
import 'features/leave/presentation/cubit/leave-type-cubit/leave_type_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConf.initialize(Environment.dev);

  await initializeDateFormatting('id_ID', null);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<LeaveFormCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<LeaveTypeCubit>(),
              ),
            ],
            child: MaterialApp(
              home: const DashboardScreen(),
              onGenerateRoute: AppRoute().onGenerateRoute,
            ),
          );
        });
  }
}
