import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';

import '../../features/dashboard/domain/entity/dashboard_menu_resp_entity.dart';
import '../../features/leave/domain/entity/leave_resp_entity.dart';
import '../../features/leave/presentation/cubit/leave-switch-cubit/leave_switch_cubit.dart';
import '../../features/leave/presentation/cubit/leave-type-cubit/leave_type_cubit.dart';
import '../routes/route_constanta.dart';
import '../theme/app_color.dart';
import '../theme/app_text.dart';
import 'constanta_string.dart';

class DashboardBg extends StatelessWidget {
  double? width;
  double? height;
  DashboardBg({required this.height, required this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppConstanta.dashboardBg), fit: BoxFit.cover)),
    );
  }
}

class TitleBg extends StatelessWidget {
  Function() closePressed;
  Function() searchPressed;
  Function() notificationPressed;

  TitleBg(
      {required this.closePressed,
      required this.searchPressed,
      required this.notificationPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: closePressed,
              child: Icon(
                Icons.close,
                color: AppColor.whiteColor,
                size: 24.sp,
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              "Employee Services",
              style: AppText.semiBoldText
                  .copyWith(color: AppColor.whiteColor, fontSize: 16.sp),
            )
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: searchPressed,
              child: Icon(
                Icons.search,
                color: AppColor.whiteColor,
                size: 24.sp,
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            InkWell(
              onTap: notificationPressed,
              child: Icon(
                Icons.notifications,
                color: AppColor.whiteColor,
                size: 24.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  int? leaveDayLeft;
  String? endDate;
  int? leaveNew;
  DashboardCard(
      {required this.leaveDayLeft,
      required this.endDate,
      required this.leaveNew,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 104.h,
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 1.w, color: AppColor.borderColor)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Cuti Tahunan",
                  style: AppText.mediumText.copyWith(
                      color: AppColor.textLightColor, fontSize: 11.sp),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 16.h,
                      width: 16.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppConstanta.dateIc),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "$leaveDayLeft Days",
                      style: AppText.veryBoldText.copyWith(
                          color: AppColor.textDarkColor, fontSize: 16.sp),
                    )
                  ],
                ),
                Text(
                  "Ended on $endDate",
                  style: AppText.mediumText.copyWith(
                      color: AppColor.textLightColor, fontSize: 11.sp),
                ),
              ],
            ),
            VerticalDivider(
              width: 20.w,
              thickness: 3,
              color: AppColor.borderColor,
            ),
            Column(
              children: [
                Text(
                  "Tahunan diperpanjang",
                  style: AppText.mediumText.copyWith(
                      color: AppColor.textLightColor, fontSize: 11.sp),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 16.h,
                      width: 16.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppConstanta.dateInfoIc),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "$leaveNew Days",
                      style: AppText.veryBoldText.copyWith(
                          color: AppColor.textDarkColor, fontSize: 16.sp),
                    )
                  ],
                ),
                Text(
                  "-",
                  style: AppText.mediumText.copyWith(
                      color: AppColor.textLightColor, fontSize: 11.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteMenu extends StatelessWidget {
  List<ItemEntity>? data;
  FavoriteMenu({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Favorite",
            style: AppText.semiBoldText
                .copyWith(fontSize: 16.sp, color: AppColor.textDarkColor),
          ),
          SizedBox(
            height: 16.h,
          ),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 164 / 56,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: data?.length ?? 0,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (data![index].id.toLowerCase().contains("leave")) {
                    Navigator.pushNamed(context, RouteConstanta.leaveScreen);
                  } else {
                    Navigator.pushNamed(context, RouteConstanta.movieScreen);
                  }
                },
                child: Container(
                  width: 164.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(10.sp),
                    border:
                        Border.all(color: AppColor.borderColor, width: 1.sp),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Row(
                      children: [
                        Image.asset(data?[index].imageUrl ?? ""),
                        SizedBox(width: 16.w),
                        Text(
                          data?[index].menuName ?? "",
                          style: AppText.semiBoldText.copyWith(
                            color: AppColor.textDarkColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  List<ItemEntity>? data;
  TransactionCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Transaction",
              style: AppText.semiBoldText
                  .copyWith(fontSize: 12.sp, color: AppColor.textLightColor),
            ),
            SizedBox(
              height: 16.h,
            ),
            GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 2.0,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 16.h,
                ),
                itemCount: data?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (data![index].id.toLowerCase().contains("leave")) {
                        Navigator.pushNamed(
                            context, RouteConstanta.leaveScreen);
                      } else {
                        Navigator.pushNamed(
                            context, RouteConstanta.movieScreen);
                      }
                    },
                    child: SizedBox(
                      height: 60.h,
                      width: 84.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            data?[index].imageUrl ?? "",
                            height: 24.h,
                            width: 24.h,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Expanded(
                            child: Text(
                              data?[index].menuName ?? "",
                              style: AppText.mediumText.copyWith(
                                  fontSize: 11.sp,
                                  color: AppColor.textLightColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ));
  }
}

class LongCard extends StatelessWidget {
  String? leaveName;
  String? endDate;
  String? startDate;
  String? leaveId;
  LongCard(
      {required this.leaveName,
      required this.endDate,
      required this.startDate,
      required this.leaveId,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: (leaveId == "cuti")
                ? AppColor.greenBorderColor
                : AppColor.blueBorderColor,
            width: 1.sp),
        color: (leaveId == "cuti")
            ? AppColor.greenCardColor
            : AppColor.blueCardColor,
        borderRadius: BorderRadius.circular(10.sp),
        image: DecorationImage(
            image: AssetImage((leaveId == "cuti")
                ? AppConstanta.cutiBgIc
                : AppConstanta.cutiTahunanBgIc),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 36.h, 16.w, 16.h),
        child: Column(
          children: [
            Text(
              leaveName ?? "",
              style: AppText.semiBoldText.copyWith(color: AppColor.whiteColor),
            ),
            SizedBox(height: 8.h),
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: AppColor.whiteColor.withOpacity(0.12),
                  shape: BoxShape.circle),
              child: Center(
                child: Image.asset(
                  (leaveId == "cuti")
                      ? AppConstanta.cutiWhiteIc
                      : AppConstanta.lockIc,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            (leaveId == "cuti")
                ? Text(
                    "Mulai dari",
                    style: AppText.semiBoldText
                        .copyWith(color: AppColor.whiteColor, fontSize: 12.sp),
                  )
                : const SizedBox(),
            Text(
              (leaveId == "cuti") ? formatDate(startDate ?? "") : "3 Hari",
              style: AppText.boldText.copyWith(
                  color: AppColor.whiteColor,
                  fontSize: (leaveId == "cuti") ? 16.sp : 24.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Berakhir ${formatDate(endDate ?? "")}",
              style: AppText.mediumText
                  .copyWith(color: AppColor.whiteColor, fontSize: 11.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  String? leaveId;
  String? leaveName;
  String? endDate;
  String? startDate;
  SmallCard(
      {required this.endDate,
      required this.leaveId,
      required this.leaveName,
      required this.startDate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 88.h,
      // width: 173.w,
      decoration: BoxDecoration(
        border: Border.all(
            color: (leaveId != "cuti-free")
                ? AppColor.blueBorderColor
                : AppColor.greenBorderColor,
            width: 1.sp),
        color: (leaveId != "cuti-free")
            ? AppColor.softBlueCardColor
            : AppColor.softGreenCardColor,
        image: DecorationImage(
            image: AssetImage(smallCardBg(leaveId ?? "")), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leaveId == "cuti-free"
                ? Row(
                    children: [
                      Image.asset(
                        AppConstanta.cutiFreeColorIc,
                        height: 32.h,
                        width: 32.w,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        leaveName ?? "",
                        style: AppText.boldText.copyWith(
                            fontSize: 12.sp, color: AppColor.textDarkColor),
                      ),
                    ],
                  )
                : Text(
                    leaveName ?? "",
                    style: AppText.mediumText.copyWith(
                        fontSize: 11.sp, color: AppColor.textDarkColor),
                  ),
            (leaveId == "cuti-free")
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Mulai ',
                            style: AppText.mediumText.copyWith(
                                color: AppColor.textLightColor,
                                fontSize: 12.sp),
                            children: [
                              TextSpan(
                                  text: formatDate(startDate ?? ""),
                                  style: AppText.boldText.copyWith(
                                      color: AppColor.textDarkColor,
                                      fontSize: 12.sp))
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Berakhir ',
                            style: AppText.mediumText.copyWith(
                                color: AppColor.textLightColor,
                                fontSize: 12.sp),
                            children: [
                              TextSpan(
                                  text: "-",
                                  style: AppText.boldText.copyWith(
                                      color: AppColor.textDarkColor,
                                      fontSize: 12.sp))
                            ]),
                      ),
                    ],
                  )
                : Text(
                    (leaveId == "cuti-besar")
                        ? "${startDate!.substring(0, 2)} - ${formatDate(endDate ?? "")}"
                        : formatDate(startDate ?? ""),
                    style: AppText.boldText.copyWith(
                        fontSize: 16.sp, color: AppColor.textDarkColor),
                  )
          ],
        ),
      ),
    );
  }
}

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColor.borderColor)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  AppConstanta.cutiFreeColorIc,
                  height: 32.h,
                  width: 32.w,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                    child: Text(
                  "Izin",
                  style: AppText.boldText
                      .copyWith(fontSize: 12.sp, color: AppColor.textDarkColor),
                ))
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "-",
              style: AppText.boldText.copyWith(color: AppColor.textDarkColor),
            )
          ],
        ),
      ),
    );
  }
}

