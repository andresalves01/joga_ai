import 'model.dart';

class Amenity extends Model {
  final String iconUrl;
  final String name;

  Amenity({
    required int id,
    required this.iconUrl,
    required this.name,
  }) : super(id);

  // Named constructor for creating an Amenity instance from JSON
  Amenity.fromJson(Map<String, dynamic> json)
      : iconUrl = json['icon_url'] as String,
        name = json['name'] as String,
        super.fromJson(json);

  @override
  String toString() {
    return 'Amenity {id: $id, iconUrl: $iconUrl, name: $name}';
  }
}
