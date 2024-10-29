import 'package:flutter_flavor/flutter_flavor.dart';

class AppConstanta {
  static String get baseUrl {
    return FlavorConfig.instance.variables['baseUrl'] ?? '';
  }

  static Map<String, String> header(String? bearerToken) {
    Map<String, String> header = {};
    if (bearerToken == null || bearerToken.isEmpty) {
      header = {
        "Content-Type": "application/json",
      };
    } else {
      header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $bearerToken",
      };
    }
    return header;
  }

  //Asset Images
  static String dashboardBg = 'assets/image/header-bg.png';
  static String dateIc = 'assets/image/date-ic.png';
  static String dateInfoIc = 'assets/image/date-info-ic.png';
  static String cutiWhiteIc = 'assets/image/cuti-white-ic.png';
  static String lockIc = 'assets/image/lock-ic.png';
  static String cutiBgIc = 'assets/image/cuti-bg.png';
  static String cutiBesarBgIc = 'assets/image/cuti-besar-bg.png';
  static String ppjCutiBgIc = 'assets/image/ppg-cuti-bg.png';
  static String cutiFreeBgIc = 'assets/image/cuti-free-bg.png';
  static String cutiTahunanBgIc = 'assets/image/cuti-tahunan-bg.png';
  static String cutiKeluargaBgIc = 'assets/image/cuti-keluarga-bg.png';
  static String cutiFreeColorIc = 'assets/image/cuti-free-color.png';
  static String infoColorIc = 'assets/image/info-ic.png';
  static String successIc = 'assets/image/success-ic.png';
  static String failedIc = 'assets/image/failed-img.png';

  //Json Data Local
  static String dashboardMenuJson = 'assets/json/dashboard_menu.json';
  static String leaveDataJson = 'assets/json/leave_data.json';

  static String bearerToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNGM4MjFkNzVkMTk0MzQ5MjZkYzhmYTE5NzljOTc5ZCIsIm5iZiI6MTczMDE2ODQ2MS4zNjUzNzMsInN1YiI6IjY3MjA0NWI0OWZmNjgxZDllMGE0YzE4YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-a9ry8gxqWJoLS58aRdEDgmUyt-od7kW0Kd3GKCqisk";

  static String imageBaseurl = "https://image.tmdb.org/t/p/w500/";
}