class TextCardWithBg extends StatelessWidget {
  String? message;
  bool? justify = true;
  TextCardWithBg({required this.message, this.justify, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: AppColor.cardTextBgColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message ?? "",
          style: AppText.mediumText.copyWith(
            color: AppColor.textLightColor,
            fontSize: 12.sp,
          ),
          textAlign: (justify == true) ? TextAlign.justify : TextAlign.left,
        ),
      ),
    );
  }
}

class DateInputText extends StatelessWidget {
  String? title;
  String? hintText;
  Function()? onTap;
  TextEditingController? ctr = TextEditingController();
  DateInputText(
      {required this.title,
      required this.hintText,
      required this.onTap,
      this.ctr,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 168.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: "$title ",
                style: AppText.mediumText
                    .copyWith(color: AppColor.textDarkColor, fontSize: 12.sp),
                children: [
                  TextSpan(
                      text: "*",
                      style: AppText.mediumText.copyWith(
                          color: AppColor.redDangerColor, fontSize: 12.sp))
                ]),
          ),
          TextFormField(
            controller: ctr,
            decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: onTap,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: AppColor.cardTextBgColor,
                      border:
                          Border.all(color: AppColor.borderColor, width: 1.sp),
                    ),
                    child: const Icon(
                      Icons.calendar_month,
                      color: AppColor.textDarkColor,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.fromLTRB(8.h, 12.h, 0, 12.h),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: AppColor.borderColor, width: 1.sp)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: AppColor.borderColor, width: 1.sp))),
          ),
          Text(
            hintText ?? "",
            style: AppText.mediumText
                .copyWith(fontSize: 11.sp, color: AppColor.textLightColor),
          )
        ],
      ),
    );
  }
}

