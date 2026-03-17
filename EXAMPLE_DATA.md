# Grade Calculator - Example Data & Test Cases

## Sample Course Data

### Example Set 1: Excellent Student

**Student A - High Achiever**

| Course | CA (0-40) | Exam (0-60) | Final | Grade | GPA | Credit |
|--------|-----------|------------|-------|-------|-----|--------|
| Math 101 | 38 | 58 | 96 | A | 4.0 | 3 |
| Physics 201 | 36 | 54 | 90 | A | 4.0 | 4 |
| Chemistry 150 | 35 | 52 | 87 | A | 4.0 | 3 |
| English 101 | 34 | 56 | 90 | A | 4.0 | 2 |

**Calculations:**
- Total Credits: 12
- Overall GPA: (4.0×3 + 4.0×4 + 4.0×3 + 4.0×2) / 12 = 4.0
- Average Percentage: (96+90+87+90) / 4 = 90.75%
- **Performance:** Excellent

### Example Set 2: Good Student

**Student B - Average High Performer**

| Course | CA (0-40) | Exam (0-60) | Final | Grade | GPA | Credit |
|--------|-----------|------------|-------|-------|-----|--------|
| Math 101 | 30 | 45 | 75 | B | 3.0 | 3 |
| Physics 201 | 28 | 42 | 70 | B | 3.0 | 4 |
| Chemistry 150 | 32 | 48 | 80 | A | 4.0 | 3 |
| English 101 | 29 | 44 | 73 | C | 2.0 | 2 |
| History 100 | 31 | 46 | 77 | B | 3.0 | 2 |

**Calculations:**
- Total Credits: 14
- Overall GPA: (3.0×3 + 3.0×4 + 4.0×3 + 2.0×2 + 3.0×2) / 14 = 3.07
- Average Percentage: (75+70+80+73+77) / 5 = 75.0%
- **Performance:** Good

### Example Set 3: Satisfactory Student

**Student C - Passing Grades**

| Course | CA (0-40) | Exam (0-60) | Final | Grade | GPA | Credit |
|--------|-----------|------------|-------|-------|-----|--------|
| Math 101 | 25 | 35 | 60 | C | 2.0 | 3 |
| Physics 201 | 26 | 37 | 63 | C | 2.0 | 4 |
| Chemistry 150 | 27 | 38 | 65 | C | 2.0 | 3 |
| Biology 100 | 28 | 40 | 68 | C | 2.0 | 2 |

**Calculations:**
- Total Credits: 12
- Overall GPA: (2.0×3 + 2.0×4 + 2.0×3 + 2.0×2) / 12 = 2.0
- Average Percentage: (60+63+65+68) / 4 = 64.0%
- **Performance:** Satisfactory

### Example Set 4: Struggling Student

**Student D - Below Average**

| Course | CA (0-40) | Exam (0-60) | Final | Grade | GPA | Credit |
|--------|-----------|------------|-------|-------|-----|--------|
| Math 101 | 18 | 28 | 46 | F | 0.0 | 3 |
| Physics 201 | 20 | 30 | 50 | D | 1.0 | 4 |
| Chemistry 150 | 22 | 32 | 54 | D | 1.0 | 3 |
| English 101 | 25 | 35 | 60 | C | 2.0 | 2 |

**Calculations:**
- Total Credits: 12
- Overall GPA: (0.0×3 + 1.0×4 + 1.0×3 + 2.0×2) / 12 = 0.92
- Average Percentage: (46+50+54+60) / 4 = 52.5%
- **Performance:** Needs Improvement

### Example Set 5: Mixed Performance

**Student E - Variable Performance**

| Course | CA (0-40) | Exam (0-60) | Final | Grade | GPA | Credit |
|--------|-----------|------------|-------|-------|-----|--------|
| Math 101 | 35 | 52 | 87 | A | 4.0 | 4 |
| History 100 | 20 | 28 | 48 | F | 0.0 | 2 |
| Literature 200 | 32 | 48 | 80 | A | 4.0 | 3 |
| Statistics 150 | 28 | 40 | 68 | C | 2.0 | 3 |
| Art 101 | 38 | 56 | 94 | A | 4.0 | 2 |

**Calculations:**
- Total Credits: 14
- Overall GPA: (4.0×4 + 0.0×2 + 4.0×3 + 2.0×3 + 4.0×2) / 14 = 2.86
- Average Percentage: (87+48+80+68+94) / 5 = 75.4%
- **Performance:** Good (but with weakness in History)

---

## Test Cases

