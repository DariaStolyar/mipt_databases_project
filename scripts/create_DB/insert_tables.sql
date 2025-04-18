-- Вставка данных в таблицу Teacher
INSERT INTO university.Teacher (teacher_id, name, surname, subject, department, work_experience)
VALUES
(1, 'Илья', 'Богданов', 'Алгебра и геометрия', 'Кафедра высшей математики', 20),
(2, 'Мария', 'Петрова', 'Физика', 'Кафедра общей физики', 8),
(3, 'Алексей', 'Сидоров', 'Программирование', 'Кафедра информатики и вычислительной математики', 12),
(4, 'Ольга', 'Кузнецова', 'Дискретная математика', 'Кафедра дискретной математики', 7),
(5, 'Дмитрий', 'Смирнов', 'Теория вероятностей', 'Кафедра высшей математики', 9),
(6, 'Елена', 'Васильева', 'Теоретическая механика', 'Кафедра теоретической механики', 11),
(7, 'Сергей', 'Попов', 'Математический анализ', 'Кафедра высшей математики', 6),
(8, 'Анна', 'Морозова', 'Квантовая физика', 'Кафедра общей физики', 5),
(9, 'Павел', 'Новиков', 'Базы данных', 'Кафедра информатики и вычислительной математики', 13),
(10, 'Татьяна', 'Федорова', 'Численные методы', 'Кафедра дискретной математики', 4),
(11, 'Николай', 'Волков', 'Операционные системы', 'Кафедра информатики и вычислительной математики', 8),
(12, 'Юлия', 'Алексеева', 'Иностранные языки', 'Департамент иностранных языков', 7),
(13, 'Андрей', 'Лебедев', 'Теория алгоритмов', 'Кафедра дискретной математики', 10),
(14, 'Екатерина', 'Семенова', 'Электродинамика', 'Кафедра общей физики', 6),
(15, 'Виктор', 'Егоров', 'Машинное обучение', 'Кафедра информатики и вычислительной математики', 9);

-- Вставка данных в таблицу Student
INSERT INTO university.Student (student_id, name, surname, group_number, avg_grade, faculty)
VALUES
(1, 'Александр', 'Иванов', 401, 9.5, 'ФРКТ'),
(2, 'Дарья', 'Петрова', 302, 4.7, 'ФПМИ'),
(3, 'Михаил', 'Сидоров', 103, 7.2, 'ФАКТ'),
(4, 'Анастасия', 'Кузнецова', 104, 6.8, 'ФЭФМ'),
(5, 'Артем', 'Смирнов', 305, 4.1, 'ФБМФ'),
(6, 'Елизавета', 'Васильева', 106, 8.6, 'ФРКТ'),
(7, 'Игорь', 'Попов', 107, 4.3, 'ФПМИ'),
(8, 'Ольга', 'Морозова', 108, 7.9, 'ФПМИ'),
(9, 'Владимир', 'Новиков', 209, 9.0, 'ФАКТ'),
(10, 'Анна', 'Федорова', 110, 8.7, 'ФЭФМ'),
(11, 'Денис', 'Волков', 111, 6.4, 'ФРКТ'),
(12, 'Марина', 'Алексеева', 412, 4.6, 'ФБМФ'),
(13, 'Сергей', 'Лебедев', 213, 8.2, 'ФБМФ'),
(14, 'Ксения', 'Семенова', 114, 5.8, 'ФПМИ'),
(15, 'Алексей', 'Егоров', 315, 7.3, 'ФАКТ');

-- Вставка данных в таблицу Student_Teacher
INSERT INTO university.Student_Teacher (teacher_id, student_id, prev_teacher_id)
VALUES
(1, 1, NULL),
(2, 2, 1),
(3, 3, 2),
(4, 4, NULL),
(5, 5, 4),
(6, 6, 5),
(7, 7, NULL),
(8, 8, NULL),
(9, 9, NULL),
(10, 10, 9),
(11, 11, NULL),
(12, 12, NULL),
(13, 13, 12),
(14, 14, NULL),
(15, 15, 14),
(1, 2, NULL),
(2, 3, 1),
(3, 4, 2),
(4, 5, NULL),
(5, 6, 4),
(6, 7, 5),
(7, 8, NULL),
(8, 9, NULL),
(9, 10, NULL),
(10, 11, 9),
(11, 12, NULL),
(12, 13, NULL),
(13, 14, 12),
(14, 15, NULL),
(15, 1, 14);

