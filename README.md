# Grade Calculator

A Flutter mobile application that helps students calculate their final grades, GPA, and academic performance.

## Features

✅ **Easy Course Management**
- Add and remove courses dynamically
- Input course name, CA score, exam score, and credit units
- Real-time calculation of final scores

✅ **Comprehensive Grade Calculation**
- Automatic calculation of final scores (CA + Exam)
- Letter grade assignment based on score ranges
- GPA points calculation
- Overall GPA calculation
- Average percentage computation

✅ **Material Design UI**
- Clean, student-friendly interface
- Dark mode support (system preference)
- Responsive layout
- Interactive cards and buttons
- Snackbar notifications for user feedback

✅ **Input Validation**
- Score validation (0-100 range)
- Credit units validation
- Course name validation
- Error messages for invalid inputs

✅ **Results Visualization**
- Detailed course results display
- Overall GPA with performance rating
- Total credits summary
- Average percentage calculation
- Export functionality (extensible)

## Grading System

| Score Range | Letter Grade | GPA Points |
|------------|-------------|-----------|
| 80-100    | A           | 4.0       |
| 70-79     | B           | 3.0       |
| 60-69     | C           | 2.0       |
| 50-59     | D           | 1.0       |
| 0-49      | F           | 0.0       |

## Formulas Used

### Final Score
```
Final Score = CA Score + Exam Score
```

### Letter Grade
Based on final score and the grading table above.

### GPA Points
Based on letter grade conversion.

### Overall GPA
```
Overall GPA = Σ(Grade Point × Course Credit) / Σ Credits
```

### Average Percentage
```
Average Percentage = Σ(Final Scores) / Number of Courses
```

## Project Structure

```
lib/
├── main.dart                          # Application entry point with theming
├── screens/
│   ├── home_screen.dart              # Main home screen for course input
│   └── result_screen.dart            # Results display screen
├── models/
│   └── course.dart                   # Course data model
├── services/
│   └── grade_calculator.dart         # Grade calculation business logic
└── widgets/
    └── course_input_card.dart        # Reusable course input card widget
```

## Installation & Setup

### Prerequisites
- Flutter SDK (v3.0.0 or higher)
- Dart SDK (included with Flutter)
- Android Studio, Xcode, or preferred IDE

### Steps to Run

1. **Clone or Download the Project**
   ```bash
   cd path/to/grade_calculator
   ```

2. **Get Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

### Running on Specific Device

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device_id>
```

### Building for Production

**Android:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## Usage Guide

### Adding Courses
1. Tap the **"Add Course"** button
2. Enter course name (e.g., "Mathematics 101")
3. Input CA score (0-40)
4. Input Exam score (0-60)
5. Enter credit units (typically 1-4)

### Calculating GPA
1. Ensure all courses are filled with valid data
2. Tap **"Calculate GPA"** button
3. View detailed results on the result screen

### Editing Courses
- Modify any field in the course card
- Changes are automatically saved
- Remove a course by tapping the delete icon

### Resetting All Courses
1. Tap the refresh icon in the app bar
2. Confirm the reset action
3. All courses will be cleared

### Viewing Results
- The result screen displays:
  - Overall GPA with performance rating
  - Total credits
  - Average percentage
  - Individual course details
  - Letter grades for each course
  - GPA contribution of each course

## Technical Details

### State Management
- Uses `StatefulWidget` for local state management
- Course data is managed within the home screen
- Results are passed via constructor to the result screen

### Input Validation
- Score range validation (0-100)
- Credit units positive validation
- Course name requirement checking
- Error feedback via snackbars

### Data Handling
- Unique IDs for courses using UUID v4
- JSON serialization support for future persistence
- Course model with proper encapsulation

### UI/UX Features
- Material Design 3 components
- System dark mode detection
- Responsive layout using `SingleChildScrollView`
- `ListView.builder` for efficient course list rendering
- Smooth navigation with Material page transitions
- Icon buttons with ripple effects

## Optional Features (Extensible)

### Future Enhancements

**Data Persistence**
```dart
// Add shared_preferences to pubspec.yaml
// Save courses to local storage
// Load courses on app startup
```

**Export Functionality**
```dart
// PDF export of results
// Share results via email/messaging
// Print-friendly format
```

**Advanced Features**
- Course search and filtering
- Grade statistics and charts
- Target GPA calculator
- Course recommendations
- Historical results tracking

## Dependencies

- **flutter**: Core Flutter framework
- **cupertino_icons**: iOS-style icons
- **uuid**: Unique identifier generation
- **shared_preferences**: Local data persistence
- **intl**: Date formatting

## Troubleshooting

### App Won't Run
- Ensure Flutter SDK is installed: `flutter doctor`
- Update Flutter: `flutter upgrade`
- Clean build: `flutter clean` then `flutter pub get`

### Build Errors
- Clear cache: `flutter clean`
- Regenerate dependencies: `flutter pub get`
- Check Android SDK/NDK versions for Android builds

### Input Not Accepting Numbers
- Ensure keyboard type is set to `TextInputType.number`
- Clear the input field and try again

## Contributing

To enhance this app:
1. Follow Dart style guidelines
2. Add comments for complex logic
3. Keep functions focused and reusable
4. Test on multiple screen sizes
5. Ensure dark mode compatibility

## License

This project is provided as-is for educational purposes.

## Support

For questions or issues, review the code comments and structure. Each file contains detailed documentation.

---

**Last Updated:** March 2026
**Flutter Version:** 3.0+
**Dart Version:** 3.0+
