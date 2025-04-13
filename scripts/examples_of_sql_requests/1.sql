-- Список студентов с их семинаристами
SELECT 
    s.name AS student_name,
    s.surname AS student_surname,
    t.name AS current_teacher_name,
    t.surname AS current_teacher_surname
FROM 
    university.Student_Teacher st
JOIN 
    university.Student s ON st.student_id = s.student_id
JOIN 
    university.Teacher t ON st.teacher_id = t.teacher_id;
