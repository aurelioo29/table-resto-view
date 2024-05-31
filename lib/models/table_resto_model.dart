class TableRestoModel {
  int? id;
  String? code;
  String? name;
  int? capacity;
  String? tableStatus;

  TableRestoModel(
      this.id, this.code, this.name, this.capacity, this.tableStatus);

  TableRestoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    capacity = json['capacity'];
    tableStatus = json['table_status'];
  }
}
