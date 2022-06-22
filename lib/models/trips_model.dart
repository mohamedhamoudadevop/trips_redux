class TopDestination {
  int? id;
  String? name;
  String? image;
  int? reservationsCount;

  TopDestination({this.id, this.name, this.image, this.reservationsCount});

  TopDestination.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    reservationsCount = json['reservationsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['reservationsCount'] = this.reservationsCount;
    return data;
  }
}