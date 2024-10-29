import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../cores/helper/constanta_string.dart';
import '../../../../cores/helper/sharing_widget.dart';
import '../../../../cores/injection/injection_container.dart';
import '../../../../cores/theme/app_color.dart';
import '../../../../cores/theme/app_text.dart';
import '../../domain/entity/leave_resp_entity.dart';
import '../bloc/leave-data-bloc/leave_data_bloc.dart';
import '../cubit/leave-form-cubit/leave_form_cubit.dart';
import '../cubit/leave-switch-cubit/leave_switch_cubit.dart';
import '../cubit/leave-type-cubit/leave_type_cubit.dart';

class LeaveFormScreen extends StatelessWidget {
  const LeaveFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => sl<LeaveDataBloc>()),
      BlocProvider(
        create: (context) => sl<LeaveSwitchCubit>(),
      )
    ], child: const LeaveFormContent());
  }
}

class LeaveFormContent extends StatefulWidget {
  const LeaveFormContent({super.key});

  @override
  State<LeaveFormContent> createState() => _LeaveFormContentState();
}

class _LeaveFormContentState extends State<LeaveFormContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<LeaveFormCubit>().setInitial();
    context.read<LeaveDataBloc>().add(FetchLeaveData());
  }

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
          "Aktivitas Cuti",
          style: AppText.boldText
              .copyWith(fontSize: 16.sp, color: AppColor.textDarkColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              TextCardWithBg(
                message: "Silahkan pilih tipe cuti yang ingin kamu ajukan",
              ),
              SizedBox(
                height: 16.h,
              ),
              BlocBuilder<LeaveDataBloc, LeaveDataState>(
                builder: (context, state) {
                  if (state is LeaveDataLoaded) {
                    List<DataEntity> data = state.data?.data ?? [];
                    return DropdownWidget(
                      data: data,
                      title: "Tipe Cuti ",
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Divider(
                height: 1.h,
                thickness: 1.h,
                color: AppColor.borderColor,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Image.asset(AppConstanta.cutiFreeColorIc),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Expanded(child: CutiFormCardDetail())
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Divider(
                height: 1.h,
                thickness: 1.h,
                color: AppColor.borderColor,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextCardWithBg(
                justify: false,
                message:
                    "Untuk mengajukan cuti kamu perlu melengkapi data dibawah ini",
              ),
              SizedBox(
                height: 16.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal Cuti",
                    style: AppText.semiBoldText
                        .copyWith(color: AppColor.textDarkColor),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<LeaveFormCubit, LeaveFormState>(
                        builder: (context, state) {
                          return DateInputText(
                              ctr: TextEditingController(
                                  text: DateFormat('dd MMM yyyy').format(
                                      state.startDate ?? DateTime.now())),
                              title: "Tanggal Mulai ",
                              hintText: "Pilih tanggal mulai cuti",
                              onTap: () {
                                context.read<LeaveFormCubit>().setStartDate(
                                    state.startDate ?? DateTime.now(), context);
                              });
                        },
                      ),
                      SwitchWidget(
                        hintText: "Untuk cuti lebih dari 1 hari",
                        title: "Cuti Beberapa Hari",
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  BlocBuilder<LeaveSwitchCubit, bool>(
                    builder: (contextSwitch, stateSwitch) {
                      if (stateSwitch) {
                        return BlocBuilder<LeaveFormCubit, LeaveFormState>(
                          builder: (contextForm, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DateInputText(
                                    ctr: TextEditingController(
                                        text: DateFormat('dd MMM yyyy').format(
                                            state.endDate ??
                                                DateTime.now().add(
                                                    const Duration(days: 1)))),
                                    title: "Tanggal Selesai ",
                                    hintText: "Pilih tanggal selesai cuti",
                                    onTap: () {
                                      context.read<LeaveFormCubit>().setEndDate(
                                          state.endDate ??
                                              DateTime.now()
                                                  .add(const Duration(days: 1)),
                                          context);
                                    }),
                                NormalTextField(
                                  ctr: TextEditingController(
                                      text: (state.differentDays ?? 0)
                                          .toString()),
                                  title: "Lama Cuti",
                                  hintText: "Jumlah lama kamu cuti",
                                ),
                              ],
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.softBlueCardColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            AppConstanta.infoColorIc,
                            height: 16.h,
                            width: 16.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: Text(
                        "Jika Cuti Tahunan di update maka cuti lain akan terhapus",
                        style: AppText.mediumText.copyWith(
                            fontSize: 12.sp, color: AppColor.blueCardColor),
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
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
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.cardTextBgColor),
                        side: MaterialStateProperty.all(BorderSide(
                            color: AppColor.borderColor, width: 1.sp))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.blueCardColor)),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (BuildContext context) {
                            return ModalBottomContent(
                              cancelTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: IntrinsicHeight(
                                            child: DialogCustom(
                                                imageUrl: AppConstanta.failedIc,
                                                title: "Oops !",
                                                description:
                                                    "Aktivitas cuti kamu batal ditambahkan")),
                                      );
                                    });
                              },
                              duration: (context
                                          .read<LeaveFormCubit>()
                                          .state
                                          .differentDays ??
                                      0)
                                  .toString(),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: IntrinsicHeight(
                                            child: DialogCustom(
                                                imageUrl:
                                                    AppConstanta.successIc,
                                                title: "Wohoo !",
                                                description:
                                                    "Aktivitas cuti kamu berhasil ditambahkan")),
                                      );
                                    });
                              },
                              leaveType: context.read<LeaveTypeCubit>().state,
                            );
                          });
                    },
                    child: Text(
                      "+ Tambahkan",
                      style: AppText.mediumText.copyWith(
                          fontSize: 12.sp, color: AppColor.whiteColor),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
