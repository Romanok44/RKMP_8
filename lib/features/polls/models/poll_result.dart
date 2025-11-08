class PollResult {
  final String id;
  final String title;
  final String category;
  final DateTime date;
  final String result;
  final int rating;
  final String review;

  PollResult({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.result,
    this.rating = 0,
    this.review = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'date': date.toIso8601String(),
      'result': result,
      'rating': rating,
      'review': review,
    };
  }

  factory PollResult.fromJson(Map<String, dynamic> json) {
    return PollResult(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      date: DateTime.parse(json['date']),
      result: json['result'],
      rating: json['rating'] ?? 0,
      review: json['review'] ?? '',
    );
  }

  PollResult copyWith({
    int? rating,
    String? review,
  }) {
    return PollResult(
      id: id,
      title: title,
      category: category,
      date: date,
      result: result,
      rating: rating ?? this.rating,
      review: review ?? this.review,
    );
  }
}