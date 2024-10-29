import 'package:flutter_flavor/flutter_flavor.dart';

enum Environment { dev, prod }

class FlavorConf {
  static void initialize(Environment env) {
    if (env == Environment.dev) {
      FlavorConfig(
          name: "development",
          variables: {"baseUrl": "https://api.themoviedb.org/3/movie/"});
    } else if (env == Environment.prod) {
      FlavorConfig(
          name: "production",
          variables: {"baseUrl": "https://api.themoviedb.org/3/movie/"});
    }
  }
}
