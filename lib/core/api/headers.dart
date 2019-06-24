class Headers {
  Map<String, String> json;
  Map<String, String> _defaultHeaders;

  Headers({String token, this.json}) {
    _defaultHeaders = {'Authorization': token, 'Content-Type': 'application/json'};

    if (this.json == null) this.json = Map();

    this.json.addAll(_defaultHeaders);
    this.json = json;
  }

  void add(Map<String, String> headers) {
    this.json.addAll(headers);
  }
}
