import 'dart:convert';

class Activities {
  Activities({
    this.id,
    this.categoryName,
    this.availableDates,
    this.nameRu,
    this.nameKk,
    this.nameEn,
    this.imageUrl,
    this.code,
    this.enabled,
    this.dateRequired,
    this.skiPassRequired,
    this.description,
    this.workingHours,
    this.tariffs,
    this.createdDate,
    this.updatedDate,
  });

  final int? id;
  final dynamic categoryName;
  final List<DateTime>? availableDates;
  final dynamic nameRu;
  final String? nameKk;
  final String? nameEn;
  final String? imageUrl;
  final String? code;
  final bool? enabled;
  final bool? dateRequired;
  final bool? skiPassRequired;
  final dynamic description;
  final dynamic workingHours;
  final List<Tariff>? tariffs;
  final DateTime? createdDate;
  final DateTime? updatedDate;

  factory Activities.fromRawJson(String str) =>
      Activities.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Activities.fromJson(Map<String, dynamic> json) => Activities(
        id: json["id"],
        categoryName: json["categoryName"],
        availableDates: json["availableDates"] == null
            ? null
            : List<DateTime>.from(
                json["availableDates"].map((x) => DateTime.parse(x))),
        nameRu: json["nameRu"],
        nameKk: json["nameKk"] as String,
        nameEn: json["nameEn"] as String,
        imageUrl: json["imageUrl"],
        code: json["code"],
        enabled: json["enabled"],
        dateRequired: json["dateRequired"],
        skiPassRequired: json["skiPassRequired"],
        description: json["description"],
        workingHours: json["workingHours"],
        tariffs: json["tariffs"] == null
            ? null
            : List<Tariff>.from(json["tariffs"].map((x) => Tariff.fromJson(x))),
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "availableDates": availableDates == null
            ? null
            : List<dynamic>.from(availableDates!.map((x) =>
                "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "nameRu": nameRu,
        "nameKk": nameKk,
        "nameEn": nameEn,
        "imageUrl": imageUrl,
        "code": code,
        "enabled": enabled,
        "dateRequired": dateRequired,
        "skiPassRequired": skiPassRequired,
        "description": description,
        "workingHours": workingHours,
        "tariffs": tariffs == null
            ? null
            : List<dynamic>.from(tariffs!.map((x) => x.toJson())),
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Tariff {
  Tariff({
    this.id,
    this.nameRu,
    this.nameKk,
    this.nameEn,
    this.code,
    this.enabled,
    this.axessMetaTariffId,
    this.priceInfo,
    this.createdDate,
    this.updatedDate,
  });

  final int? id;
  final String? nameRu;
  final String? nameKk;
  final String? nameEn;
  final String? code;
  final bool? enabled;
  final int? axessMetaTariffId;
  final PriceInfo? priceInfo;
  final DateTime? createdDate;
  final DateTime? updatedDate;

  factory Tariff.fromRawJson(String str) => Tariff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tariff.fromJson(Map<String, dynamic> json) => Tariff(
        id: json["id"],
        nameRu: json["nameRu"],
        nameKk: json["nameKk"],
        nameEn: json["nameEn"],
        code: json["code"],
        enabled: json["enabled"],
        axessMetaTariffId: json["axessMetaTariffId"],
        priceInfo: json["priceInfo"] == null
            ? null
            : PriceInfo.fromJson(json["priceInfo"]),
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameRu": nameRu,
        "nameKk": nameKk,
        "nameEn": nameEn,
        "code": code,
        "enabled": enabled,
        "axessMetaTariffId": axessMetaTariffId,
        "priceInfo": priceInfo?.toJson(),
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class PriceInfo {
  PriceInfo({
    this.enabled,
    this.price,
    this.currency,
    this.hasPickupBox,
    this.pickupBoxPrice,
    this.date,
  });

  final bool? enabled;
  final double? price;
  final Currency? currency;
  final bool? hasPickupBox;
  final dynamic pickupBoxPrice;
  final DateTime? date;

  factory PriceInfo.fromRawJson(String str) =>
      PriceInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriceInfo.fromJson(Map<String, dynamic> json) => PriceInfo(
        enabled: json["enabled"],
        price: json["price"],
        currency: json["currency"] == null
            ? null
            : currencyValues.map[json["currency"]],
        hasPickupBox: json["hasPickupBox"],
        pickupBoxPrice: json["pickupBoxPrice"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled,
        "price": price,
        "currency": currency == null ? null : currencyValues.reverse[currency],
        "hasPickupBox": hasPickupBox,
        "pickupBoxPrice": pickupBoxPrice,
        "date": date == null
            ? null
            : "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
      };
}

enum Currency { KZT }

final currencyValues = EnumValues({"KZT": Currency.KZT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
