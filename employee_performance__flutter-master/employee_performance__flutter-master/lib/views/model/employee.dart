class EmployeeModel {
  late String name;
  late String username;
  late String email;
  late String password;
  late String designation;
  late String joiningdate;

//<editor-fold desc="Data Methods">

  EmployeeModel({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.designation,
    required this.joiningdate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          username == other.username &&
          email == other.email &&
          password == other.password &&
          designation == other.designation &&
          joiningdate == other.joiningdate);

  @override
  int get hashCode =>
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      password.hashCode ^
      designation.hashCode ^
      joiningdate.hashCode;

  @override
  String toString() {
    return 'EmployeeModel{' +
        ' name: $name,' +
        ' username: $username,' +
        ' email: $email,' +
        ' password: $password,' +
        ' designation: $designation,' +
        ' joiningdate: $joiningdate,' +
        '}';
  }

  EmployeeModel copyWith({
    String? name,
    String? username,
    String? email,
    String? password,
    String? designation,
    String? joiningdate,
  }) {
    return EmployeeModel(
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      designation: designation ?? this.designation,
      joiningdate: joiningdate ?? this.joiningdate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'username': this.username,
      'email': this.email,
      'password': this.password,
      'designation': this.designation,
      'joiningdate': this.joiningdate,
    };
  }

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      designation: map['designation'] as String,
      joiningdate: map['joiningdate'] as String,
    );
  }

//</editor-fold>
}
