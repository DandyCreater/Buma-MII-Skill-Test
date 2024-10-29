import 'package:buma_mii_skill_test/cores/routes/route_constanta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../cores/helper/sharing_widget.dart';
import '../../../../cores/injection/injection_container.dart';
import '../../../../cores/theme/app_color.dart';
import '../../../../cores/theme/app_text.dart';
import '../bloc/leave-data-bloc/leave_data_bloc.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => sl<LeaveDataBloc>()..add(FetchLeaveData()))
    ], child: const LeaveContent());
  }
}

class LeaveContent extends StatelessWidget {
  const LeaveContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColor.textDarkColor,
            size: 24.sp,
          ),
        ),
        backgroundColor: AppColor.whiteColor,
        title: Text(
          "Leave",
          style: AppText.boldText
              .copyWith(fontSize: 16.sp, color: AppColor.textDarkColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      "Information Leave",
                      style: AppText.boldText.copyWith(
                          color: AppColor.textDarkColor, fontSize: 16.sp),
                    ),
                    Text(
                      "Please check detail your information leave ",
                      style: AppText.mediumText.copyWith(
                          color: AppColor.textLightColor, fontSize: 11.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextCardWithBg(
                  message:
                      'Berikut informasi terkait cuti yang dapat dilakukan sebelum membuat request cuti, pilih "create form leave" untuk membuat pengajuan cuti'),
              SizedBox(
                height: 16.h,
              ),
              BlocBuilder<LeaveDataBloc, LeaveDataState>(
                builder: (context, state) {
                  if (state is LeaveDataLoaded) {
                    var data = state.data?.data ?? [];
                    return StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 16.w,
                      children: [
                        StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1.2,
                            child: LongCard(
                                leaveName: data[0].title,
                                endDate: data[0].endDate,
                                startDate: data[0].startDate,
                                leaveId: data[0].id)),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 0.6,
                          child: SmallCard(
                              leaveName: data[3].title,
                              endDate: data[3].endDate,
                              startDate: data[3].startDate,
                              leaveId: data[3].id),
                        ),
                        StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: 1.2,
                            child: LongCard(
                                leaveName: data[4].title,
                                endDate: data[4].endDate,
                                startDate: data[4].startDate,
                                leaveId: data[4].id)),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 0.6,
                          child: SmallCard(
                              leaveName: data[1].title,
                              endDate: data[1].endDate,
                              startDate: data[1].startDate,
                              leaveId: data[1].id),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 0.6,
                          child: SmallCard(
                              leaveName: data[2].title,
                              endDate: data[2].endDate,
                              startDate: data[2].startDate,
                              leaveId: data[2].id),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 0.6,
                          child: SmallCard(
                              leaveName: data[5].title,
                              endDate: data[5].endDate,
                              startDate: data[5].startDate,
                              leaveId: data[5].id),
                        ),
                        const StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 0.6,
                            child: EmptyCard()),
                      ],
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
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
                Navigator.pushNamed(context, RouteConstanta.leaveFormScreen);
              },
              child: Text(
                "Buat Form Leave",
                style: AppText.mediumText
                    .copyWith(fontSize: 12.sp, color: AppColor.whiteColor),
              )),
        ),
      ),
    );
  }
}
