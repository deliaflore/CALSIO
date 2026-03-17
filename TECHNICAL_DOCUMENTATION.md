# Grade Calculator - Technical Documentation

## Overview

The Grade Calculator is a Flutter application designed to help students track their academic performance. It provides an intuitive interface for inputting course information and automatically calculates grades, GPA, and other academic metrics.

## Architecture

### Model-View-Service Pattern

The application follows a clean architecture pattern:

```
Models (Data)
    ↓
Services (Business Logic)
    ↓
Widgets (UI)
    ↓
Screens (Navigation)
```

## File Descriptions

### 1. `main.dart` - Application Entry Point

**Purpose:** Initializes the Flutter app with theme configuration

**Key Components:**
- `MyApp`: Main widget that configures Material Design themes
- Light theme with blue seed color
- Dark theme with system detection support
- Custom input field styling
- Material 3 design system

**Theme Features:**
- Material Design 3 compliance
- Automatic dark mode detection
- Consistent card styling with 12px rounded corners
- Custom input decoration with padding

### 2. `models/course.dart` - Data Model

**Purpose:** Defines the Course data structure

**Course Class Attributes:**
- `id` (String): Unique identifier for the course
- `courseName` (String): Name of the course
- `caScore` (double): Continuous Assessment score (0-40)
- `examScore` (double): Exam score (0-60)
- `creditUnits` (double): Credit hours/units for the course

**Computed Properties:**
- `finalScore` (getter): Returns sum of CA and exam scores

**Serialization Methods:**
- `toJson()`: Converts course to map for storage
- `fromJson()`: Creates course instance from map

### 3. `services/grade_calculator.dart` - Business Logic

**Purpose:** Handles all grade and GPA calculations

**Static Methods:**

#### Grade Determination
```dart
getLetterGrade(double score) → String
```
Maps a score (0-100) to a letter grade (A-F)

#### GPA Calculation
```dart
getGPAPoints(double score) → double
```
Converts score to GPA points (0.0-4.0)

```dart
calculateOverallGPA(List<Course> courses) → double
```
Formula: Σ(Grade Point × Credit) / Σ Credits

#### Aggregate Calculations
```dart
calculateTotalCredits(List<Course> courses) → double
```
Sums all course credit units

```dart
calculateAveragePercentage(List<Course> courses) → double
```
Average of all final scores

#### Validation Methods
```dart
isValidScore(double score) → bool
```
Validates score is 0-100

```dart
isValidCredits(double credits) → bool
```
Validates credits are positive

#### Summary Generation
```dart
getCourseSummary(Course course) → Map
```
Returns comprehensive course grade information

**Grade Scale (Static):**
```
Score Range | Letter | GPA
80-100      | A      | 4.0
70-79       | B      | 3.0
60-69       | C      | 2.0
50-59       | D      | 1.0
0-49        | F      | 0.0
```

### 4. `widgets/course_input_card.dart` - Reusable Course Input Widget

**Purpose:** Provides a card-based UI for entering course information

**Widget Properties:**
- `course` (Course): The course data being edited
- `onChanged` (Function): Callback when course data changes
- `onDelete` (Function): Callback when course is deleted

**Key Features:**
- Text fields for course name, CA score, exam score, credit units
- Real-time calculation display of final score, grade, and GPA
- Delete button with trailing icon
- Input validation with error handling
- Dark mode support with dynamic colors
- Visual feedback with color-coded grades and GPA

**Text Field Configuration:**
- Course Name: Text input with book icon
- CA Score: Number input with assessment icon
- Exam Score: Number input with quiz icon
- Credit Units: Number input with grade icon

**Display Section:**
- Shows real-time final score calculation
- Displays letter grade (color-coded green)
- Shows corresponding GPA points (color-coded purple)
- Updated whenever input changes

### 5. `screens/home_screen.dart` - Main Input Screen

**Purpose:** Primary user interface for course input and management

**State Management:**
- Uses `StatefulWidget` for local state
- Maintains list of `Course` objects
- Uses UUID for unique course identification

**Key Methods:**

```dart
_addCourse()
```
Creates new empty course and triggers UI update with snackbar notification

```dart
_updateCourse(int index, Course updatedCourse)
```
Updates course at given index

```dart
_removeCourse(int index)
```
Removes course and displays confirmation snackbar

```dart
_validateCourses() → String?
```
Validates:
- At least one course exists
- All course names are filled
- All scores are in 0-100 range
- Credit units are positive

```dart
_calculateAndNavigate()
```
Performs validation and navigates to result screen if valid

```dart
_resetAll()
```
Shows confirmation dialog and clears all courses

**UI Structure:**
1. AppBar with title and reset button
2. Info card showing grading scale
3. Course count display
4. Empty state message (if no courses)
5. ListView of CourseInputCards
6. Add Course button
7. Calculate GPA button

### 6. `screens/result_screen.dart` - Results Display Screen

**Purpose:** Displays calculated grades, GPA, and academic statistics

**Initialization:**
```dart
initState() {
  overallGPA = GradeCalculator.calculateOverallGPA(widget.courses);
  totalCredits = GradeCalculator.calculateTotalCredits(widget.courses);
  averagePercentage = GradeCalculator.calculateAveragePercentage(widget.courses);
}
```

**Display Sections:**

1. **Overall GPA Card**
   - Prominent display of overall GPA
   - Color-coded based on performance
   - Performance description (Excellent/Good/Satisfactory/etc.)

2. **Summary Statistics**
   - Total credits earned
   - Average percentage across all courses

3. **Course Details List**
   - Individual course card for each course
   - Displays CA score, exam score, total score, grade, GPA, and credits
   - Color-coded grade badges

4. **Grading Scale Reference**
   - Quick reference table of grading system

