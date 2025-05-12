class CustomerReviewDetail {
    final String name;
    final String review;
    final String date;

    CustomerReviewDetail({
        required this.name,
        required this.review,
        required this.date,
    });

    factory CustomerReviewDetail.fromJson(Map<String, dynamic> json) {
    return CustomerReviewDetail(
      name: json['name'] as String,
      review: json['review'] as String,
      date: json['date'] as String,
    );
  }
}
