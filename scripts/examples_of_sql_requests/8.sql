-- Список студентов, у которых все задачи имеют оценку выше 80%
SELECT 
    name,
    surname
FROM 
    university.Student
WHERE 
    80 < ALL (SELECT score 
              FROM university.Task 
              WHERE student_id = university.Student.student_id); 
