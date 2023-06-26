

class Next {
  String? resourceUri;
  String? name;

  Next({
    this.resourceUri,
    this.name,
  });

  factory Next.fromJson(Map<String, dynamic> json) => Next(
    resourceUri: json["resourceURI"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
  };
}