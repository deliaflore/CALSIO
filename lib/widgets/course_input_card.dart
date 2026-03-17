import 'package:flutter/material.dart';
import '../models/course.dart';
import '../services/grade_calculator.dart';

/// Widget for input of a single course's information
/// Provides text fields for course details and a delete button
class CourseInputCard extends StatefulWidget {
  /// The course data being edited
  final Course course;

  /// Callback when course data changes
  final Function(Course) onChanged;

  /// Callback when course is deleted
  final Function() onDelete;

  const CourseInputCard({
    Key? key,
    required this.course,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<CourseInputCard> createState() => _CourseInputCardState();
}

class _CourseInputCardState extends State<CourseInputCard> {
  /// Controllers for text fields
  late TextEditingController _courseNameController;
  late TextEditingController _caScoreController;
  late TextEditingController _examScoreController;
  late TextEditingController _creditUnitsController;

  @override
  void initState() {
    super.initState();
    _courseNameController = TextEditingController(text: widget.course.courseName);
    _caScoreController = TextEditingController(text: widget.course.caScore.toString());
    _examScoreController = TextEditingController(text: widget.course.examScore.toString());
    _creditUnitsController = TextEditingController(text: widget.course.creditUnits.toString());
  }

  @override
  void dispose() {
    _courseNameController.dispose();
    _caScoreController.dispose();
    _examScoreController.dispose();
    _creditUnitsController.dispose();
    super.dispose();
  }

  /// Updates the course and notifies parent widget
  void _updateCourse() {
    try {
      final updatedCourse = Course(
        id: widget.course.id,
        courseName: _courseNameController.text.isEmpty ? 'Course' : _courseNameController.text,
        caScore: double.tryParse(_caScoreController.text) ?? 0.0,
        examScore: double.tryParse(_examScoreController.text) ?? 0.0,
        creditUnits: double.tryParse(_creditUnitsController.text) ?? 1.0,
      );
      widget.onChanged(updatedCourse);
    } catch (e) {
      // Handle error silently
    }
  }

  /// Shows validation error in a snackbar
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Course Name Field
            TextField(
              controller: _courseNameController,
              onChanged: (_) => _updateCourse(),
              decoration: InputDecoration(
                labelText: 'Course Name',
                hintText: 'E.g., Mathematics 101',
                prefixIcon: const Icon(Icons.book),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
              ),
            ),
            const SizedBox(height: 12),

            // CA and Exam Scores Row
            Row(
              children: [
                // CA Score
                Expanded(
                  child: TextField(
                    controller: _caScoreController,
                    onChanged: (_) => _updateCourse(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CA Score',
                      hintText: '0-40',
                      prefixIcon: const Icon(Icons.assessment),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Exam Score
                Expanded(
                  child: TextField(
                    controller: _examScoreController,
                    onChanged: (_) => _updateCourse(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Exam Score',
                      hintText: '0-60',
                      prefixIcon: const Icon(Icons.quiz),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Credit Units and Delete Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _creditUnitsController,
                    onChanged: (_) => _updateCourse(),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Credit Units',
                      hintText: '1-4',
                      prefixIcon: const Icon(Icons.grade),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[100],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: widget.onDelete,
                  icon: const Icon(Icons.delete_outline),
                  color: Colors.red,
                  tooltip: 'Delete course',
                  splashRadius: 24,
                ),
              ],
            ),

            // Final Score Display
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.grey[700] : Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Final Score',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.course.finalScore.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Grade',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        GradeCalculator.getLetterGrade(widget.course.finalScore),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'GPA',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        GradeCalculator.getGPAPoints(widget.course.finalScore).toStringAsFixed(1),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
