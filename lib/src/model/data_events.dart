
import 'package:test_dd360/src/model/result_events.dart';

class DataEvents {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<ResultEvents>? results;

  DataEvents({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory DataEvents.fromJson(Map<String, dynamic> json) => DataEvents(
    offset: json["offset"],
    limit: json["limit"],
    total: json["total"],
    count: json["count"],
    results: json["results"] == null ? [] : List<ResultEvents>.from(json["results"].map((x) => ResultEvents.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "limit": limit,
    "total": total,
    "count": count,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}