abstract class Model {
  final int id;
  Model(this.id);

  Model.fromJson(Map<String, dynamic> json) : id = json["id"] as int;

  String getClassName() {
    return runtimeType.toString();
  }
}
