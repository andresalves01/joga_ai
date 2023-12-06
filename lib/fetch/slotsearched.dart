import 'package:joga_ai/model/address.dart';
import 'package:joga_ai/model/amenity.dart';
import 'package:joga_ai/model/court.dart';
import 'package:joga_ai/model/photo.dart';
import 'package:joga_ai/model/slot.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SlotSearched {
  static const String uri = "http://localhost:5000/search/slot";

  Address address;
  Court court;
  List<Slot> slots;
  List<Photo>? photos;
  List<Amenity>? amenities;

  SlotSearched(
      {required this.address,
      required this.court,
      required this.slots,
      this.photos,
      this.amenities});

  SlotSearched.fromJson(Map<String, dynamic> json)
      : address = Address.fromJson(json['address'] as Map<String, dynamic>),
        court = Court.fromJson(json['court'] as Map<String, dynamic>),
        slots = (json['slots'] as List<dynamic>)
            .map((e) => Slot.fromJson(e as Map<String, dynamic>))
            .toList(growable: false),
        photos = (json['photos'] as List<dynamic>?)
            ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
            .toList(),
        amenities = (json['amenities'] as List<dynamic>?)
            ?.map((e) => Amenity.fromJson(e as Map<String, dynamic>))
            .toList();

  static Future<List<SlotSearched>> fetchSearchedSlots() async {
    final response =
        await http.get(Uri.parse(uri)).timeout(const Duration(seconds: 30));
    if (response.statusCode != 200) {
      throw Exception(
          "Connection was not successful with backend. Status Code: ${response.statusCode}, Response: ${response.body}");
    }

    List<dynamic> json = jsonDecode(response.body) as List<dynamic>;

    List<SlotSearched> list = (json)
        .map((e) => SlotSearched.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }

  @override
  String toString() {
    return 'SlotSearched {address: $address, court: $court, slots: $slots, photos: $photos, amenities: $amenities}';
  }
}

// void main(List<String> args) {
//   SlotSearched.fetchSearchedSlots().then((value) => print(value.first));
// }
