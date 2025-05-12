class CategoryDetail {
    final String name;

    CategoryDetail({
        required this.name,
    });

    factory CategoryDetail.fromJson(Map<String, dynamic> json) {
    return CategoryDetail(
      name: json['name'] as String,
    );
  }

}
