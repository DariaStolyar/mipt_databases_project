-- Список из 5 лучших студентов по факультетам
SELECT 
    name,
    surname,
    avg_grade,
    faculty
FROM (
    SELECT 
        name,
        surname,
        avg_grade,
        faculty,
        ROW_NUMBER() OVER (PARTITION BY faculty ORDER BY avg_grade DESC) AS rank
    FROM 
        university.Student
) AS RankedStudents
WHERE 
    rank <= 5;
