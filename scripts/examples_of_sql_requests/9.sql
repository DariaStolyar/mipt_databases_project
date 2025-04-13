-- Список студентов, которые участвуют в проектах
SELECT 
    name,
    surname
FROM 
    university.Student
WHERE 
    student_id IN (SELECT student_id FROM university.Student_Project);
