-- Список студентов, у которых больше 3 заданий
SELECT 
    s.name,
    s.surname,
    COUNT(t.task_id) AS task_count
FROM 
    university.Student s
JOIN 
    university.Task t ON s.student_id = t.student_id
GROUP BY 
    s.student_id
HAVING 
    COUNT(t.task_id) > 3;
