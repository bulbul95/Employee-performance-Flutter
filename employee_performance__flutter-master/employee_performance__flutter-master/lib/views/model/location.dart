class Location{
 late int id;
 late int empId;
 late double latitude;
 late double longitude;

//<editor-fold desc="Data Methods">

  Location({
    required this.id,
    required this.empId,
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          empId == other.empId &&
          latitude == other.latitude &&
          longitude == other.longitude);

  @override
  int get hashCode =>
      id.hashCode ^ empId.hashCode ^ latitude.hashCode ^ longitude.hashCode;

  @override
  String toString() {
    return 'Location{' +
        ' id: $id,' +
        ' empId: $empId,' +
        ' latitude: $latitude,' +
        ' longitude: $longitude,' +
        '}';
  }

  Location copyWith({
    int? id,
    int? empId,
    double? latitude,
    double? longitude,
  }) {
    return Location(
      id: id ?? this.id,
      empId: empId ?? this.empId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'empId': this.empId,
      'latitude': this.latitude,
      'longitude': this.longitude,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      id: map['id'] as int,
      empId: map['empId'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

//</editor-fold>
}