class MoviesDetails {
  String? imDbId;
  String? title;
  String? fullTitle;
  String? type;
  String? year;
  String? videoId;
  String? videoTitle;
  String? videoDescription;
  String? thumbnailUrl;
  String? uploadDate;
  String? link;
  String? linkEmbed;
  String? errorMessage;

  MoviesDetails(
      {this.imDbId,
        this.title,
        this.fullTitle,
        this.type,
        this.year,
        this.videoId,
        this.videoTitle,
        this.videoDescription,
        this.thumbnailUrl,
        this.uploadDate,
        this.link,
        this.linkEmbed,
        this.errorMessage});

  MoviesDetails.fromJson(Map<String, dynamic> json) {
    imDbId = json['imDbId'];
    title = json['title'];
    fullTitle = json['fullTitle'];
    type = json['type'];
    year = json['year'];
    videoId = json['videoId'];
    videoTitle = json['videoTitle'];
    videoDescription = json['videoDescription'];
    thumbnailUrl = json['thumbnailUrl'];
    uploadDate = json['uploadDate'];
    link = json['link'];
    linkEmbed = json['linkEmbed'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imDbId'] = this.imDbId;
    data['title'] = this.title;
    data['fullTitle'] = this.fullTitle;
    data['type'] = this.type;
    data['year'] = this.year;
    data['videoId'] = this.videoId;
    data['videoTitle'] = this.videoTitle;
    data['videoDescription'] = this.videoDescription;
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['uploadDate'] = this.uploadDate;
    data['link'] = this.link;
    data['linkEmbed'] = this.linkEmbed;
    data['errorMessage'] = this.errorMessage;
    return data;
  }


}
