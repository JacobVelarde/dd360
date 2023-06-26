
enum Status{
  loading,
  ready,
  errorInternet,
  errorBack
}

class StatusNetwork{
  Status status;
  Object? data;

  StatusNetwork(this.status, {this.data});
}