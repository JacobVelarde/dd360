
import 'package:test_dd360/src/model/result_stories.dart';

class DataStories {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<ResultStories>? results;

  DataStories({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory DataStories.fromJson(Map<String, dynamic> json) => DataStories(
    offset: json["offset"],
    limit: json["limit"],
    total: json["total"],
    count: json["count"],
    results: json["results"] == null ? [] : List<ResultStories>.from(json["results"].map((x) => ResultStories.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "limit": limit,
    "total": total,
    "count": count,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}