class NormalTextField extends StatelessWidget {
  String? title;
  String? hintText;
  TextEditingController? ctr = TextEditingController();
  NormalTextField(
      {this.ctr, required this.title, required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 168.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "",
            style: AppText.mediumText
                .copyWith(fontSize: 12.sp, color: AppColor.textDarkColor),
          ),
          TextFormField(
            controller: ctr,
            readOnly: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.cardTextBgColor,
                contentPadding: EdgeInsets.fromLTRB(8.h, 12.h, 0, 12.h),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: AppColor.borderColor, width: 1.sp)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: AppColor.borderColor, width: 1.sp))),
          ),
          Text(
            hintText ?? "",
            style: AppText.mediumText
                .copyWith(fontSize: 11.sp, color: AppColor.textLightColor),
          )
        ],
      ),
    );
  }
}

class DropdownWidget extends StatelessWidget {
  List<DataEntity> data = [];
  String? title;
  DropdownWidget({required this.data, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: title ?? "",
              style: AppText.mediumText
                  .copyWith(color: AppColor.textDarkColor, fontSize: 12.sp),
              children: [
                TextSpan(
                    text: "*",
                    style: AppText.mediumText.copyWith(
                        color: AppColor.redDangerColor, fontSize: 12.sp))
              ]),
        ),
        SizedBox(
          height: 5.h,
        ),
        BlocBuilder<LeaveTypeCubit, String>(
          builder: (context, state) {
            return DropdownButtonFormField2<String>(
              value: state.isNotEmpty ? state : data.first.title,
              isExpanded: true,
              items: data
                  .map((e) => DropdownMenuItem<String>(
                      value: e.title,
                      child: Text(
                        e.title,
                        style: AppText.mediumText,
                      )))
                  .toList(),
              onChanged: (value) {
                context.read<LeaveTypeCubit>().changeSelected(value ?? "");
              },
              onSaved: (value) {
                context.read<LeaveTypeCubit>().changeSelected(value ?? "");
              },
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              iconStyleData: const IconStyleData(icon: SizedBox.shrink()),
              decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: AppColor.cardTextBgColor,
                        border: Border.all(
                            color: AppColor.borderColor, width: 1.sp),
                      ),
                      child: const Icon(
                        Icons.expand_more,
                        color: AppColor.textDarkColor,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(8.h, 12.h, 0, 12.h),
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          BorderSide(color: AppColor.borderColor, width: 1.sp)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: AppColor.borderColor, width: 1.sp))),
            );
          },
        ),
      ],
    );
  }
}

