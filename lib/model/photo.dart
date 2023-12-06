import 'model.dart';

class Photo extends Model {
  final int courtId;
  final String url;

  Photo({
    required id,
    required this.courtId,
    required this.url,
  }) : super(id);

  // Named constructor for creating a Photo instance from JSON
  Photo.fromJson(Map<String, dynamic> json)
      : courtId = json['court_id'] as int,
        url = json['url'] as String,
        super.fromJson(json);

  @override
  String toString() {
    return 'Photo {id: $id, courtId: $courtId, url: $url}';
  }
}
