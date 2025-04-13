-- Список 10 лучших студентов среди всех факультетов
SELECT 
    name,
    surname,
    avg_grade
FROM 
    university.Student
ORDER BY avg_grade DESC
LIMIT 10;
