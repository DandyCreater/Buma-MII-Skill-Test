class MovieDetailRespEntity {
  bool adult;
  String backdropPath;
  BelongsToCollectionEntity? belongsToCollection;
  int budget;
  List<GenreEntity> genres;
  String homepage;
  int? id;
  String imdbId;
  List<String> originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompanyEntity> productionCompanies;
  List<ProductionCountryEntity> productionCountries;
  DateTime releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguageEntity> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailRespEntity({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailRespEntity.fromJson(Map<String, dynamic> json) =>
      MovieDetailRespEntity(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection:
            BelongsToCollectionEntity.fromJson(json["belongs_to_collection"]),
        budget: json["budget"],
        genres: List<GenreEntity>.from(
            json["genres"].map((x) => GenreEntity.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompanyEntity>.from(
            json["production_companies"]
                .map((x) => ProductionCompanyEntity.fromJson(x))),
        productionCountries: List<ProductionCountryEntity>.from(
            json["production_countries"]
                .map((x) => ProductionCountryEntity.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguageEntity>.from(
            json["spoken_languages"]
                .map((x) => SpokenLanguageEntity.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection?.toJson(),
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies":
            List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries":
            List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages":
            List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class BelongsToCollectionEntity {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollectionEntity({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory BelongsToCollectionEntity.fromJson(Map<String, dynamic> json) =>
      BelongsToCollectionEntity(
        id: json["id"],
        name: json["name"],
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
      };
}

class GenreEntity {
  int? id;
  String name;

  GenreEntity({
    required this.id,
    required this.name,
  });

  factory GenreEntity.fromJson(Map<String, dynamic> json) => GenreEntity(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ProductionCompanyEntity {
  int? id;
  String? logoPath;
  String name;
  String originCountry;

  ProductionCompanyEntity({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanyEntity.fromJson(Map<String, dynamic> json) =>
      ProductionCompanyEntity(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class ProductionCountryEntity {
  String iso31661;
  String name;

  ProductionCountryEntity({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountryEntity.fromJson(Map<String, dynamic> json) =>
      ProductionCountryEntity(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

class SpokenLanguageEntity {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguageEntity({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguageEntity.fromJson(Map<String, dynamic> json) =>
      SpokenLanguageEntity(
        englishName: json["english_name"],
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
      };
}