### Test Case 1: Single Course

**Input:**
- Course: Foundation Math
- CA: 32
- Exam: 48
- Credits: 3

**Expected Output:**
- Final Score: 80
- Grade: A
- GPA: 4.0
- Overall GPA: 4.0
- Total Credits: 3
- Average: 80%

### Test Case 2: Validation - Invalid CA Score

**Input:**
- Course: Math 101
- CA: 45 **(Invalid - exceeds 40)**
- Exam: 55
- Credits: 3

**Expected Result:**
- ❌ Error Message: "CA Score must be between 0-40"
- Stay on home screen
- No navigation to results

### Test Case 3: Validation - Invalid Exam Score

**Input:**
- Course: Math 101
- CA: 35
- Exam: 70 **(Invalid - exceeds 60)**
- Credits: 3

**Expected Result:**
- ❌ Error Message: "Exam Score must be between 0-60"
- Stay on home screen
- No navigation to results

### Test Case 4: Validation - Missing Course Name

**Input:**
- Course: **(Empty/blank)**
- CA: 30
- Exam: 50
- Credits: 3

**Expected Result:**
- ❌ Error Message: "Please enter course names for all courses"
- Stay on home screen
- No navigation to results

### Test Case 5: Validation - Invalid Credit Units

**Input:**
- Course: Math 101
- CA: 30
- Exam: 50
- Credits: 0 **(Invalid - must be > 0)**

**Expected Result:**
- ❌ Error Message: "Credit units must be greater than 0"
- Stay on home screen
- No navigation to results

### Test Case 6: Validation - No Courses Added

**Input:**
- Courses: None (empty list)

**Expected Result:**
- ❌ Error Message: "Please add at least one course"
- Show empty state message
- No navigation to results

### Test Case 7: Border Case - Minimum Valid Scores

**Input:**
- Course: Test Course
- CA: 0
- Exam: 0
- Credits: 1

**Expected Output:**
- Final Score: 0
- Grade: F
- GPA Points: 0.0
- Overall GPA: 0.0
- Average: 0%

### Test Case 8: Border Case - Maximum Valid Scores

**Input:**
- Course: Test Course
- CA: 40
- Exam: 60
- Credits: 1

**Expected Output:**
- Final Score: 100
- Grade: A
- GPA Points: 4.0
- Overall GPA: 4.0
- Average: 100%

### Test Case 9: Grade Boundary - Score 79.9

**Input:**
- CA: 35
- Exam: 44.9
- Final: 79.9

**Expected:** Grade B (not A)

### Test Case 10: Grade Boundary - Score 80.0

**Input:**
- CA: 35
- Exam: 45.0
- Final: 80.0

**Expected:** Grade A

---

## Performance Test Data

### Large Dataset - 20 Courses

**Student with 20 courses:**

```
Course 1-5: All A's (4.0 GPA × 3 credits each)
Course 6-10: All B's (3.0 GPA × 3 credits each)
Course 11-15: All C's (2.0 GPA × 3 credits each)
Course 16-20: All D's (1.0 GPA × 3 credits each)

Total Credits: 60
Sum of GPA Points: (5×4.0 + 5×3.0 + 5×2.0 + 5×1.0) × 3
                = (20 + 15 + 10 + 5) × 3
                = 50 × 3
                = 150

Overall GPA = 150 / 60 = 2.5
Average Percentage = (90 + 75 + 65 + 55) / 4 = 71.25%
```

**Expected Performance:**
- Calculation: <200ms
- UI Rendering: Smooth, no lag
- Memory: <50MB

---

## Boundary Test Values

### Score Boundaries
```
Grade A: 80-100
  - Min: 80.0 (edge case)
  - Max: 100.0 (edge case)
  - CA=40, Exam=40 = 80 ✓
  - CA=40, Exam=60 = 100 ✓

Grade B: 70-79
  - Min: 70.0 (edge case)
  - Max: 79.9 (edge case)
  - CA=30, Exam=40 = 70 ✓
  - CA=35, Exam=44.9 = 79.9 ✓

Grade F: 0-49
  - Min: 0.0 (edge case)
  - Max: 49.9 (edge case)
  - CA=0, Exam=0 = 0 ✓
  - CA=20, Exam=29.9 = 49.9 ✓
```

### Credit Boundaries
```
Valid range: 0.1 to 99.9
- Min valid: 0.1 credit
- Max typical: 4.0 credits
- Edge: 100+ credits (technically allowed, unusual)
- Invalid: 0 or negative
```

---

## Example Course Names

