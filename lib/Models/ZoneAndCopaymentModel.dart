class ZoneAndCopaymentModel {
  ZoneAndCopaymentModel({
    List<Zones>? zones,
    List<CoPaymentRules>? coPaymentRules,
  }) {
    _zones = zones;
    _coPaymentRules = coPaymentRules;
  }

  ZoneAndCopaymentModel.fromJson(dynamic json) {
    if (json['zones'] != null) {
      _zones = [];
      json['zones'].forEach((v) {
        _zones?.add(Zones.fromJson(v));
      });
    }
    if (json['coPaymentRules'] != null) {
      _coPaymentRules = [];
      json['coPaymentRules'].forEach((v) {
        _coPaymentRules?.add(CoPaymentRules.fromJson(v));
      });
    }
  }

  List<Zones>? _zones;
  List<CoPaymentRules>? _coPaymentRules;

  ZoneAndCopaymentModel copyWith({
    List<Zones>? zones,
    List<CoPaymentRules>? coPaymentRules,
  }) =>
      ZoneAndCopaymentModel(
        zones: zones ?? _zones,
        coPaymentRules: coPaymentRules ?? _coPaymentRules,
      );

  List<Zones>? get zones => _zones;

  List<CoPaymentRules>? get coPaymentRules => _coPaymentRules;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_zones != null) {
      map['zones'] = _zones?.map((v) => v.toJson()).toList();
    }
    if (_coPaymentRules != null) {
      map['coPaymentRules'] = _coPaymentRules?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CoPaymentRules {
  CoPaymentRules({
    String? insuredPaying,
    String? copaymentRules,
  }) {
    _insuredPaying = insuredPaying;
    _copaymentRules = copaymentRules;
  }

  CoPaymentRules.fromJson(dynamic json) {
    _insuredPaying = json['insuredPaying'];
    _copaymentRules = json['copaymentRules'];
  }

  String? _insuredPaying;
  String? _copaymentRules;

  CoPaymentRules copyWith({
    String? insuredPaying,
    String? copaymentRules,
  }) =>
      CoPaymentRules(
        insuredPaying: insuredPaying ?? _insuredPaying,
        copaymentRules: copaymentRules ?? _copaymentRules,
      );

  String? get insuredPaying => _insuredPaying;

  String? get copaymentRules => _copaymentRules;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['insuredPaying'] = _insuredPaying;
    map['copaymentRules'] = _copaymentRules;
    return map;
  }
}

class Zones {
  Zones({
    String? zone,
    String? states,
    String? note,
  }) {
    _zone = zone;
    _states = states;
    _note = note;
  }

  Zones.fromJson(dynamic json) {
    _zone = json['zone'];
    _states = json['states'];
    _note = json['note'];
  }

  String? _zone;
  String? _states;
  String? _note;

  Zones copyWith({
    String? zone,
    String? states,
    String? note,
  }) =>
      Zones(
        zone: zone ?? _zone,
        states: states ?? _states,
        note: note ?? _note,
      );

  String? get zone => _zone;

  String? get states => _states;

  String? get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['zone'] = _zone;
    map['states'] = _states;
    map['note'] = _note;
    return map;
  }
}
