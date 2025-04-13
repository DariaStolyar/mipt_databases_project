-- Список дедлайнов студента 1 с учетом переноса дедлайна справками/допусками
SELECT 
    work_id,
    work_name,
    work_type,
    CASE 
        WHEN p.end_time IS NOT NULL THEN p.end_time - work_start_time + work_end_time
        ELSE work_end_time
    END AS deadline
FROM (
    -- Задачи
    SELECT 
        t.task_id AS work_id,
        t.subject AS work_name,
        'Task' AS work_type,
        t.start_time AS work_start_time,
        t.end_time AS work_end_time,
        t.student_id
    FROM 
        university.Task t

    UNION ALL

    -- Проекты
    SELECT 
        pr.project_id AS work_id,
        pr.topic AS work_name,
        'Project' AS work_type,
        pr.start_time AS work_start_time,
        pr.end_time AS work_end_time,
        sp.student_id
    FROM 
        university.Project pr
    JOIN 
        university.Student_Project sp ON pr.project_id = sp.project_id
) AS works
LEFT JOIN 
    university.Postponements p ON works.student_id = p.student_id
    AND p.start_time <= works.work_end_time
    AND p.end_time >= works.work_start_time
WHERE 
    works.student_id = 1;