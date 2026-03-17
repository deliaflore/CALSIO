# Getting Started with Grade Calculator

## Quick Start Guide (5 minutes)

### Step 1: Install Flutter
If you don't have Flutter installed:
1. Visit [flutter.dev](https://flutter.dev/docs/get-started/install)
2. Download the latest Flutter SDK
3. Add Flutter to your PATH
4. Run `flutter doctor` to verify installation

### Step 2: Open the Project
```bash
cd path/to/grade_calculator
```

### Step 3: Get Dependencies
```bash
flutter pub get
```

### Step 4: Run the App

**On Emulator/Physical Device:**
```bash
flutter run
```

**On Specific Device:**
```bash
flutter devices          # See available devices
flutter run -d <id>     # Run on specific device
```

**In Release Mode:**
```bash
flutter run --release
```

## First Use - Tutorial

### 1. Adding Your First Course

1. **Launch the app** - You'll see the home screen
2. **Tap "Add Course"** button
3. **Fill in course details:**
   - Course Name: *e.g., "Mathematics 101"*
   - CA Score: *Enter your continuous assessment score (0-40)*
   - Exam Score: *Enter your exam score (0-60)*
   - Credit Units: *Number of credits for the course (usually 1-4)*

4. **Watch the display** - Final score, grade, and GPA update in real-time!

### 2. Adding More Courses

Repeat step 1 for each of your courses. Each course is displayed as a separate card.

### 3. Calculating Your Overall GPA

1. **Verify all courses** are filled with correct information
2. **Tap "Calculate GPA"** button
3. **View your results** on the results screen showing:
   - **Overall GPA** (most important)
   - **Total Credits**
   - **Average Percentage**
   - Individual course details

### 4. Going Back to Edit

If you need to modify courses:
1. Tap **"Edit Courses"** on the results screen
2. Make your changes
3. Tap **"Calculate GPA"** again

## Understanding the Grades

### Grade Scale
```
Score Range    Letter Grade    GPA Points    Performance
80-100         A               4.0           Excellent
70-79          B               3.0           Good
60-69          C               2.0           Satisfactory
50-59          D               1.0           Needs Improvement
0-49           F               0.0           Poor
```

### What Does Final Score Mean?
Your final score is: **CA Score + Exam Score**

For example:
- CA: 35 + Exam: 55 = **Final Score: 90** = **Grade A** = **GPA: 4.0**

### What is GPA?
**GPA (Grade Point Average)** shows your overall academic performance. It's calculated using:
- Each course's grade points
- Weighted by the course's credit units

Higher GPA is better. A GPA of 4.0 is perfect!

## Tips & Tricks

### ✅ Best Practices

1. **Double-check your scores**
   - Ensure CA scores are 0-40
   - Ensure Exam scores are 0-60
   - Total score should be 0-100

2. **Use accurate credit units**
   - Check your course syllabus
   - Different courses may have different credits
   - More credits = more weight in GPA

3. **Keep courses organized**
   - Use clear course names
   - Remove courses you don't need

### ❌ Common Mistakes

1. **Entering scores > 100**
   - CA: Maximum 40
   - Exam: Maximum 60
   - Final: Maximum 100

2. **Forgetting credit units**
   - Each course must have credit units > 0
   - Missing this will cause validation errors

3. **Not saving after changes**
   - App auto-saves (no manual save needed)
   - Changes appear immediately

## Features Explained

### Add Course Button ➕
Creates a new course card for input

### Calculate GPA Button ✓
Validates all data and shows results

### Delete Course ❌
Removes a course from your calculation

### Reset All Button 🔄
Clears all courses (with confirmation)

### Export Results 📥
Prepares results for sharing (feature-ready)

## Troubleshooting

### "Please add at least one course"
**Problem:** You tapped Calculate without adding courses
**Solution:** Tap "Add Course" first

### "Scores must be between 0 and 100"
**Problem:** You entered a score outside the valid range
**Solution:** Check CA (0-40) and Exam (0-60) ranges

### "Course names required"
**Problem:** One or more courses don't have names
**Solution:** Fill in the "Course Name" field for all courses

### App crashes on startup
**Problem:** Missing dependencies
**Solution:** Run `flutter pub get` again

### Can't see the app
**Problem:** Emulator not running
**Solution:** Start emulator: `emulator -list-avds` then `emulator -avd <name>`

## Dark Mode

The app automatically uses your system's dark mode preference:
- **Light Mode:** Default on bright devices
- **Dark Mode:** Automatic on dark devices
- **No manual toggle:** Uses system settings

To test dark mode:
1. Change system theme in device settings
2. Restart the app
3. Theme should update automatically

## Keyboard Shortcuts (Emulator/Web)

| Key | Action |
|-----|--------|
| Tab | Next field |
| Shift+Tab | Previous field |
| Enter | Submit (context-dependent) |
| Esc | Back/Cancel |

## Screen Sizes Supported

The app works on:
- 📱 **Phones** (4.5" - 6.8")
- 📱 **Tablets** (7" - 12.9")
- 💻 **Web browsers** (responsive design)
- ⌚ **Wearables** (limited, not recommended)

## Data Storage

### Current Implementation
- Data is stored in **memory only**
- Lost when app closes
- Perfect for quick calculations

### Future Enhancement (Optional)
- Add `shared_preferences` to save locally
- Load saved courses on app start
- Add "Load Previous" feature

## Exporting Results

### Current Feature
- "Export Results" button prepares data
- Shows success message

### Future Enhancement Options
1. **PDF Export** - Save as PDF file
2. **Email Share** - Send via email
3. **Print** - Print results
4. **Cloud Sync** - Save to cloud storage

## Performance Tips

For best performance:
- Keep number of courses < 20
- Use the latest Flutter version
- Restart the app if it feels slow
- Clear device cache if issues persist

```bash
# Clear device cache
flutter clean
flutter pub get
flutter run
```

## Next Steps

1. ✅ Install Flutter
2. ✅ Run the app
3. ✅ Add your courses
4. ✅ Calculate GPA
5. ✅ Explore all features
6. ✅ Share with classmates!

## Getting Help

### In-App Help
- Look for icons 📚 📊 📈 
- Snackbar messages explain actions
- Field labels show what's expected

### Documentation
- **README.md** - Overview and features
- **TECHNICAL_DOCUMENTATION.md** - Deep dive
- **Code Comments** - Inline explanations

### Contacts for Issues
- Review code comments first
- Check the README troubleshooting section
- Run `flutter doctor` to verify environment

## Fun Facts! 🎓

- The app uses **Material Design 3** for modern UI
- **UUID** ensures unique course IDs
- **Dynamic calculations** update in real-time
- **Dark mode support** follows Android 10+ standards
- **Fully commented code** for learning purposes

---

**Ready to calculate your GPA? Let's go! 🚀**

Need more help? Check the README.md and TECHNICAL_DOCUMENTATION.md files!
