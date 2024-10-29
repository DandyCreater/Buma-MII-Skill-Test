import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cores/helper/sharing_widget.dart';
import '../../../../cores/injection/injection_container.dart';
import '../../../../cores/routes/route_constanta.dart';
import '../../../../cores/theme/app_color.dart';
import '../../../../cores/theme/app_text.dart';
import '../../domain/entity/dashboard_menu_resp_entity.dart';
import '../bloc/dashboard-menu-bloc/dashboard_menu_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => sl<DashboardMenuBloc>()..add(FetchMenu()),
      )
    ], child: const DashboardContent());
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            DashboardBg(
              height: 206.h,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 68.h, 16.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleBg(
                      closePressed: () {},
                      searchPressed: () {},
                      notificationPressed: () {}),
                  SizedBox(
                    height: 55.h,
                  ),
                  DashboardCard(
                    endDate: "Mar 24, 2024",
                    leaveDayLeft: 3,
                    leaveNew: 0,
                  ),
                  BlocBuilder<DashboardMenuBloc, DashboardMenuState>(
                    builder: (context, state) {
                      if (state is DashboardMenuLoaded) {
                        List<ItemEntity>? dataFav = state.menuData?.menu
                            .where((element) => element.menuType
                                .toLowerCase()
                                .contains("favorite"))
                            .first
                            .item;

                        return FavoriteMenu(data: dataFav!);
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  BlocBuilder<DashboardMenuBloc, DashboardMenuState>(
                    builder: (context, state) {
                      if (state is DashboardMenuLoaded) {
                        List<ItemEntity>? dataTrans = state.menuData?.menu
                            .where((element) => element.menuType
                                .toLowerCase()
                                .contains("transaction"))
                            .first
                            .item;
                        return TransactionCard(
                          data: dataTrans!,
                        );
                      }
                      return const SizedBox();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 72.h,
        decoration: BoxDecoration(color: AppColor.whiteColor, boxShadow: [
          BoxShadow(
              color: AppColor.textDarkColor.withOpacity(0.1),
              offset: const Offset(2, -2)),
        ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.blueCardColor)),
              onPressed: () {
                Navigator.pushNamed(context, RouteConstanta.movieScreen);
              },
              child: Text(
                "Menuju Menu Movie",
                style: AppText.mediumText
                    .copyWith(fontSize: 12.sp, color: AppColor.whiteColor),
              )),
        ),
      ),
    );
  }
}
