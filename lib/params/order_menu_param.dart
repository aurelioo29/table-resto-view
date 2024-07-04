class OrderMenuParam {
  final int? tableResto;
  final int? waitress;
  final int? userCreate;

  OrderMenuParam(
      {required this.tableResto,
      required this.waitress,
      required this.userCreate});

  // model json ke flutter (GET)
  factory OrderMenuParam.fromJson(Map<String, dynamic> json) {
    return OrderMenuParam(
      tableResto: json['tableResto'],
      waitress: json['waitress'],
      userCreate: json['userCreate'],
    );
  }

  // model flutter ke json (POST)
  Map<String, dynamic> toJson() {
    return {
      'table_resto': tableResto,
      'waitress': waitress,
      'user_create': userCreate,
    };
  }
}
