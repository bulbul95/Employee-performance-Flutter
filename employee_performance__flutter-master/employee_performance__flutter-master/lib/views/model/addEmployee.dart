class EmployeeAdd{
  late int id;
  late String firstname;
  late String lastname;
  late String email;
  late String gender;
  late String qualification;
  late String department;
  late String date_of_birth;
  late String nationality;
  late String employeementHistory;

//<editor-fold desc="Data Methods">

  EmployeeAdd({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.gender,
    required this.qualification,
    required this.department,
    required this.date_of_birth,
    required this.nationality,
    required this.employeementHistory,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeAdd &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstname == other.firstname &&
          lastname == other.lastname &&
          email == other.email &&
          gender == other.gender &&
          qualification == other.qualification &&
          department == other.department &&
          date_of_birth == other.date_of_birth &&
          nationality == other.nationality &&
          employeementHistory == other.employeementHistory);

  @override
  int get hashCode =>
      id.hashCode ^
      firstname.hashCode ^
      lastname.hashCode ^
      email.hashCode ^
      gender.hashCode ^
      qualification.hashCode ^
      department.hashCode ^
      date_of_birth.hashCode ^
      nationality.hashCode ^
      employeementHistory.hashCode;

  @override
  String toString() {
    return 'EmployeeAdd{' +
        ' id: $id,' +
        ' firstname: $firstname,' +
        ' lastname: $lastname,' +
        ' email: $email,' +
        ' gender: $gender,' +
        ' qualification: $qualification,' +
        ' department: $department,' +
        ' date_of_birth: $date_of_birth,' +
        ' nationality: $nationality,' +
        ' employeementHistory: $employeementHistory,' +
        '}';
  }

  EmployeeAdd copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? gender,
    String? qualification,
    String? department,
    String? date_of_birth,
    String? nationality,
    String? employeementHistory,
  }) {
    return EmployeeAdd(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      qualification: qualification ?? this.qualification,
      department: department ?? this.department,
      date_of_birth: date_of_birth ?? this.date_of_birth,
      nationality: nationality ?? this.nationality,
      employeementHistory: employeementHistory ?? this.employeementHistory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'firstname': this.firstname,
      'lastname': this.lastname,
      'email': this.email,
      'gender': this.gender,
      'qualification': this.qualification,
      'department': this.department,
      'date_of_birth': this.date_of_birth,
      'nationality': this.nationality,
      'employeementHistory': this.employeementHistory,
    };
  }

  factory EmployeeAdd.fromMap(Map<String, dynamic> map) {
    return EmployeeAdd(
      id: map['id'] as int,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      gender: map['gender'] as String,
      qualification: map['qualification'] as String,
      department: map['department'] as String,
      date_of_birth: map['date_of_birth'] as String,
      nationality: map['nationality'] as String,
      employeementHistory: map['employeementHistory'] as String,
    );
  }

//</editor-fold>
}
