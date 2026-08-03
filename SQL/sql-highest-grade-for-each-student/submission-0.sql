-- Write your query below
WITH scores AS(
    SELECT
        student_id,
        exam_id,
        score,
        ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY score DESC, exam_id ASC) AS rn
    FROM exam_results  
)
SELECT
    student_id,
    exam_id,
    score
FROM scores
WHERE rn = 1;








-- each student highest score with exam_id
-- student_id, exam_id, score(order by student_id asc)