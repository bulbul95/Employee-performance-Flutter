class EmployeePayload {

  late String email;
  late String password;

//<editor-fold desc="Data Methods">

  EmployeePayload({
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeePayload &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          password == other.password);

  @override
  int get hashCode => email.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'EmployeeModel{' + ' email: $email,' + ' password: $password,' + '}';
  }

  EmployeePayload copyWith({
    String? email,
    String? password,
  }) {
    return EmployeePayload(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'password': this.password,
    };
  }

  factory EmployeePayload.fromMap(Map<String, dynamic> map) {
    return EmployeePayload(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

//</editor-fold>
}
