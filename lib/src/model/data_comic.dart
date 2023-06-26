
import 'package:test_dd360/src/model/result_comic.dart';

class DataComic{
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<ResultComic>? results;

  DataComic({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory DataComic.fromJson(Map<String, dynamic> json) => DataComic(
    offset: json["offset"],
    limit: json["limit"],
    total: json["total"],
    count: json["count"],
    results: json["results"] == null ? [] : List<ResultComic>.from(json["results"].map((x) => ResultComic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "limit": limit,
    "total": total,
    "count": count,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}