### Science Courses
- Mathematics 101
- Physics 201
- Chemistry 150
- Biology 100
- Calculus II
- Linear Algebra
- Organic Chemistry
- General Physics

### Humanities Courses
- English Literature 101
- World History 200
- Philosophy 150
- Psychology 100
- Sociology 101
- Anthropology 200

### Business Courses
- Accounting 101
- Economics 200
- Business Law 150
- Marketing 101
- Management Principles 100
- Finance 250

### Computer Science
- Programming I
- Data Structures
- Web Development
- Database Systems
- Software Engineering
- Algorithms

---

## Real-World Scenarios

### Scenario 1: Improving Student

**First Semester:**
- Math: 70 (B)
- English: 65 (C)
- GPA: 2.5
- Average: 67.5%

**Second Semester (After Improvement):**
- Math: 85 (A)
- English: 75 (B)
- GPA: 3.5
- Average: 80%

### Scenario 2: Struggling with Math

**Courses:**
- Math 101: 45 (F) - 3 credits
- English 101: 80 (A) - 2 credits
- History 100: 75 (B) - 2 credits

**GPA Calculation:**
```
= (0.0×3 + 4.0×2 + 3.0×2) / 7
= (0 + 8 + 6) / 7
= 14 / 7
= 2.0
```

### Scenario 3: Weighted by Credit

**Scenario A (6-credit course heavy):**
- Course 1: 90 (A) - 6 credits
- Course 2: 70 (B) - 1 credit
- GPA = (4.0×6 + 3.0×1) / 7 = 3.86

**Scenario B (equal credits):**
- Course 1: 90 (A) - 3 credits
- Course 2: 70 (B) - 3 credits
- GPA = (4.0×3 + 3.0×3) / 6 = 3.5

**Note:** Higher credit courses affect GPA more!

---

## Input Validation Scenarios

### Valid Inputs
```
✓ CA: 0-40
✓ Exam: 0-60
✓ Total: 0-100
✓ Credits: 0.1+
✓ Name: Any non-empty string
```

### Invalid Inputs
```
✗ CA: -1 (negative)
✗ CA: 41 (exceeds 40)
✗ Exam: -1 (negative)
✗ Exam: 61 (exceeds 60)
✗ Credits: 0 (must be > 0)
✗ Credits: -5 (negative)
✗ Name: "" (empty)
```

---

## Sample Input Checklist

### Data to Try

**Test Set 1: Perfect Courses**
- [ ] Add course with all high scores
- [ ] Verify Grade: A
- [ ] Verify GPA: 4.0

**Test Set 2: Failing Course**
- [ ] Add course with low scores
- [ ] Verify Grade: F
- [ ] Verify GPA: 0.0

**Test Set 3: Mixed Courses**
- [ ] Add 5+ courses with different grades
- [ ] Calculate overall GPA
- [ ] Verify weighted calculation

**Test Set 4: Validation**
- [ ] Try invalid CA score
- [ ] Try invalid exam score
- [ ] Try missing course name
- [ ] Try zero credits
- [ ] Verify error messages

**Test Set 5: Edge Cases**
- [ ] Score exactly 80 (should be A)
- [ ] Score exactly 79.9 (should be B)
- [ ] All courses with same grade
- [ ] All courses with different grades

---

## Testing Checklist

### Functionality Tests
- [ ] Add courses works
- [ ] Delete course works
- [ ] Edit course works
- [ ] Reset all works
- [ ] Calculate GPA works
- [ ] Results display correct
- [ ] Error messages show
- [ ] Snackbars appear

### UI/UX Tests
- [ ] Light mode looks good
- [ ] Dark mode looks good
- [ ] Buttons are clickable
- [ ] Text is readable
- [ ] Icons display
- [ ] Responsive on phone
- [ ] Responsive on tablet
- [ ] No overlap/cutoff

### Data Tests
- [ ] CA scores validate (0-40)
- [ ] Exam scores validate (0-60)
- [ ] Final score calculated correctly
- [ ] Letter grades assigned correctly
- [ ] GPA calculated correctly
- [ ] Credits summed correctly
- [ ] Average percentage correct
- [ ] Overall GPA weighted correctly

### Edge Case Tests
- [ ] Single course
- [ ] Many courses (20+)
- [ ] Score exactly on boundary
- [ ] All same courses
- [ ] All different courses
- [ ] Zero GPA course
- [ ] Perfect 4.0 GPA

---

**Document Version:** 1.0
**Last Updated:** March 2026

**Use these examples to understand and test the Grade Calculator!**