class SwitchWidget extends StatelessWidget {
  String? title;
  String? hintText;
  SwitchWidget({required this.title, required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 168.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? "",
            style: AppText.mediumText
                .copyWith(fontSize: 12.sp, color: AppColor.textDarkColor),
          ),
          BlocBuilder<LeaveSwitchCubit, bool>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterSwitch(
                    activeColor: AppColor.greenCardColor,
                    width: 44.w,
                    height: 24.h,
                    toggleSize: 25.h,
                    value: state,
                    borderRadius: 20.0,
                    showOnOff: false,
                    onToggle: (val) {
                      context.read<LeaveSwitchCubit>().changeSelected(val);
                    },
                  ),
                ],
              );
            },
          ),
          Text(
            hintText ?? "",
            style: AppText.mediumText
                .copyWith(fontSize: 11.sp, color: AppColor.textLightColor),
          )
        ],
      ),
    );
  }
}

class CutiFormCardDetail extends StatelessWidget {
  const CutiFormCardDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cuti",
          style: AppText.mediumText
              .copyWith(fontSize: 11.sp, color: AppColor.textLightColor),
        ),
        RichText(
          text: TextSpan(
              text: "Pekerja Cuti pada tanggal ",
              style: AppText.mediumText
                  .copyWith(color: AppColor.textLightColor, fontSize: 12.sp),
              children: [
                TextSpan(
                    text: "23 Sep - 6 Oct 2023",
                    style: AppText.boldText.copyWith(
                        color: AppColor.textDarkColor, fontSize: 12.sp))
              ]),
        ),
      ],
    );
  }
}

