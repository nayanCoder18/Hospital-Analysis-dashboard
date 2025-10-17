
exec sp_help doctor

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
	s.notes as surgery_notes,

	hb.room_charges as hospital_bills_room_charges,
	hb.surgery_charges as hospital_bills_surgery_charges,
	hb.medicine_charges as hospital_bills_medicine_charges,
	hb.test_charges as hospital_bills_test_charges,
	hb.doctor_fees as hospital_bills_doctor_fees,
	hb.other_charges as hospital_bills_other_charges,
	hb.total_amount as hospital_bills_total_amount ,
	hb.discount as hospital_bills_discount,
	hb.paid_amount as hospital_bills_paid_amount,
	hb.payment_method as hospital_bills_payment_method,
	hb.payment_status as hospital_bills_payment_status

from patient as p
left join satisfaction_Score as ss
	on ss.patient_id = p.patient_id  
left join surgery as s
	on s.patient_id = p.patient_id
left join hospital_bills as hb
	on hb.patient_id = p.patient_id
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


select 
	m.medicine_id,
	m.name as medicine_name,
	m.category,
	m.supplier_id,
	m.cost_price,
	m.unit_price,
	m.stock_qty,
	m.expiry_date,
	m.manufacture_date,
	m.batch_number,
	m.reorder_level,
	s.name as supplier_name
from Medical_Stock as m
left join Supplier as s
	on m.supplier_id = s.supplier_id



select * from [dbo].[Hospital_Bills]


select * from Beds

--- beds_info
select 
	ro.room_id,
	COUNT(ba.bed_id),
	ro.room_type ,
	ba.status
from Beds as ba
left join rooms as ro
on ba.room_id = ro.room_id
group by ro.room_type,ba.status,ro.room_id