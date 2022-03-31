class AddressState {
  String? value;
  String? name;

  AddressState({this.value, this.name});

  AddressState.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['name'] = this.name;
    return data;
  }
}