-- Вставка данных в таблицу Task
INSERT INTO university.Task (task_id, start_time, end_time, student_id, subject, score)
VALUES
(1, '2023-10-01 09:00:00', '2023-10-10 23:59:59', 1, 'Математика', 90),
(2, '2023-10-02 10:00:00', '2023-10-11 23:59:59', 2, 'Физика', 85),
(3, '2023-10-03 11:00:00', '2023-10-12 23:59:59', 3, 'Информатика', 95),
(4, '2023-10-04 12:00:00', '2023-10-13 23:59:59', 4, 'Химия', 88),
(5, '2023-10-05 13:00:00', '2023-10-14 23:59:59', 5, 'Биология', 92),
(6, '2023-10-06 14:00:00', '2023-10-15 23:59:59', 6, 'История', 87),
(7, '2023-10-07 15:00:00', '2023-10-16 23:59:59', 7, 'Математика', 89),
(8, '2023-10-08 16:00:00', '2023-10-17 23:59:59', 8, 'Физика', 91),
(9, '2023-10-09 17:00:00', '2023-10-18 23:59:59', 9, 'Информатика', 86),
(10, '2023-10-10 18:00:00', '2023-10-19 23:59:59', 10, 'Химия', 93),
(11, '2023-10-11 19:00:00', '2023-10-20 23:59:59', 11, 'Биология', 84),
(12, '2023-10-12 20:00:00', '2023-10-21 23:59:59', 12, 'История', 94),
(13, '2023-10-13 21:00:00', '2023-10-22 23:59:59', 13, 'Математика', 90),
(14, '2023-10-14 22:00:00', '2023-10-23 23:59:59', 14, 'Физика', 88),
(15, '2023-10-15 23:00:00', '2023-10-24 23:59:59', 15, 'Информатика', 89);

-- Вставка данных в таблицу Project
INSERT INTO university.Project (project_id, start_time, end_time, topic, leading_teacher_id)
VALUES
(1, '2023-09-01 09:00:00', '2023-12-01 23:59:59', 'Оптимизация алгоритмов сортировки', 3),
(2, '2023-09-02 10:00:00', '2023-12-02 23:59:59', 'Квантовая механика и её приложения', 2),
(3, '2023-09-03 11:00:00', '2023-12-03 23:59:59', 'Численные методы решения дифференциальных уравнений', 5),
(4, '2023-09-04 12:00:00', '2023-12-04 23:59:59', 'Теория относительности и её экспериментальные подтверждения', 6),
(5, '2023-09-05 13:00:00', '2023-12-05 23:59:59', 'Машинное обучение для анализа больших данных', 7),
(6, '2023-09-06 14:00:00', '2023-12-06 23:59:59', 'Геометрические основы теории графов', 8),
(7, '2023-09-07 15:00:00', '2023-12-07 23:59:59', 'Физика полупроводников и нанотехнологии', 9),
(8, '2023-09-08 16:00:00', '2023-12-08 23:59:59', 'Теория вероятностей и её приложения в физике', 10),
(9, '2023-09-09 17:00:00', '2023-12-09 23:59:59', 'Разработка алгоритмов для квантовых вычислений', 11),
(10, '2023-09-10 18:00:00', '2023-12-10 23:59:59', 'Моделирование физических процессов с помощью Python', 12),
(11, '2023-09-11 19:00:00', '2023-12-11 23:59:59', 'Анализ данных в астрофизике', 13),
(12, '2023-09-12 20:00:00', '2023-12-12 23:59:59', 'Теория игр и её приложения в информатике', 14),
(13, '2023-09-13 21:00:00', '2023-12-13 23:59:59', 'Математическое моделирование в физике плазмы', 15),
(14, '2023-09-14 22:00:00', '2023-12-14 23:59:59', 'Алгоритмы шифрования и криптография', 1),
(15, '2023-09-15 23:00:00', '2023-12-15 23:59:59', 'Исследование свойств сверхпроводников', 2);

-- Вставка данных в таблицу Student_Project
INSERT INTO university.Student_Project (student_id, project_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(15, 1);

-- Вставка данных в таблицу Postponements
INSERT INTO university.Postponements (postponement_id, start_time, end_time, reason, student_id)
VALUES
(1, '2023-10-01 09:00:00', '2023-10-10 23:59:59', 'Болезнь', 1),
(2, '2023-10-02 10:00:00', '2023-10-11 23:59:59', 'Участие в соревнованиях', 2),
(3, '2023-10-03 11:00:00', '2023-10-12 23:59:59', 'Участие в организации мероприятия университета', 3),
(4, '2023-10-04 12:00:00', '2023-10-13 23:59:59', 'Болезнь', 4),
(5, '2023-10-05 13:00:00', '2023-10-14 23:59:59', 'Участие в конференции', 5),
(6, '2023-10-06 14:00:00', '2023-10-15 23:59:59', 'Болезнь', 6),
(7, '2023-10-07 15:00:00', '2023-10-16 23:59:59', 'Участие в организации мероприятия университета', 7),
(8, '2023-10-08 16:00:00', '2023-10-17 23:59:59', 'Участие в соревнованиях', 8),
(9, '2023-10-09 17:00:00', '2023-10-18 23:59:59', 'Болезнь', 9),
(10, '2023-10-10 18:00:00', '2023-10-19 23:59:59', 'Участие в конференции', 10),
(11, '2023-10-11 19:00:00', '2023-10-20 23:59:59', 'Участие в организации мероприятия университета', 11),
(12, '2023-10-12 20:00:00', '2023-10-21 23:59:59', 'Болезнь', 12),
(13, '2023-10-13 21:00:00', '2023-10-22 23:59:59', 'Участие в соревнованиях', 13),
(14, '2023-10-14 22:00:00', '2023-10-23 23:59:59', 'Болезнь', 14),
(15, '2023-10-15 23:00:00', '2023-10-24 23:59:59', 'Участие в конференции', 15);
