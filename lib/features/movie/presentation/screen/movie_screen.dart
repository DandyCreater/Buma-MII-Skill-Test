import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cores/helper/constanta_string.dart';
import '../../../../cores/helper/sharing_widget.dart';
import '../../../../cores/injection/injection_container.dart';
import '../../../../cores/routes/route_constanta.dart';
import '../../../../cores/theme/app_color.dart';
import '../../../../cores/theme/app_text.dart';
import '../bloc/now-playing-bloc/now_playing_bloc.dart';
import '../bloc/popular-bloc/popular_bloc.dart';
import '../bloc/upcoming-bloc/upcoming_bloc.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => sl<NowPlayingBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<PopularBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<UpcomingBloc>(),
      )
    ], child: const MovieContent());
  }
}

class MovieContent extends StatefulWidget {
  const MovieContent({super.key});

  @override
  State<MovieContent> createState() => _MovieContentState();
}

class _MovieContentState extends State<MovieContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NowPlayingBloc>().add(FetchNowPlaying());
    context.read<PopularBloc>().add(FetchPopular());
    context.read<UpcomingBloc>().add(FetchUpcoming());
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
          "Movie Area",
          style: AppText.boldText
              .copyWith(fontSize: 16.sp, color: AppColor.textDarkColor),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Now Playing",
                style: AppText.semiBoldText
                    .copyWith(fontSize: 20.sp, color: AppColor.textDarkColor),
              ),
            ),
            SizedBox(height: 16.h),
            BlocBuilder<NowPlayingBloc, NowPlayingState>(
              builder: (context, state) {
                if (state is NowPlayingLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is NowPlayingLoaded) {
                  var data = state.data.results;
                  return SizedBox(
                    height: 230.h,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return MovieSimpleCard(
                            imageUrl: AppConstanta.imageBaseurl +
                                data[index].posterPath,
                            movieName: data[index].title,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteConstanta.movieDetailScreen,
                                  arguments: data[index].id.toString());
                            },
                          );
                        }),
                  );
                }
                return const SizedBox();
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(
                "Popular",
                style: AppText.semiBoldText
                    .copyWith(fontSize: 20.sp, color: AppColor.textDarkColor),
              ),
            ),
            SizedBox(height: 16.h),
            BlocBuilder<PopularBloc, PopularState>(
              builder: (context, state) {
                if (state is PopularLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is PopularLoaded) {
                  var data = state.data?.results ?? [];
                  return SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return HorizontalMovieCard(
                            title: data[index].title,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteConstanta.movieDetailScreen,
                                  arguments: data[index].id.toString());
                            },
                            rating: data[index].voteAverage.toString(),
                            imageUrl: AppConstanta.imageBaseurl +
                                data[index].posterPath,
                          );
                        }),
                  );
                }
                return const SizedBox();
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(
                "Up Coming",
                style: AppText.semiBoldText
                    .copyWith(fontSize: 20.sp, color: AppColor.textDarkColor),
              ),
            ),
            SizedBox(height: 16.h),
            BlocBuilder<UpcomingBloc, UpcomingState>(
              builder: (context, state) {
                if (state is UpcomingLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is UpcomingLoaded) {
                  var data = state.data?.results ?? [];
                  return SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return MovieSimpleCard(
                            imageUrl: AppConstanta.imageBaseurl +
                                data[index].posterPath,
                            movieName: data[index].title,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RouteConstanta.movieDetailScreen,
                                  arguments: data[index].id.toString());
                            },
                          );
                        }),
                  );
                }
                return const SizedBox();
              },
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      )),
    );
  }
}
