use lms;
## outer join on candidate_fellowship and user_details table 

SELECT fellowship_candidates.first_name, fellowship_candidates.last_name ,user_details.contact_number, user_details.password
FROM fellowship_candidates
LEFT JOIN user_details ON fellowship_candidates.id = user_details.id;