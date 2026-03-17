# Grade Calculator - Visual Guide & App Flow

## Application Flow Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    App Initialization                        │
│              (main.dart - Material Theme Setup)             │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    Home Screen                              │
│        (lib/screens/home_screen.dart)                       │
│                                                             │
│  ┌───────────────────────────────────────────────────┐    │
│  │  App Bar: "Grade Calculator"        [🔄 Reset]   │    │
│  ├───────────────────────────────────────────────────┤    │
│  │  Grading System Info Card                         │    │
│  │  "A:80-100 | B:70-79 | C:60-69 | D:50-59 | F:0-49"    │
│  ├───────────────────────────────────────────────────┤    │
│  │  "Courses (n)"                                    │    │
│  ├───────────────────────────────────────────────────┤    │
│  │  Course 1 Card                                    │    │
│  │  ┌─────────────────────────────────────────┐    │    │
│  │  │ Course Name: [TextField]           [❌]  │    │    │
│  │  │ CA Score: [##]  Exam Score: [##]        │    │    │
│  │  │ Credit Units: [#]                       │    │    │
│  │  │ Final: 80 | Grade: A | GPA: 4.0         │    │    │
│  │  └─────────────────────────────────────────┘    │    │
│  │                                                   │    │
│  │  Course 2 Card                                    │    │
│  │  ┌─────────────────────────────────────────┐    │    │
│  │  │ Course Name: [TextField]           [❌]  │    │    │
│  │  │ CA Score: [##]  Exam Score: [##]        │    │    │
│  │  │ Credit Units: [#]                       │    │    │
│  │  │ Final: 70 | Grade: B | GPA: 3.0         │    │    │
│  │  └─────────────────────────────────────────┘    │    │
│  │                                                   │    │
│  ├───────────────────────────────────────────────────┤    │
│  │  [➕ Add Course]                                  │    │
│  │  [✓ Calculate GPA]                               │    │
│  └───────────────────────────────────────────────────┘    │
└──────────┬──────────────────────────┬────────────────┬─────┘
           │                          │                │
      [Add Course]            [Calculate GPA]    [Reset Courses]
           │                          │                │
           ▼                          ▼                ▼
    ┌─────────────┐          ┌──────────────┐   ┌──────────┐
    │ Add Empty   │          │ Validate All │   │Confirm   │
    │ Course Card │          │ Courses      │   │Reset     │
    │             │          │              │   │Dialog    │
    │ Update UI   │          │ If Valid ✓   │   │          │
    └─────────────┘          │ Navigate ➜   │   │If OK:    │
                             │              │   │Clear All │
                             └──────┬───────┘   └──────────┘
                                    │
                                    │ Passes Validation
                                    │
                                    ▼
        ┌──────────────────────────────────────────────────┐
        │          Result Screen                          │
        │    (lib/screens/result_screen.dart)             │
        │                                                 │
        │ ┌──────────────────────────────────────────┐   │
        │ │  App Bar: "Grade Results"                │   │
        │ ├──────────────────────────────────────────┤   │
        │ │  Overall GPA Card                        │   │
        │ │  ┌────────────────────────────────────┐ │   │
        │ │  │   Overall GPA                      │ │   │
        │ │  │        3.43                        │ │   │
        │ │  │   Good Performance                 │ │   │
        │ │  └────────────────────────────────────┘ │   │
        │ ├──────────────────────────────────────────┤   │
        │ │  Total Credits: 7  │  Avg %: 80%        │   │
        │ ├──────────────────────────────────────────┤   │
        │ │  Course Details                        │   │
        │ │  ┌────────────────────────────────────┐ │   │
        │ │  │ Mathematics 101                    │ │   │
        │ │  │ CA:35 | Exam:55 | Total:90        │ │   │
        │ │  │ Grade: [A] | GPA: 4.0 | Credit: 3 │ │   │
        │ │  └────────────────────────────────────┘ │   │
        │ │  ┌────────────────────────────────────┐ │   │
        │ │  │ Physics 201                        │ │   │
        │ │  │ CA:28 | Exam:42 | Total:70        │ │   │
        │ │  │ Grade: [B] | GPA: 3.0 | Credit: 4 │ │   │
        │ │  └────────────────────────────────────┘ │   │
        │ ├──────────────────────────────────────────┤   │
        │ │  Grading Scale Reference                │   │
        │ │  A:80-100(4.0) | B:70-79(3.0) | ...    │   │
        │ ├──────────────────────────────────────────┤   │
        │ │  [📥 Export Results] [✏️ Edit Courses]  │   │
        │ └──────────────────────────────────────────┘   │
        └──────────┬──────────────────────────────┬───────┘
                   │                              │
            [Export Results]            [Edit Courses]
                   │                              │
                   ▼                              ▼
            ┌─────────────┐            ┌─────────────────┐
            │ Prepare Data│            │ Navigate Back to│
            │ for Export  │            │ Home Screen     │
            │ Show Message│            │ Keep Data       │
            └─────────────┘            └─────────────────┘
```

## Screen Layouts

### Screen 1: Home Screen (Course Input)

```
════════════════════════════════════════════════════════════════════════════
                    Grade Calculator            🔄
════════════════════════════════════════════════════════════════════════════

┌─ Grading System ──────────────────────────────────────────────────────────┐
│  A: 80-100 | B: 70-79 | C: 60-69 | D: 50-59 | F: 0-49                   │
└───────────────────────────────────────────────────────────────────────────┘

Courses (2)

┌─ Course 1 ────────────────────────────────────────────────────────────────┐
│                                                                          ❌ │
│  Course Name                                                               │
│ ┌────────────────────────────────────────────────────────────────────┐   │
│ │ Mathematics 101                                                    │   │
│ └────────────────────────────────────────────────────────────────────┘   │
│                                                                            │
│  CA Score              Exam Score                                         │
│ ┌─────────────────┐   ┌──────────────────┐                              │
│ │ 35              │   │ 55               │                              │
│ └─────────────────┘   └──────────────────┘                              │
│                                                                            │
│  Credit Units                                                              │
│ ┌─────────────────────────────────────────────────────────────────────┐  │
│ │ 3                                                                   │  │
│ └─────────────────────────────────────────────────────────────────────┘  │
│                                                                            │
│  ┌────────────────────┬────────────────┬────────────────────────────┐    │
│  │ Final Score: 90    │ Grade: A       │ GPA: 4.0                  │    │
│  └────────────────────┴────────────────┴────────────────────────────┘    │
└───────────────────────────────────────────────────────────────────────────┘

┌─ Course 2 ────────────────────────────────────────────────────────────────┐
│                                                                          ❌ │
│  Course Name                                                               │
│ ┌────────────────────────────────────────────────────────────────────┐   │
│ │ Physics 201                                                        │   │
│ └────────────────────────────────────────────────────────────────────┘   │
│                                                                            │
│  CA Score              Exam Score                                         │
│ ┌─────────────────┐   ┌──────────────────┐                              │
│ │ 28              │   │ 42               │                              │
│ └─────────────────┘   └──────────────────┘                              │
│                                                                            │
│  Credit Units                                                              │
│ ┌─────────────────────────────────────────────────────────────────────┐  │
│ │ 4                                                                   │  │
│ └─────────────────────────────────────────────────────────────────────┘  │
│                                                                            │
│  ┌────────────────────┬────────────────┬────────────────────────────┐    │
│  │ Final Score: 70    │ Grade: B       │ GPA: 3.0                  │    │
│  └────────────────────┴────────────────┴────────────────────────────┘    │
└───────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────┐
│  [➕ Add Course]                                                          │
└──────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────┐
│  [✓ Calculate GPA]                                                        │
└──────────────────────────────────────────────────────────────────────────┘

════════════════════════════════════════════════════════════════════════════
```

### Screen 2: Results Screen (Grade Display)

```
════════════════════════════════════════════════════════════════════════════
                         Grade Results
════════════════════════════════════════════════════════════════════════════

┌──────────────────────────────────────────────────────────────────────────┐
│                          Overall GPA                                     │
│                                                                          │
│                             3.43                                        │
│                                                                          │
│                           Good                                          │
└──────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────┬──────────────────────────┐
│  Total Credits           │  Avg Percentage          │
│                          │                          │
│         7.0              │        80.00%            │
└──────────────────────────┴──────────────────────────┘

Course Details

┌──────────────────────────────────────────────────────────────────────────┐
│  Mathematics 101                                                         │
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  CA      Exam     Total      Grade    GPA      Credits                  │
│  35      55       90         [A]      4.0        3                      │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────┐
│  Physics 201                                                             │
├──────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  CA      Exam     Total      Grade    GPA      Credits                  │
│  28      42       70         [B]      3.0        4                      │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘

Grading Scale
┌──────────────────────────────────────────────────────────────────────────┐
│ A: 80-100(4.0) | B: 70-79(3.0) | C: 60-69(2.0) | D: 50-59(1.0) | F:0-49 │
└──────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────┬──────────────────────────┐
│ [📥 Export Results]      │ [✏️ Edit Courses]       │
└──────────────────────────┴──────────────────────────┘

════════════════════════════════════════════════════════════════════════════
```

## Color Scheme

### Light Mode
```
Background:     White (#FFFFFF)
Primary:        Blue (#2196F3)
Accent:         Green (#4CAF50)
Warning:        Orange (#FF9800)
Error:          Red (#F44336)
Text Primary:   Black (#000000)
Text Secondary: Grey (#757575)
Card Background:White (#FFFFFF)
```

### Dark Mode
```
Background:     Dark Grey (#121212)
Primary:        Blue (#2196F3)
Accent:         Green (#4CAF50)
Warning:        Orange (#FF9800)
Error:          Red (#F44336)
Text Primary:   White (#FFFFFF)
Text Secondary: Light Grey (#BDBDBD)
Card Background:Grey (#1E1E1E)
```

## Icon Usage

| Icon | Purpose | Location |
|------|---------|----------|
| 📚 (Book) | Course Name | Home Screen, Course Card |
| 📊 (Assessment) | CA Score | Home Screen, Course Card |
| ❓ (Quiz) | Exam Score | Home Screen, Course Card |
| 🏆 (Grade) | Credit Units | Home Screen, Course Card |
| ❌ (Delete) | Remove Course | Home Card, Delete Button |
| ➕ (Add) | Add Course | Home Screen Button |
| ✓ (Check) | Calculate | Home Screen Button |
| 🔄 (Refresh) | Reset | App Bar Button |
| 📥 (Download) | Export | Result Screen Button |
| ✏️ (Edit) | Edit Courses | Result Screen Button |

## State Transitions

### Normal Flow
```
Empty Home Screen
       ↓
   Add Courses (1 or more)
       ↓
   Fill in Course Data
       ↓
   Data updates in real-time
       ↓
   Tap "Calculate GPA"
       ↓
   Validation check
       ↓ (Pass)
   Navigate to Results
       ↓
   View GPA and Grades
       ↓
   Tap "Edit Courses"
       ↓
   Back to Home Screen
       ↓
   Modify courses if needed
       ↓
   Repeat from "Tap Calculate"
```

### Error Flow
```
Fill incomplete data
       ↓
Tap "Calculate GPA"
       ↓
Validation fails
       ↓
Error message via Snackbar
       ↓
Stay on Home Screen
       ↓
Update data to fix error
       ↓
Try again
```

### Reset Flow
```
Tap Refresh Icon
       ↓
Confirmation Dialog appears
       ↓
User confirms reset
       ↓
All courses cleared
       ↓
Success Snackbar shown
       ↓
Empty Home Screen
```

## User Interactions

### Adding a Course
```
[➕ Add Course] ──→ New CourseCard appears ──→ User fills fields ──→ Auto-save
                     with empty fields         in real-time
```

### Editing a Course
```
User modifies any ──→ onChanged callback ──→ CourseCalculator ──→ UI updates
    text field         triggered              recalculates        with new
                                                                  values
```

### Deleting a Course
```
[❌] button ──→ Course removed from list ──→ ListView rebuilds ──→ Snackbar
    pressed         setState()                  without course     confirmation
```

### Calculating GPA
```
[✓ Calculate] ──→ validateCourses() ──→ All valid? ──→ Calculate metrics ──→ Navigate
    pressed      checks each field        ✓ Yes       GradeCalculator     ResultScreen
                                          ✗ No        methods
                                            ↓
                                         Show error
                                         Snackbar
```

## Data Flow Diagram

```
User Input
    ↓
TextField (CourseInputCard)
    ↓
onChanged callback triggers
    ↓
_updateCourse() in HomeScreen
    ↓
setState() triggers rebuild
    ↓
GradeCalculator computes:
  • Final Score = CA + Exam
  • Letter Grade from score
  • GPA Points from grade
    ↓
CourseInputCard displays
  • Final Score
  • Grade
  • GPA Points
    ↓
User taps "Calculate GPA"
    ↓
GradeCalculator computes:
  • Overall GPA (weighted avg)
  • Total Credits (sum)
  • Average Percentage (avg)
    ↓
Navigate to ResultScreen
    ↓
ResultScreen displays all metrics
```

## Responsive Layout

### Phone Portrait (Normal)
```
┌─────────────────────────────┐
│   App Bar (Full Width)       │
├─────────────────────────────┤
│                             │
│  Course Cards (Full Width)  │
│  - Stacked vertically       │
│                             │
├─────────────────────────────┤
│  Buttons (Full Width)        │
└─────────────────────────────┘
```

### Phone Landscape / Tablet
```
┌──────────────────────────────────────────┐
│   App Bar (Full Width)                    │
├──────────────────────────────┬────────────┤
│                              │            │
│  Course Cards Left Column    │ Info Panel │
│  - May have 2 columns        │ Right Side │
│                              │            │
├──────────────────────────────┴────────────┤
│  Buttons (Full Width at Bottom)           │
└──────────────────────────────────────────┘
```

## Performance Metrics

### Typical Interactions
| Action | Latency | Notes |
|--------|---------|-------|
| Add Course | <100ms | Instant UI update |
| Edit Field | <50ms | Real-time calculation |
| Delete Course | <100ms | ListView rebuild |
| Calculate GPA | <200ms | All course processing |
| Navigate Screen | <300ms | Material transition |

## Accessibility Features

### Visual
- ✓ High contrast colors
- ✓ Clear labels on all inputs
- ✓ Large touch targets (48x48dp minimum)
- ✓ Icon + Text combinations

### Textual
- ✓ Clear error messages
- ✓ Helpful hints on fields
- ✓ Descriptive button labels
- ✓ Grading system explained

### Interactive
- ✓ Confirmation dialogs for destructive actions
- ✓ Snackbar feedback for all actions
- ✓ Dark mode support
- ✓ System font sizing respect

## Dark Mode Behavior

```
System Setting: "Light" Mode
         ↓
    App uses Light Theme
         ↓
   White background
   Blue primary color
   High contrast text
         ↓
System Setting: "Dark" Mode
         ↓
    App uses Dark Theme
         ↓
   Dark grey background
   Blue primary color
   Light text
         ↓
      (No manual toggle - automatic)
```

---

**Visual Guide Version:** 1.0
**Created:** March 2026
**Last Updated:** March 2026
