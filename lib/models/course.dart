/// Model class representing a course with its academic details
class Course {
  /// Unique identifier for the course
  final String id;

  /// Name of the course
  String courseName;

  /// Continuous Assessment score (typically 0-40)
  double caScore;

  /// Exam score (typically 0-60)
  double examScore;

  /// Credit units/hours for the course
  double creditUnits;

  /// Constructor for creating a Course instance
  Course({
    required this.id,
    required this.courseName,
    required this.caScore,
    required this.examScore,
    required this.creditUnits,
  });

  /// Returns the final score (CA + Exam)
  double get finalScore => caScore + examScore;

  /// Returns the course as a JSON-serializable map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseName': courseName,
      'caScore': caScore,
      'examScore': examScore,
      'creditUnits': creditUnits,
    };
  }

  /// Creates a Course instance from a JSON map
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] ?? '',
      courseName: json['courseName'] ?? '',
      caScore: (json['caScore'] as num?)?.toDouble() ?? 0.0,
      examScore: (json['examScore'] as num?)?.toDouble() ?? 0.0,
      creditUnits: (json['creditUnits'] as num?)?.toDouble() ?? 0.0,
    );
  }
}