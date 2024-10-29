import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cores/helper/constanta_string.dart';
import '../../../../cores/injection/injection_container.dart';
import '../../../../cores/theme/app_color.dart';
import '../../../../cores/theme/app_text.dart';
import '../bloc/movie-detail-bloc/movie_detail_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final String movieId;
  const MovieDetailScreen({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<MovieDetailBloc>()),
        ],
        child: MovieDetailContent(
          movieId: movieId,
        ));
  }
}

class MovieDetailContent extends StatefulWidget {
  final String? movieId;
  const MovieDetailContent({required this.movieId, super.key});

  @override
  State<MovieDetailContent> createState() => _MovieDetailContentState();
}

class _MovieDetailContentState extends State<MovieDetailContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<MovieDetailBloc>()
        .add(LoadMovieDetail(movieId: widget.movieId ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is MovieDetailSuccess) {
              var data = state.data;
              return Stack(
                children: [
                  Container(
                    height: 300.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                AppConstanta.imageBaseurl + data!.backdropPath),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 180.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: AppColor.textDarkColor, width: 2.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        AppConstanta.imageBaseurl +
                                            data.posterPath),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Center(
                          child: Text(
                            data.title,
                            style: AppText.semiBoldText.copyWith(
                                fontSize: 24.sp, color: AppColor.textDarkColor),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.overview,
                                style: AppText.mediumText.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColor.textDarkColor),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Tagline : ",
                                    style: AppText.semiBoldText.copyWith(
                                        color: AppColor.textDarkColor,
                                        fontSize: 16.sp),
                                    children: [
                                      TextSpan(
                                        text: data.tagline,
                                        style: AppText.mediumText
                                            .copyWith(fontSize: 16.sp),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Status : ",
                                    style: AppText.semiBoldText.copyWith(
                                        color: AppColor.textDarkColor,
                                        fontSize: 16.sp),
                                    children: [
                                      TextSpan(
                                        text: data.status,
                                        style: AppText.mediumText
                                            .copyWith(fontSize: 16.sp),
                                      )
                                    ]),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "Rating : ${data.voteAverage}/10",
                                style: AppText.semiBoldText.copyWith(
                                    fontSize: 16.sp,
                                    color: AppColor.textDarkColor),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  data.productionCountries.first.name
                                      .toString(),
                                  style: AppText.semiBoldText.copyWith(
                                      fontSize: 16.sp,
                                      color: AppColor.textDarkColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
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
                Navigator.pop(context);
              },
              child: Text(
                "Kembali",
                style: AppText.mediumText
                    .copyWith(fontSize: 12.sp, color: AppColor.whiteColor),
              )),
        ),
      ),
    );
  }
}
