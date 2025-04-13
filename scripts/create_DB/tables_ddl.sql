-- Создание схемы
CREATE SCHEMA university;

-- Таблица Teacher (семинарист)
CREATE TABLE university.Teacher (
    teacher_id INTEGER PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    surname VARCHAR(200) NOT NULL,
    subject VARCHAR(200),
    department VARCHAR(200),
    work_experience INTEGER
);

-- Таблица Student (студент)
CREATE TABLE university.Student (
    student_id INTEGER PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    surname VARCHAR(200) NOT NULL,
    group_number INTEGER NOT NULL,
    avg_grade NUMERIC,
    faculty VARCHAR(200) NOT NULL
);

-- Таблица Student-Teacher (сопоставление студентов семинаристам)
CREATE TABLE university.Student_Teacher (
    teacher_id INTEGER,
    student_id INTEGER,
    prev_teacher_id INTEGER,
    PRIMARY KEY (teacher_id, student_id),
    FOREIGN KEY (teacher_id) REFERENCES university.Teacher(teacher_id),
    FOREIGN KEY (student_id) REFERENCES university.Student(student_id),
    FOREIGN KEY (prev_teacher_id) REFERENCES university.Teacher(teacher_id)
);

-- Таблица Task (задание)
CREATE TABLE university.Task (
    task_id INTEGER PRIMARY KEY,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    student_id INTEGER,
    subject VARCHAR(200),
    score INTEGER,
    FOREIGN KEY (student_id) REFERENCES university.Student(student_id)
);

-- Таблица Project (проект)
CREATE TABLE university.Project (
    project_id INTEGER PRIMARY KEY,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    topic VARCHAR(200),
    leading_teacher_id INTEGER,
    FOREIGN KEY (leading_teacher_id) REFERENCES university.Teacher(teacher_id)
);

-- Таблица Student-Project (сопоставление заданий студентам)
CREATE TABLE university.Student_Project (
    student_id INTEGER,
    project_id INTEGER,
    PRIMARY KEY (student_id, project_id),
    FOREIGN KEY (student_id) REFERENCES university.Student(student_id),
    FOREIGN KEY (project_id) REFERENCES university.Project(project_id)
);

-- Таблица Postponements (справки и допуски)
CREATE TABLE university.Postponements (
    postponement_id INTEGER PRIMARY KEY,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    reason VARCHAR(200),
    student_id INTEGER,
    FOREIGN KEY (student_id) REFERENCES university.Student(student_id)
);
