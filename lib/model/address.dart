import 'model.dart';

class Address extends Model {
  final String street;
  final int number;
  final String zipcode;
  final String? block;
  final String? complement;
  final String? cityDistrict;
  final String city;
  final String state;
  final String country;
  final double? latitude;
  final double? longitude;

  Address(
      {required int id,
      required this.street,
      required this.number,
      required this.zipcode,
      required this.block,
      required this.complement,
      required this.cityDistrict,
      required this.city,
      required this.state,
      required this.country,
      this.latitude,
      this.longitude})
      : super(id);

  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'] as String,
        number = json['number'] as int,
        zipcode = json['zipcode'] as String,
        block = json['block'] as String?,
        complement = json['complement'] as String?,
        cityDistrict = json['city_district'] as String?,
        city = json['city'] as String,
        state = json['state'] as String,
        country = json['country'] as String,
        latitude = double.tryParse(json['latitude'] as String? ?? ""),
        longitude = double.tryParse(json['longitude'] as String? ?? ""),
        super.fromJson(json);

  @override
  String toString() {
    List<String> addressParts = [];

    // Add non-null properties to the list
    addressParts.add(street);
    addressParts.add('$number');
    addressParts.add(zipcode);
    if (block != null) addressParts.add(block!);
    if (complement != null) addressParts.add(complement!);
    if (cityDistrict != null) addressParts.add(cityDistrict!);
    addressParts.add(city);
    addressParts.add(state);
    addressParts.add(country);
    if (latitude != null && longitude != null) {
      addressParts.add('($latitude, $longitude)');
    }

    // Join the parts with commas and format it like a real address
    return addressParts.join(', ');
  }

  String toDisplayString() {
    List<String> addressParts = [];

    // Add non-null properties to the list
    if (cityDistrict != null) addressParts.add(cityDistrict!);
    addressParts.add(city);
    addressParts.add(state);
    addressParts.add(country);

    // Join the parts with commas and format it like a real address
    return addressParts.join(', ');
  }
}
