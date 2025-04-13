-- Список студентов с их средним баллом и средним баллом по их факультету
SELECT 
    name,
    surname,
    avg_grade,
    faculty,
    AVG(avg_grade) OVER (PARTITION BY faculty) AS faculty_avg_grade
FROM 
    university.Student; 
