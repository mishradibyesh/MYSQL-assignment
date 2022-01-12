use lms;
-- createing view for student name with comapany assigned
CREATE VIEW sNameWithCompanyAssigned AS
SELECT fellowship_candidates.id, fellowship_candidates.first_name, company.name as companyAssigned
FROM fellowship_candidates
INNER JOIN company_requirement ON fellowship_candidates.id = company_requirement.candidate_id
INNER JOIN company ON company_requirement.company_id = company.id;

SELECT * FROM sNameWithCompanyAssigned;


