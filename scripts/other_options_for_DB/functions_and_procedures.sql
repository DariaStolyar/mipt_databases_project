CREATE OR REPLACE FUNCTION university.list_of_deadlines(p_id INTEGER)
RETURNS TABLE (
    work_id INTEGER,
    work_name VARCHAR(200),
    work_type VARCHAR(10),
    deadline TIMESTAMP
)
LANGUAGE SQL
AS $$
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
    works.student_id = p_id;
$$;  -- Добавлены закрывающие $$ и точка с запятой



-- Расчет среднего балла студента по предмету
CREATE FUNCTION university.calculate_subject_avg_grade(
    p_student_id INTEGER,
    p_subject VARCHAR(200)
RETURNS NUMERIC
AS $$
DECLARE
    v_avg_grade NUMERIC;
BEGIN
    SELECT AVG(score) INTO v_avg_grade
    FROM university.Task
    WHERE student_id = p_student_id
    AND subject = p_subject
    AND score IS NOT NULL;
    
    RETURN COALESCE(v_avg_grade, 0);
END;
$$
LANGUAGE plpgsql;



-- Обновление преподавателя у студента
CREATE PROCEDURE university.update_teacher_to_student(
    p_student_id INTEGER,
    p_new_teacher_id INTEGER,
    p_prev_teacher_id INTEGER
)
AS $$
BEGIN
    UPDATE university.Student_Teacher
    SET prev_teacher_id = p_prev_teacher_id,
            teacher_id = p_new_teacher_id
    WHERE student_id = p_student_id AND teacher_id = p_prev_teacher_id;
END;
$$
LANGUAGE plpgsql; 
