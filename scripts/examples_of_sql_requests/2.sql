-- Список студентов с изначальными их семинаристами
SELECT 
    s.name AS student_name,
    s.surname AS student_surname,
    COALESCE(pt.name, t.name) AS teacher_name,
    COALESCE(pt.surname, t.surname) AS teacher_surname
FROM 
    university.Student_Teacher st
JOIN 
    university.Student s ON st.student_id = s.student_id
JOIN 
    university.Teacher t ON st.teacher_id = t.teacher_id
LEFT JOIN 
    university.Teacher pt ON st.prev_teacher_id = pt.teacher_id;
