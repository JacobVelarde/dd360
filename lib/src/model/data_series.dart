
import 'package:test_dd360/src/model/result_series.dart';

class DataSeries {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<ResultSeries>? results;

  DataSeries({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory DataSeries.fromJson(Map<String, dynamic> json) => DataSeries(
    offset: json["offset"],
    limit: json["limit"],
    total: json["total"],
    count: json["count"],
    results: json["results"] == null ? [] : List<ResultSeries>.from(json["results"].map((x) => ResultSeries.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "limit": limit,
    "total": total,
    "count": count,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}