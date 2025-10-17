create view patient_info as
select 
	p.patient_id as patient_patient_id,
	p.name as Patient_name,
	p.gender as patient_gender,
	p.weight as patient_weight,
	p.age as patient_age,
	p.blood_group as patient_bood_group,
	p.email as patient_email,
	p.state as patient_state,
	p.phone as patient_phone,
	p.admission_date as patient_admission_date,
	p.discharge_date as patient_discharge_date,
	p.address as patient_address,
	p.status as patient_status,
	p.img as patient_img,
	case
		when b.bed_id is null then 'Not admitted'
		else 'Admitted'
	end as patient_admission_status,

	dr.doctor_id as doctor_doctor_id,
	dr.name as doctor_name,
	dr.salary as doctor_salary,
	dr.specialization as doctor_specialization,
	dr.department as doctor_department,
	dr.availability as doctor_availability,
	dr.joining_date as doctor_joining_date,
	dr.qualification as doctor_qualification,
	dr.experience_years as doctor_experience_years,
	dr.email as doctor_email,
	dr.phone as doctor_phone,
	dr.Img as doctor_img,

	r.room_id as room_room_id,
	r.floor as room_floor,
	r.room_type as room_room_type,
	r.capacity as room_capacity,
	r.daily_charge as room_daily_charge,
	r.avg_montly_maintenance_cost as room_avg_montly_maintenance_cost,
	r.status as room_status,

	d.department_id as department_department_id,
	d.name as department_name,
	d.total_staff as department_total_staff,

	ss.satisfaction_id as satisfaction_satisfaction_id,
	ss.rating as satisfaction_rating,
	ss.feedback as satisfaction_feedback,

	s.appointment_id as surgery_appointment_id,
	s.appointment_date as surgery_appointment_date,
	s.status as surgery_status,
	s.reason as surgery_reason,
	s.notes as surgery_notes

from patient as p
left join satisfaction_Score as ss
	on ss.patient_id = p.patient_id  
left join surgery as s
	on s.patient_id = p.patient_id

left join beds as b
	on b.patient_id = p.patient_id
left join rooms as r
	on r.room_id = b.room_id
left join department as d
	on d.department_id = r.department_id
left join (select distinct patient_id,doctor_id from appointment) a
	on a.patient_id = p.patient_id
left join doctor as dr
	on dr.doctor_id = a.doctor_id;





