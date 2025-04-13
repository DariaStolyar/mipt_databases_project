-- Список 5 семинаристов с наибольшим стажем работы с иx лучшими учениками
SELECT 
    t.name AS teacher_name,
    t.surname AS teacher_surname,
    t.work_experience,
    s.name AS student_name,
    s.surname AS student_surname,
    s.avg_grade
FROM 
    university.Teacher t
LEFT JOIN (
    SELECT 
        st.teacher_id,
        s.name,
        s.surname,
        s.avg_grade
    FROM 
        university.Student_Teacher st
    JOIN 
        university.Student s ON st.student_id = s.student_id
    WHERE 
        s.avg_grade = (SELECT MAX(s2.avg_grade)
                       FROM university.Student_Teacher st2
                       JOIN university.Student s2 ON st2.student_id = s2.student_id
                       WHERE st2.teacher_id = st.teacher_id)
) AS s ON t.teacher_id = s.teacher_id
ORDER BY 
    t.work_experience DESC
LIMIT 5;
