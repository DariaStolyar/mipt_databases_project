-- Триггер проверки существования преподавателя и студента перед добавлением
CREATE OR REPLACE FUNCTION university.check_teacher_student_existence()
RETURNS TRIGGER
AS $$
BEGIN
    IF NOT EXISTS (SELECT * FROM university.Teacher WHERE teacher_id = NEW.teacher_id) THEN
        RETURN NULL;
    END IF;
    
    IF NOT EXISTS (SELECT * FROM university.Student WHERE student_id = NEW.student_id) THEN
        RETURN NULL;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_teacher_student_before_insert
BEFORE INSERT ON university.Student_Teacher
FOR EACH ROW
EXECUTE FUNCTION university.check_teacher_student_existence();
 
 
--Функция для проверки корректности сроков проекта/задания
CREATE OR REPLACE FUNCTION university.validate_dates()
RETURNS TRIGGER
AS $$
BEGIN
    IF NEW.end_time <= NEW.start_time THEN
        RETURN NULL;
    END IF;
   
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Триггер перед вставкой или обновлением проекта
CREATE TRIGGER trg_project_dates_check
BEFORE INSERT OR UPDATE ON university.Project
FOR EACH ROW
EXECUTE FUNCTION university.validate_dates();

-- Триггер перед вставкой или обновлением задания
CREATE TRIGGER trg_task_dates_check
BEFORE INSERT OR UPDATE ON university.Task
FOR EACH ROW
EXECUTE FUNCTION university.validate_dates();



-- Триггер для автоматического обновления среднего балла студента
CREATE OR REPLACE FUNCTION university.update_student_avg_grade()
RETURNS TRIGGER
AS $$
BEGIN
    UPDATE university.Student
    SET avg_grade = (
        SELECT AVG(score)
        FROM university.Task
        WHERE student_id = COALESCE(NEW.student_id, OLD.student_id) AND score IS NOT NULL
    )
    WHERE student_id = COALESCE(NEW.student_id, OLD.student_id);
    
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_task_grade_change
AFTER INSERT OR UPDATE OF score OR DELETE ON university.Task
FOR EACH ROW
EXECUTE FUNCTION university.update_student_avg_grade();
