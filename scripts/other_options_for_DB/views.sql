-- Проекты со списком их участников
CREATE VIEW university.active_projects_with_participants AS
SELECT 
    p.project_id,
    p.topic,
    t.surname || ' ' || t.name AS project_teacher,
    COUNT(sp.student_id) AS participants_count,
    STRING_AGG(s.name || ' ' || s.surname, ', ') AS participants_names,
    AVG(s.avg_grade) AS avg_participants_grade
FROM 
    university.Project p
LEFT JOIN 
    university.Teacher t ON p.leading_teacher_id = t.teacher_id
LEFT JOIN 
    university.Student_Project sp ON p.project_id = sp.project_id
LEFT JOIN 
    university.Student s ON sp.student_id = s.student_id
WHERE 
    CURRENT_TIMESTAMP BETWEEN p.start_time AND p.end_time
GROUP BY 
    p.project_id, p.topic, t.name, t.surname; 

-- Статистика по группам
CREATE VIEW university.faculty_group_stats AS
SELECT 
    s.faculty,
    s.group_number,
    COUNT(s.student_id) AS students_count,
    AVG(s.avg_grade) AS avg_group_grade,
    MAX(s.avg_grade) AS max_grade,
    MIN(s.avg_grade) AS min_grade,
    COUNT(p.project_id) AS active_projects_count
FROM 
    university.Student s
LEFT JOIN 
    university.Student_Project sp ON s.student_id = sp.student_id
LEFT JOIN 
    university.Project p ON sp.project_id = p.project_id 
    AND CURRENT_TIMESTAMP BETWEEN p.start_time AND p.end_time
GROUP BY 
    s.faculty, s.group_number;
    
-- Преподаватели с их занятостью
CREATE VIEW university.teacher_workload AS
SELECT 
    t.teacher_id,
    t.name || ' ' || t.surname AS teacher,
    t.department,
    COUNT(DISTINCT st.student_id) AS students_count,
    COUNT(DISTINCT p.project_id) AS active_projects_count,
    COUNT(DISTINCT tsk.task_id) AS tasks_assigned_last_month
FROM 
    university.Teacher t
LEFT JOIN 
    university.Student_Teacher st ON t.teacher_id = st.teacher_id
LEFT JOIN 
    university.Project p ON t.teacher_id = p.leading_teacher_id 
    AND CURRENT_TIMESTAMP BETWEEN p.start_time AND p.end_time
LEFT JOIN 
    university.Task tsk ON t.subject = tsk.subject 
    AND tsk.start_time >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY 
    t.teacher_id, t.name, t.surname, t.department;