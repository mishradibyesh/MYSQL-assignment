use lms;
## creating view with person details and documents verified

CREATE VIEW personWhoseEducationChecked AS
SELECT      first_name ,middle_name ,last_name ,email_id ,mobile_number ,hired_city ,degree ,hired_date,permanent_pincode,candidates_education_det_check.is_verified
FROM hired_candidate
inner join candidates_education_det_check
on  candidates_education_det_check.is_verified = 1 and hired_candidate.id = candidates_education_det_check.candidate_id;

-- executing
select * from personWhoseEducationChecked;