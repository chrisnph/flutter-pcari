class ContactModel {
  int? page = 0;
  int? perPage = 0;
  int? totalPage = 0;
  List data;

  int? code = 0;
  String? reason = '';

  ContactModel({
    this.page,
    this.perPage,
    this.totalPage,
    required this.data,
    this.code,
    this.reason,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      page: json['page'],
      perPage: json['per_page'],
      totalPage: json['total'],
      data: json['data'],
      code: json['code'],
      reason: json['reason'],
    );
  }
}
