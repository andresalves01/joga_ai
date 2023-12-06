import 'model.dart';

class Court extends Model {
  final int addressId;
  final String? description;
  final String modality;
  final String name;
  final int playerQty;
  final double rating;

  Court({
    required id,
    required this.addressId,
    required this.description,
    required this.modality,
    required this.name,
    required this.playerQty,
    required this.rating,
  }) : super(id);

  Court.fromJson(Map<String, dynamic> json)
      : addressId = json['address_id'] as int,
        description = json['description'] as String?,
        modality = json['modality'] as String,
        name = json['name'] as String,
        playerQty = json['player_qty'] as int,
        rating = double.parse(json['rating'] as String),
        super.fromJson(json);

  @override
  String toString() {
    return 'Court {id: $id, addressId: $addressId, description: $description, '
        'modality: $modality, name: $name, playerQty: $playerQty, rating: $rating}';
  }
}
