import '../models/course.dart';

/// Service class handling all grade calculation logic
class GradeCalculator {
  /// Grade thresholds and their corresponding letter grades and GPA points
  static const Map<String, Map<String, dynamic>> gradeScale = {
    'A': {'minScore': 80, 'maxScore': 100, 'gpa': 4.0},
    'B': {'minScore': 70, 'maxScore': 79, 'gpa': 3.0},
    'C': {'minScore': 60, 'maxScore': 69, 'gpa': 2.0},
    'D': {'minScore': 50, 'maxScore': 59, 'gpa': 1.0},
    'F': {'minScore': 0, 'maxScore': 49, 'gpa': 0.0},
  };

  /// Calculates the letter grade for a given score
  /// 
  /// Parameters:
  ///   - score: The final score (typically 0-100)
  /// 
  /// Returns:
  ///   - A string representing the letter grade (A, B, C, D, or F)
  static String getLetterGrade(double score) {
    if (score < 0 || score > 100) {
      return 'Invalid';
    }

    for (final entry in gradeScale.entries) {
      final minScore = entry.value['minScore'] as int;
      final maxScore = entry.value['maxScore'] as int;
      if (score >= minScore && score <= maxScore) {
        return entry.key;
      }
    }
    return 'F';
  }

  /// Calculates the GPA points for a given score
  /// 
  /// Parameters:
  ///   - score: The final score (typically 0-100)
  /// 
  /// Returns:
  ///   - A double representing the GPA points (0.0 to 4.0)
  static double getGPAPoints(double score) {
    final letterGrade = getLetterGrade(score);
    return (gradeScale[letterGrade]?['gpa'] as num?)?.toDouble() ?? 0.0;
  }

  /// Calculates the overall GPA for a list of courses
  /// 
  /// Formula: Total GPA = Σ (Grade Point × Course Credit) / Σ Credits
  /// 
  /// Parameters:
  ///   - courses: List of Course objects
  /// 
  /// Returns:
  ///   - A double representing the overall GPA (0.0 to 4.0)
  static double calculateOverallGPA(List<Course> courses) {
    if (courses.isEmpty) {
      return 0.0;
    }

    double totalGPAPoints = 0.0;
    double totalCredits = 0.0;

    for (final course in courses) {
      final gpaPoints = getGPAPoints(course.finalScore);
      totalGPAPoints += gpaPoints * course.creditUnits;
      totalCredits += course.creditUnits;
    }

    if (totalCredits == 0) {
      return 0.0;
    }

    return totalGPAPoints / totalCredits;
  }

  /// Calculates the total credit units from all courses
  /// 
  /// Parameters:
  ///   - courses: List of Course objects
  /// 
  /// Returns:
  ///   - A double representing the total credits
  static double calculateTotalCredits(List<Course> courses) {
    return courses.fold(0.0, (sum, course) => sum + course.creditUnits);
  }

  /// Calculates the average percentage across all courses
  /// 
  /// Parameters:
  ///   - courses: List of Course objects
  /// 
  /// Returns:
  ///   - A double representing the average percentage (0.0 to 100.0)
  static double calculateAveragePercentage(List<Course> courses) {
    if (courses.isEmpty) {
      return 0.0;
    }

    double totalScore = 0.0;
    for (final course in courses) {
      totalScore += course.finalScore;
    }

    return totalScore / courses.length;
  }

  /// Validates if a score is within the acceptable range
  /// 
  /// Parameters:
  ///   - score: The score to validate
  /// 
  /// Returns:
  ///   - true if the score is valid (0-100), false otherwise
  static bool isValidScore(double score) {
    return score >= 0 && score <= 100;
  }

  /// Validates if credit units are positive
  /// 
  /// Parameters:
  ///   - credits: The credit units to validate
  /// 
  /// Returns:
  ///   - true if credits are positive, false otherwise
  static bool isValidCredits(double credits) {
    return credits > 0;
  }

  /// Generates a summary of grade calculation for a course
  /// 
  /// Parameters:
  ///   - course: The Course object to summarize
  /// 
  /// Returns:
  ///   - A map containing grade details
  static Map<String, dynamic> getCourseSummary(Course course) {
    final finalScore = course.finalScore;
    final letterGrade = getLetterGrade(finalScore);
    final gpaPoints = getGPAPoints(finalScore);

    return {
      'courseName': course.courseName,
      'caScore': course.caScore,
      'examScore': course.examScore,
      'finalScore': finalScore,
      'letterGrade': letterGrade,
      'gpaPoints': gpaPoints,
      'creditUnits': course.creditUnits,
    };
  }
}
