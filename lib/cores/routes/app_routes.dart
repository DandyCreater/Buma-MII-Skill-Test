import 'package:buma_mii_skill_test/cores/routes/route_constanta.dart';
import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/screen/dashboard_screen.dart';
import '../../features/leave/presentation/screen/leave_form_screen.dart';
import '../../features/leave/presentation/screen/leave_screen.dart';
import '../../features/movie/presentation/screen/movie_detail_screen.dart';
import '../../features/movie/presentation/screen/movie_screen.dart';

class AppRoute {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstanta.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case RouteConstanta.leaveScreen:
        return MaterialPageRoute(builder: (_) => const LeaveScreen());
      case RouteConstanta.leaveFormScreen:
        return MaterialPageRoute(builder: (_) => const LeaveFormScreen());
      case RouteConstanta.movieScreen:
        return MaterialPageRoute(builder: (_) => const MovieScreen());
      case RouteConstanta.movieDetailScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => MovieDetailScreen(
                  movieId: settings.arguments as String,
                ));
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Center(child: Text("Something wrong")),
        );
    }
  }
}