5. **Action Buttons**
   - Export Results button
   - Edit Courses button (returns to home screen)

**Helper Methods:**

```dart
_getGPAColor(double gpa) → Color
```
Returns color based on GPA value:
- Green: GPA ≥ 3.5
- Blue: GPA ≥ 3.0
- Orange: GPA ≥ 2.0
- Red: GPA < 2.0

```dart
_getPerformanceDescription(double gpa) → String
```
Returns performance label based on GPA

```dart
_exportResults()
```
Prepares results for export (extensible feature)

### 7. `pubspec.yaml` - Project Configuration

**Dependencies:**
- `flutter`: Core framework
- `cupertino_icons`: icon set (1.0.2)
- `shared_preferences`: Local storage (2.2.2) - for future use
- `intl`: Date/time formatting (0.19.0) - for export timestamps
- `uuid`: Unique ID generation (4.0.0) - for course IDs

**Development Dependencies:**
- `flutter_test`: Testing framework
- `flutter_lints`: Code style guidelines

## Data Flow

### Adding a Course
```
User taps "Add Course"
    ↓
_addCourse() creates Course with UUID
    ↓
setState() triggers rebuild
    ↓
ListView.builder renders new CourseInputCard
```

### Calculating GPA
```
User enters course data
    ↓
CourseInputCard.onChanged() updates course
    ↓
User taps "Calculate GPA"
    ↓
_validateCourses() checks data validity
    ↓
GradeCalculator methods process courses
    ↓
Navigator.push() to ResultScreen with courses
    ↓
ResultScreen displays results
```

### Editing Courses
```
User modifies TextField in CourseInputCard
    ↓
onChanged callback triggered
    ↓
_updateCourse() updates state
    ↓
GradeCalculator recalculates in real-time
    ↓
CourseInputCard rebuilds with new values
```

## Calculation Examples

### Example: Calculating Overall GPA

**Courses:**
- Math 101: CA=35, Exam=55 (Final=90, Grade=A, GPA=4.0), Credits=3
- Physics 201: CA=28, Exam=42 (Final=70, Grade=B, GPA=3.0), Credits=4

**Calculation:**
```
GPA Points earned:
  Math: 4.0 × 3 = 12.0
  Physics: 3.0 × 4 = 12.0
  Total GPA Points = 24.0

Total Credits = 3 + 4 = 7

Overall GPA = 24.0 / 7 = 3.43
```

### Example: Calculating Average Percentage

**Same Courses:**
```
Final Scores: 90 + 70 = 160
Number of Courses = 2

Average Percentage = 160 / 2 = 80%
```

## Validation Logic

### Course Validation Checklist
1. ✓ At least one course exists
2. ✓ Course name is not empty
3. ✓ CA score is 0-100
4. ✓ Exam score is 0-100
5. ✓ Credit units > 0

### Error Messages
- "Please add at least one course"
- "Please enter course names for all courses"
- "CA scores must be between 0 and 100"
- "Exam scores must be between 0 and 100"
- "Credit units must be greater than 0"

## UI/UX Features

### Material Design Implementation
- Material Design 3 components
- Rounded corners (12px cards, 8px inputs)
- Elevation shadows for depth
- Responsive layout with flexible widgets
- Icons for visual guidance

### Color Coding
- **Blue**: Primary actions
- **Green**: Success, positive grades
- **Orange**: Warning, caution zones
- **Red**: Delete, error states
- **Purple**: GPA highlights

### Responsive Design
- `SingleChildScrollView` for overflow handling
- `ListView.builder` for efficient lists
- `Expanded` widgets for flexible layouts
- `FlexibleSpaceBar` compatibility

### Dark Mode Support
- Automatic detection via `Theme.of(context).brightness`
- Separate dark theme in main.dart
- Dynamic color adjustments in widgets
- Maintains readability in both modes

## Extensibility

### Adding New Features

**Save to Local Storage:**
```dart
// In home_screen.dart
import 'package:shared_preferences/shared_preferences.dart';

void _saveCourses() async {
  final prefs = await SharedPreferences.getInstance();
  // Implementation details
}
```

**PDF Export:**
```dart
// In result_screen.dart
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void _exportPDF() {
  // Generate PDF with results
}
```

**Grade Prediction:**
```dart
// Add to GradeCalculator
static double predictGradeFromTarget(double targetGPA, /* params */) {
  // Calculate required final score
}
```

## Testing Recommendations

### Unit Tests
- Test grade calculation logic in `grade_calculator.dart`
- Test Course model serialization
- Test validation methods

### Widget Tests
- Test CourseInputCard interactions
- Test HomeScreen state management
- Test ResultScreen display

### Integration Tests
- Full app flow from course input to results
- Navigation between screens
- Input validation with various data

## Performance Considerations

### Optimization Strategies
- `ListView.builder` for efficient rendering
- `const` constructors where possible
- State management limited to necessary widgets
- Lazy loading of courses list

### Memory Management
- Proper disposal of TextEditingControllers
- Use of NumPy-like calculations for aggregations
- Efficient string interpolation

## Best Practices Implemented

1. **Separation of Concerns**
   - Models for data
   - Services for business logic
   - Widgets for UI

2. **Code Reusability**
   - CourseInputCard component
   - Static methods in GradeCalculator
   - Theme configuration in main.dart

3. **Error Handling**
   - Input validation at every step
   - Try-catch blocks in conversion logic
   - User-friendly error messages

4. **Code Documentation**
   - Comprehensive comments
   - Method documentation
   - Example usage in README

5. **UI/UX Principles**
   - Clear visual hierarchy
   - Intuitive navigation
   - Helpful error messages
   - Visual feedback for actions

---

**Document Version:** 1.0
**Last Updated:** March 2026
**Flutter Version:** 3.0+
