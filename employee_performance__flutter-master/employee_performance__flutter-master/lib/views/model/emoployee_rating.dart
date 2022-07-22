 class EmployeeRating{
   late int id;
   late String firstname;
   late String lastname;
   late String department;
   late String designation;

   late int requirUnderstandingScore;
   late int regardingTrainingScore;
   late int equiSoftHandleScore;
   late int rulsPolicyFolloScore;
   late int knoledgeShareWithCoworkersScore;
   late String jobKnoledgeComment;

   late int coworkersTreatedRespectScore;
   late int acceptsCriticismScore;
   late int teamPlayerScore;
   late int teameResourcesShareScore;
   late int executesTaskScore;
   late String teamworkComment;

   late int acceptsMistakeScore;
   late int canWorkWithoutSuperviseScore;
   late int capableTakingAnyDecisionScore;
   late int highPressureSiruationManageScore;
   late int motivateCoworkersToFinishScore;
   late String leadershipComment;

   late String isEligibleForPromotion;
   late String isEligibleForTermination;
   late String extraComments;

  //<editor-fold desc="Data Methods">

   EmployeeRating({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.department,
    required this.designation,
    required this.requirUnderstandingScore,
    required this.regardingTrainingScore,
    required this.equiSoftHandleScore,
    required this.rulsPolicyFolloScore,
    required this.knoledgeShareWithCoworkersScore,
    required this.jobKnoledgeComment,
    required this.coworkersTreatedRespectScore,
    required this.acceptsCriticismScore,
    required this.teamPlayerScore,
    required this.teameResourcesShareScore,
    required this.executesTaskScore,
    required this.teamworkComment,
    required this.acceptsMistakeScore,
    required this.canWorkWithoutSuperviseScore,
    required this.capableTakingAnyDecisionScore,
    required this.highPressureSiruationManageScore,
    required this.motivateCoworkersToFinishScore,
    required this.leadershipComment,
    required this.isEligibleForPromotion,
    required this.isEligibleForTermination,
    required this.extraComments,
  });

   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeRating &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firstname == other.firstname &&
          lastname == other.lastname &&
          department == other.department &&
          designation == other.designation &&
          requirUnderstandingScore == other.requirUnderstandingScore &&
          regardingTrainingScore == other.regardingTrainingScore &&
          equiSoftHandleScore == other.equiSoftHandleScore &&
          rulsPolicyFolloScore == other.rulsPolicyFolloScore &&
          knoledgeShareWithCoworkersScore ==
              other.knoledgeShareWithCoworkersScore &&
          jobKnoledgeComment == other.jobKnoledgeComment &&
          coworkersTreatedRespectScore == other.coworkersTreatedRespectScore &&
          acceptsCriticismScore == other.acceptsCriticismScore &&
          teamPlayerScore == other.teamPlayerScore &&
          teameResourcesShareScore == other.teameResourcesShareScore &&
          executesTaskScore == other.executesTaskScore &&
          teamworkComment == other.teamworkComment &&
          acceptsMistakeScore == other.acceptsMistakeScore &&
          canWorkWithoutSuperviseScore == other.canWorkWithoutSuperviseScore &&
          capableTakingAnyDecisionScore ==
              other.capableTakingAnyDecisionScore &&
          highPressureSiruationManageScore ==
              other.highPressureSiruationManageScore &&
          motivateCoworkersToFinishScore ==
              other.motivateCoworkersToFinishScore &&
          leadershipComment == other.leadershipComment &&
          isEligibleForPromotion == other.isEligibleForPromotion &&
          isEligibleForTermination == other.isEligibleForTermination &&
          extraComments == other.extraComments);

   @override
  int get hashCode =>
      id.hashCode ^
      firstname.hashCode ^
      lastname.hashCode ^
      department.hashCode ^
      designation.hashCode ^
      requirUnderstandingScore.hashCode ^
      regardingTrainingScore.hashCode ^
      equiSoftHandleScore.hashCode ^
      rulsPolicyFolloScore.hashCode ^
      knoledgeShareWithCoworkersScore.hashCode ^
      jobKnoledgeComment.hashCode ^
      coworkersTreatedRespectScore.hashCode ^
      acceptsCriticismScore.hashCode ^
      teamPlayerScore.hashCode ^
      teameResourcesShareScore.hashCode ^
      executesTaskScore.hashCode ^
      teamworkComment.hashCode ^
      acceptsMistakeScore.hashCode ^
      canWorkWithoutSuperviseScore.hashCode ^
      capableTakingAnyDecisionScore.hashCode ^
      highPressureSiruationManageScore.hashCode ^
      motivateCoworkersToFinishScore.hashCode ^
      leadershipComment.hashCode ^
      isEligibleForPromotion.hashCode ^
      isEligibleForTermination.hashCode ^
      extraComments.hashCode;

   @override
  String toString() {
    return 'EmployeeRating{' +
        ' id: $id,' +
        ' firstname: $firstname,' +
        ' lastname: $lastname,' +
        ' department: $department,' +
        ' designation: $designation,' +
        ' requirUnderstandingScore: $requirUnderstandingScore,' +
        ' regardingTrainingScore: $regardingTrainingScore,' +
        ' equiSoftHandleScore: $equiSoftHandleScore,' +
        ' rulsPolicyFolloScore: $rulsPolicyFolloScore,' +
        ' knoledgeShareWithCoworkersScore: $knoledgeShareWithCoworkersScore,' +
        ' jobKnoledgeComment: $jobKnoledgeComment,' +
        ' coworkersTreatedRespectScore: $coworkersTreatedRespectScore,' +
        ' acceptsCriticismScore: $acceptsCriticismScore,' +
        ' teamPlayerScore: $teamPlayerScore,' +
        ' teameResourcesShareScore: $teameResourcesShareScore,' +
        ' executesTaskScore: $executesTaskScore,' +
        ' teamworkComment: $teamworkComment,' +
        ' acceptsMistakeScore: $acceptsMistakeScore,' +
        ' canWorkWithoutSuperviseScore: $canWorkWithoutSuperviseScore,' +
        ' capableTakingAnyDecisionScore: $capableTakingAnyDecisionScore,' +
        ' highPressureSiruationManageScore: $highPressureSiruationManageScore,' +
        ' motivateCoworkersToFinishScore: $motivateCoworkersToFinishScore,' +
        ' leadershipComment: $leadershipComment,' +
        ' isEligibleForPromotion: $isEligibleForPromotion,' +
        ' isEligibleForTermination: $isEligibleForTermination,' +
        ' extraComments: $extraComments,' +
        '}';
  }

   EmployeeRating copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? department,
    String? designation,
    int? requirUnderstandingScore,
    int? regardingTrainingScore,
    int? equiSoftHandleScore,
    int? rulsPolicyFolloScore,
    int? knoledgeShareWithCoworkersScore,
    String? jobKnoledgeComment,
    int? coworkersTreatedRespectScore,
    int? acceptsCriticismScore,
    int? teamPlayerScore,
    int? teameResourcesShareScore,
    int? executesTaskScore,
    String? teamworkComment,
    int? acceptsMistakeScore,
    int? canWorkWithoutSuperviseScore,
    int? capableTakingAnyDecisionScore,
    int? highPressureSiruationManageScore,
    int? motivateCoworkersToFinishScore,
    String? leadershipComment,
    String? isEligibleForPromotion,
    String? isEligibleForTermination,
    String? extraComments,
  }) {
    return EmployeeRating(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      department: department ?? this.department,
      designation: designation ?? this.designation,
      requirUnderstandingScore:
          requirUnderstandingScore ?? this.requirUnderstandingScore,
      regardingTrainingScore:
          regardingTrainingScore ?? this.regardingTrainingScore,
      equiSoftHandleScore: equiSoftHandleScore ?? this.equiSoftHandleScore,
      rulsPolicyFolloScore: rulsPolicyFolloScore ?? this.rulsPolicyFolloScore,
      knoledgeShareWithCoworkersScore: knoledgeShareWithCoworkersScore ??
          this.knoledgeShareWithCoworkersScore,
      jobKnoledgeComment: jobKnoledgeComment ?? this.jobKnoledgeComment,
      coworkersTreatedRespectScore:
          coworkersTreatedRespectScore ?? this.coworkersTreatedRespectScore,
      acceptsCriticismScore:
          acceptsCriticismScore ?? this.acceptsCriticismScore,
      teamPlayerScore: teamPlayerScore ?? this.teamPlayerScore,
      teameResourcesShareScore:
          teameResourcesShareScore ?? this.teameResourcesShareScore,
      executesTaskScore: executesTaskScore ?? this.executesTaskScore,
      teamworkComment: teamworkComment ?? this.teamworkComment,
      acceptsMistakeScore: acceptsMistakeScore ?? this.acceptsMistakeScore,
      canWorkWithoutSuperviseScore:
          canWorkWithoutSuperviseScore ?? this.canWorkWithoutSuperviseScore,
      capableTakingAnyDecisionScore:
          capableTakingAnyDecisionScore ?? this.capableTakingAnyDecisionScore,
      highPressureSiruationManageScore: highPressureSiruationManageScore ??
          this.highPressureSiruationManageScore,
      motivateCoworkersToFinishScore:
          motivateCoworkersToFinishScore ?? this.motivateCoworkersToFinishScore,
      leadershipComment: leadershipComment ?? this.leadershipComment,
      isEligibleForPromotion:
          isEligibleForPromotion ?? this.isEligibleForPromotion,
      isEligibleForTermination:
          isEligibleForTermination ?? this.isEligibleForTermination,
      extraComments: extraComments ?? this.extraComments,
    );
  }

   Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'firstname': this.firstname,
      'lastname': this.lastname,
      'department': this.department,
      'designation': this.designation,
      'requirUnderstandingScore': this.requirUnderstandingScore,
      'regardingTrainingScore': this.regardingTrainingScore,
      'equiSoftHandleScore': this.equiSoftHandleScore,
      'rulsPolicyFolloScore': this.rulsPolicyFolloScore,
      'knoledgeShareWithCoworkersScore': this.knoledgeShareWithCoworkersScore,
      'jobKnoledgeComment': this.jobKnoledgeComment,
      'coworkersTreatedRespectScore': this.coworkersTreatedRespectScore,
      'acceptsCriticismScore': this.acceptsCriticismScore,
      'teamPlayerScore': this.teamPlayerScore,
      'teameResourcesShareScore': this.teameResourcesShareScore,
      'executesTaskScore': this.executesTaskScore,
      'teamworkComment': this.teamworkComment,
      'acceptsMistakeScore': this.acceptsMistakeScore,
      'canWorkWithoutSuperviseScore': this.canWorkWithoutSuperviseScore,
      'capableTakingAnyDecisionScore': this.capableTakingAnyDecisionScore,
      'highPressureSiruationManageScore': this.highPressureSiruationManageScore,
      'motivateCoworkersToFinishScore': this.motivateCoworkersToFinishScore,
      'leadershipComment': this.leadershipComment,
      'isEligibleForPromotion': this.isEligibleForPromotion,
      'isEligibleForTermination': this.isEligibleForTermination,
      'extraComments': this.extraComments,
    };
  }

  factory EmployeeRating.fromMap(Map<String, dynamic> map) {
    return EmployeeRating(
      id: map['id'] as int,
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      department: map['department'] as String,
      designation: map['designation'] as String,
      requirUnderstandingScore: map['requirUnderstandingScore'] as int,
      regardingTrainingScore: map['regardingTrainingScore'] as int,
      equiSoftHandleScore: map['equiSoftHandleScore'] as int,
      rulsPolicyFolloScore: map['rulsPolicyFolloScore'] as int,
      knoledgeShareWithCoworkersScore:
          map['knoledgeShareWithCoworkersScore'] as int,
      jobKnoledgeComment: map['jobKnoledgeComment'] as String,
      coworkersTreatedRespectScore: map['coworkersTreatedRespectScore'] as int,
      acceptsCriticismScore: map['acceptsCriticismScore'] as int,
      teamPlayerScore: map['teamPlayerScore'] as int,
      teameResourcesShareScore: map['teameResourcesShareScore'] as int,
      executesTaskScore: map['executesTaskScore'] as int,
      teamworkComment: map['teamworkComment'] as String,
      acceptsMistakeScore: map['acceptsMistakeScore'] as int,
      canWorkWithoutSuperviseScore: map['canWorkWithoutSuperviseScore'] as int,
      capableTakingAnyDecisionScore:
          map['capableTakingAnyDecisionScore'] as int,
      highPressureSiruationManageScore:
          map['highPressureSiruationManageScore'] as int,
      motivateCoworkersToFinishScore:
          map['motivateCoworkersToFinishScore'] as int,
      leadershipComment: map['leadershipComment'] as String,
      isEligibleForPromotion: map['isEligibleForPromotion'] as String,
      isEligibleForTermination: map['isEligibleForTermination'] as String,
      extraComments: map['extraComments'] as String,
    );
  }

  //</editor-fold>
}