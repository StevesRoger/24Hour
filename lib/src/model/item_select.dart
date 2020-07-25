class ItemSelect {
  String label;
  dynamic value;
  Map json;

  ItemSelect(this.label, {this.value}) {
    if (value == null) value = label;
  }
}
