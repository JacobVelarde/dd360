
class OriginalIssue {
  String? resourceUri;
  String? name;

  OriginalIssue({
    this.resourceUri,
    this.name,
  });

  factory OriginalIssue.fromJson(Map<String, dynamic> json) => OriginalIssue(
    resourceUri: json["resourceURI"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
  };
}