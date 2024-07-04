class OderMenuCreateResponse {
  final int? id;
  final String? code;
  final String? orderStatus;
  final String? total;
  final int? tableResto;
  final String? tableRestoName;
  final int? waitress;
  final String? waitressName;
  final int? userCreate;

  OderMenuCreateResponse(
      {required this.id,
      required this.code,
      required this.orderStatus,
      required this.total,
      required this.tableResto,
      required this.tableRestoName,
      required this.waitress,
      required this.waitressName,
      required this.userCreate});

  factory OderMenuCreateResponse.fromJson(Map<String, dynamic> json) {
    return OderMenuCreateResponse(
        id: json['id'],
        code: json['code'],
        orderStatus: json['orderStatus'],
        total: json['total'],
        tableResto: json['tableResto'],
        tableRestoName: json['tableRestoName'],
        waitress: json['waitress'],
        waitressName: json['waitressName'],
        userCreate: json['userCreate']);
  }
}
