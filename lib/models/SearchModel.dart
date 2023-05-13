class SearchModel {
  String? searchType;
  String? expression;
  List<Results>? results;
  String? errorMessage;

  SearchModel(
      {this.searchType, this.expression, this.results, this.errorMessage});

  SearchModel.fromJson(Map<String, dynamic> json) {
    searchType = json['searchType'];
    expression = json['expression'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['searchType'] = this.searchType;
    data['expression'] = this.expression;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}

class Results {
  String? id;
  String? resultType;
  String? image;
  String? title;
  String? description;

  Results({this.id, this.resultType, this.image, this.title, this.description});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resultType = json['resultType'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['resultType'] = this.resultType;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}