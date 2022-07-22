class TotalInfo{
  int totalEmployeeCount;
  int totalFeedbackCount;
  int noFeedbackCount;

//<editor-fold desc="Data Methods">

  TotalInfo({
    required this.totalEmployeeCount,
    required this.totalFeedbackCount,
    required this.noFeedbackCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TotalInfo &&
          runtimeType == other.runtimeType &&
          totalEmployeeCount == other.totalEmployeeCount &&
          totalFeedbackCount == other.totalFeedbackCount &&
          noFeedbackCount == other.noFeedbackCount);

  @override
  int get hashCode =>
      totalEmployeeCount.hashCode ^
      totalFeedbackCount.hashCode ^
      noFeedbackCount.hashCode;

  @override
  String toString() {
    return 'TotalInfo{' +
        ' totalEmployeeCount: $totalEmployeeCount,' +
        ' totalFeedbackCount: $totalFeedbackCount,' +
        ' noFeedbackCount: $noFeedbackCount,' +
        '}';
  }

  TotalInfo copyWith({
    int? totalEmployeeCount,
    int? totalFeedbackCount,
    int? noFeedbackCount,
  }) {
    return TotalInfo(
      totalEmployeeCount: totalEmployeeCount ?? this.totalEmployeeCount,
      totalFeedbackCount: totalFeedbackCount ?? this.totalFeedbackCount,
      noFeedbackCount: noFeedbackCount ?? this.noFeedbackCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalEmployeeCount': this.totalEmployeeCount,
      'totalFeedbackCount': this.totalFeedbackCount,
      'noFeedbackCount': this.noFeedbackCount,
    };
  }

  factory TotalInfo.fromMap(Map<String, dynamic> map) {
    return TotalInfo(
      totalEmployeeCount: map['totalEmployeeCount'] as int,
      totalFeedbackCount: map['totalFeedbackCount'] as int,
      noFeedbackCount: map['noFeedbackCount'] as int,
    );
  }

//</editor-fold>
}