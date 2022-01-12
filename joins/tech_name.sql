use lms;
## Select mentor details and its tech name using inner join
SELECT mentor.name, mentor.mentor_type, tech_stack.tech_name
FROM mentor
INNER JOIN mentor_techstack ON mentor.id = mentor_techstack.mentor_id
INNER JOIN tech_stack ON mentor_techstack.tech_stack_id = tech_stack.id;