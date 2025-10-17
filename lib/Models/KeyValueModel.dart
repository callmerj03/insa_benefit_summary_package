class KeyValueModel {
  String? _key;
  String? _value;
  String? _value1;
  String? _tooltip;
  String? _disclaimer;
  String? _value2;
  String? _value3;
  String? _table_data;
  bool? _isSelected;
  bool _isAddOn = false;

  KeyValueModel(this._key, this._value, this._isSelected);

  KeyValueModel.withTooltip(
    this._key,
    this._value,
    this._disclaimer,
    this._isSelected,
    this._tooltip,
    this._isAddOn,
    this._table_data,
  );

  KeyValueModel.novalue();

  String? get key => _key;

  set key(String? value) {
    _key = value;
  }

  String? get value => _value;

  bool? get isSelected => _isSelected;

  set isSelected(bool? value) {
    _isSelected = value;
  }

  set value(String? value) {
    _value = value;
  }

  String? get value2 => _value2;

  set value2(String? value) {
    _value2 = value;
  }

  String? get value1 => _value1;

  set value1(String? value) {
    _value1 = value;
  }

  String? get value3 => _value3;

  set value3(String? value) {
    _value3 = value;
  }

  String? get tooltip => _tooltip;

  set tooltip(String? value) {
    _tooltip = value;
  }

  String? get disclaimer => _disclaimer;

  set disclaimer(String? value) {
    _disclaimer = value;
  }

  bool get isAddOn => _isAddOn;

  set isAddOn(bool value) {
    _isAddOn = value;
  }

  String? get table_data => _table_data;

  set table_data(String? value) {
    _table_data = value;
  }
}