class ModalBottomContent extends StatelessWidget {
  Function()? onTap;
  Function()? cancelTap;
  String? leaveType;
  String? duration;
  ModalBottomContent(
      {required this.onTap,
      required this.cancelTap,
      required this.leaveType,
      required this.duration,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 281.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tambah Aktivitas Cuti",
              style: AppText.semiBoldText.copyWith(
                fontSize: 16.sp,
                color: AppColor.textDarkColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tipe Cuti",
                  style: AppText.semiBoldText
                      .copyWith(fontSize: 12.sp, color: AppColor.textDarkColor),
                ),
                Text(
                  leaveType ?? "",
                  style: AppText.semiBoldText
                      .copyWith(fontSize: 12.sp, color: AppColor.textDarkColor),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Durasi",
                  style: AppText.semiBoldText
                      .copyWith(fontSize: 12.sp, color: AppColor.textDarkColor),
                ),
                Text(
                  "$duration Hari",
                  style: AppText.semiBoldText
                      .copyWith(fontSize: 12.sp, color: AppColor.textDarkColor),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Apakah kamu yakin ingin menambahkan aktivitas cuti ini?",
              style: AppText.mediumText.copyWith(
                fontSize: 12.sp,
                color: AppColor.textDarkColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor: MaterialStateProperty.all(
                              AppColor.cardTextBgColor),
                          side: MaterialStateProperty.all(BorderSide(
                              color: AppColor.borderColor, width: 1.sp))),
                      onPressed: cancelTap,
                      child: Text(
                        "Batal",
                        style: AppText.mediumText.copyWith(
                            fontSize: 12.sp, color: AppColor.textDarkColor),
                      )),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColor.blueCardColor)),
                      onPressed: onTap,
                      child: Text(
                        "+ Tambahkan",
                        style: AppText.mediumText.copyWith(
                            fontSize: 12.sp, color: AppColor.whiteColor),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogCustom extends StatelessWidget {
  String? imageUrl;
  String? title;
  String? description;
  DialogCustom(
      {required this.imageUrl,
      required this.title,
      required this.description,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl ?? "",
          height: 100.h,
          width: 100.w,
        ),
        Text(
          title ?? "",
          style: AppText.boldText
              .copyWith(fontSize: 16.sp, color: AppColor.textDarkColor),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          description ?? "",
          style: AppText.mediumText
              .copyWith(fontSize: 12.sp, color: AppColor.textDarkColor),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.blueCardColor)),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteConstanta.dashboardScreen, (route) => false);
              },
              child: Text(
                "Tutup",
                style: AppText.mediumText
                    .copyWith(fontSize: 12.sp, color: AppColor.whiteColor),
              )),
        ),
      ],
    );
  }
}

class MovieSimpleCard extends StatelessWidget {
  String? imageUrl;
  String? movieName;
  Function()? onTap;
  MovieSimpleCard({this.imageUrl, this.movieName, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Container(
                height: 160.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    image: DecorationImage(
                        image: NetworkImage(imageUrl ?? ""), fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.textDarkColor.withOpacity(0.3),
                        offset: const Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 100.w,
                height: 60.h,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    movieName ?? "",
                    style: AppText.mediumText
                        .copyWith(color: AppColor.textDarkColor),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }
}

class HorizontalMovieCard extends StatelessWidget {
  String? rating;
  String? title;
  String? imageUrl;
  Function()? onTap;
  HorizontalMovieCard(
      {this.rating, this.title, this.imageUrl, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                width: 250.w,
                height: 160.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl ?? ""),
                        fit: BoxFit.cover)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 40.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.yellow.withOpacity(0.8),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0)),
                    ),
                    child: Center(
                      child: Text(
                        "${rating ?? "0"} / 10",
                        style: AppText.boldText.copyWith(
                            color: AppColor.textDarkColor, fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              title ?? "",
              style: AppText.mediumText.copyWith(color: AppColor.textDarkColor),
              textAlign: TextAlign.left,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }
}

smallCardBg(String leaveId) {
  if (leaveId == "cuti-besar") {
    return AppConstanta.cutiBesarBgIc;
  } else if (leaveId == "ppj-cuti") {
    return AppConstanta.ppjCutiBgIc;
  } else if (leaveId == "cuti-free") {
    return AppConstanta.cutiFreeBgIc;
  } else {
    return AppConstanta.cutiKeluargaBgIc;
  }
}

formatDate(String date) {
  if (date.isNotEmpty) {
    DateTime parsedDate = DateFormat('dd-MM-yyyy').parse(date);

    String formattedDate =
        DateFormat('dd MMM yyyy', 'id_ID').format(parsedDate);

    return formattedDate;
  } else {
    return "-";
  }
}
