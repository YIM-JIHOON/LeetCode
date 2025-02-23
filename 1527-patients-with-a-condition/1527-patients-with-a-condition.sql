-- 1형 당뇨병이 있는 환자의 patient_id, patient_name, condition 조회 (1형 당뇨병은 항상 'DIAB1'로 시작)

SELECT 
    patient_id,
    patient_name,
    conditions
FROM Patients
WHERE conditions REGEXP '(\\s|^)DIAB1[0-9]*($|\\s)'