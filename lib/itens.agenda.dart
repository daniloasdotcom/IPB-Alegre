class FeedbackModel {
  String profilePic;
  String name;
  String source;
  String feedback;
  String sourceUrl;

  FeedbackModel(
      {required this.feedback, required this.name, required this.profilePic, required this.source, required this.sourceUrl});

  factory FeedbackModel.fromJson(dynamic json) {
    return FeedbackModel(
      feedback: "${json['feedback']}",
      name: "${json['name']}",
      profilePic: "${json['profile_pic']}",
      source: "${json['source']}",
      sourceUrl: "${json['source_url']}",
    );
  }

  Map toJson() => {
        "profile_pic": profilePic,
        "source": source,
        "source_url": sourceUrl,
        "name": name,
        "feedback": feedback
      };
}