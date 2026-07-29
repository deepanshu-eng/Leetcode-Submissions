-- Write your PostgreSQL query statement below
SELECT 
    s.student_id,
    s.student_name, 
    sb.subject_name,
    COUNT(e.subject_name) as attended_exams
FROM 
    Students s
    CROSS JOIN 
    Subjects sb
    LEFT JOIN 
    Examinations e
    ON 
    s.student_id = e.student_id AND sb.subject_name = e.subject_name
Group by s.student_id, s.student_name, sb.subject_name
ORDER BY student_id, subject_name;

    