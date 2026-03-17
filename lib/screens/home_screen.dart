import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/course.dart';
import '../services/grade_calculator.dart';
import '../widgets/course_input_card.dart';
import 'result_screen.dart';

/// Home screen where users can add and manage courses
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// List of courses entered by the user
  List<Course> courses = [];

  /// Generator for unique course IDs
  const uuid = Uuid();

  @override
  void initState() {
    super.initState();
    // Initialize with some demo data for testing
    _addSampleCourses();
  }

  /// Adds sample courses for demonstration purposes
  void _addSampleCourses() {
    // Uncomment the lines below to see sample data
    // courses = [
    //   Course(
    //     id: uuid.v4(),
    //     courseName: 'Mathematics 101',
    //     caScore: 30,
    //     examScore: 50,
    //     creditUnits: 3,
    //   ),
    //   Course(
    //     id: uuid.v4(),
    //     courseName: 'Physics 201',
    //     caScore: 35,
    //     examScore: 55,
    //     creditUnits: 4,
    //   ),
    // ];
  }

  /// Adds a new empty course to the list
  void _addCourse() {
    setState(() {
      courses.add(
        Course(
          id: uuid.v4(),
          courseName: '',
          caScore: 0,
          examScore: 0,
          creditUnits: 1,
        ),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Course added successfully'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  /// Updates an existing course
  void _updateCourse(int index, Course updatedCourse) {
    setState(() {
      courses[index] = updatedCourse;
    });
  }

  /// Removes a course from the list
  void _removeCourse(int index) {
    final courseName = courses[index].courseName;
    setState(() {
      courses.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$courseName removed'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  /// Validates all courses before calculation
  String? _validateCourses() {
    if (courses.isEmpty) {
      return 'Please add at least one course';
    }

    for (final course in courses) {
      if (course.courseName.isEmpty) {
        return 'Please enter course names for all courses';
      }
      if (!GradeCalculator.isValidScore(course.caScore)) {
        return 'CA scores must be between 0 and 100';
      }
      if (!GradeCalculator.isValidScore(course.examScore)) {
        return 'Exam scores must be between 0 and 100';
      }
      if (!GradeCalculator.isValidCredits(course.creditUnits)) {
        return 'Credit units must be greater than 0';
      }
    }
    return null;
  }

  /// Navigates to results screen after validation
  void _calculateAndNavigate() {
    final validationError = _validateCourses();
    if (validationError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(validationError),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(courses: courses),
      ),
    );
  }

  /// Clears all courses and resets the form
  void _resetAll() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset All'),
        content: const Text('Are you sure you want to clear all courses?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                courses.clear();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All courses cleared'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            child: const Text('Reset', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grade Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _resetAll,
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset all courses',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Information Card
              Card(
                elevation: 2,
                color: isDarkMode ? Colors.grey[800] : Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Grading System',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'A: 80-100 | B: 70-79 | C: 60-69 | D: 50-59 | F: 0-49',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Courses Count
              if (courses.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Courses (${courses.length})',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              // Course List
              if (courses.isEmpty)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.library_books,
                        size: 64,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No courses added yet',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tap the button below to add a course',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[500],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    return CourseInputCard(
                      course: courses[index],
                      onChanged: (updatedCourse) => _updateCourse(index, updatedCourse),
                      onDelete: () => _removeCourse(index),
                    );
                  },
                ),
              const SizedBox(height: 16),

              // Add Course Button
              ElevatedButton.icon(
                onPressed: _addCourse,
                icon: const Icon(Icons.add),
                label: const Text('Add Course'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Calculate GPA Button
              ElevatedButton.icon(
                onPressed: _calculateAndNavigate,
                icon: const Icon(Icons.calculate),
                label: const Text('Calculate GPA'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
