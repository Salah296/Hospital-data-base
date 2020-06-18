

create table `Doctor` (
  `Doc_id` int not null, 
  `Doc_fname` varchar(255) not null, 
  `Doc_Lname` varchar(255) not null, 
  `Appointment_id` int not null
); 
alter table 
  `Doctor` 
add 
  primary key `doctor_doc_id_primary`(`Doc_id`); 

create table `Appointment` (
    `App_id` int not null, 
    `App_date` date not null, 
    `App_time` int not null, 
    `App_duration` int not null, 
    `App_reason` varchar(255) not null, 
    `partient_id` int not null
  ); 
alter table 
  `Appointment` 
add 
  primary key `appointment_app_id_primary`(`App_id`); 

create table `patient` (
    `Pat_id` int not null, 
    `Pat_fname` varchar(255) not null, 
    `Pat_Lname` varchar(255) not null, 
    `Pat_address` varchar(255) not null,
    `Pat_state` varchar(255) not null
  ); 
alter table 
  `patient` 
add 
  primary key `patient_pat_id_primary`(`Pat_id`); 
alter table 
  `Doctor` 
add 
  constraint `doctor_appointment_id_foreign` foreign key (`Appointment_id`) references `Appointment` (`App_id`); 
alter table 
  `Appointment` 
add 
  constraint `appointment_partient_id_foreign` foreign key (`partient_id`) references `patient` (`Pat_id`)



select * from Doctor;
select * from Appointment;
select * from patient;



select * from Doctor where Appointment_id IN (select Appointment_id from Appointment where App_date = '4/4/2020' );

select * from Appointment where patient_id IN (select patient_id from patient where Pat_state = 'stable' );

select * from Doctor where Appointment_id IN (select Appointment_id from Appointment where App_reason= 'hart attack' );



select count(*) from patient group by Pat_fname ;


Select  count(*) from Doctor  Group by Doc_fname  Having Doc_fname= 'maram' ;





Select Doc_fname, App_date From Doctor , Appointment Where Doctor.Appointment_id = Appointment.App_id ;

Select Pat_fname, App_reason From patient , Appointment Where patient.Pat_id = Appointment.partient_id ;


Select App_date, Pat_state From Appointment , patient Where Appointment.partient_id = patient.Pat_id ;


Select Pat_address, App_time From patient , Appointment Where patient.Pat_id = Appointment.partient_id ;


Select Doc_fname, Pat_fname From Doctor , patient Where Doctor.Doc_id = Appointment.Pat_id ;




Insert into Doctor values ( '111', 'maram', 'mohammed', '120') ;
Insert into Doctor values ( '222', 'Tom', 'jon', '131') ;
Insert into Doctor values ( '333', 'alaa', 'omar', '142') ;
Insert into Doctor values ( '444', 'Ahmed', 'mohammed', '153') ;
Insert into Doctor values ( '555', 'mohamed', 'amar', '164') ;


Insert into Appointment values ( '120', '4/4/2020','10:00 Am', '45 min ' , 'medical examinations' , '544') ;
Insert into Appointment values ( '131', '9/6/2020','4:00 Pm', '10 min ' , 'teeth' , '555') ;
Insert into Appointment values ( '142', '10/6/2020','5:30 Pm',  '35 min ' , 'fever' ,'567') ;
Insert into Appointment values ( '153', '10/9/2020','6:30 Pm','40 min' , 'hart attack' , '578') ;
Insert into Appointment values ( '164', '12/12/2020','9:30 Am', '60 min ' , 'stroke','599';



Insert into patient values ( '544', 'nabel', 'farag', 'desoq','stable') ;
Insert into patient values ( '555', 'farah', 'Naseem', 'sedy salem','stable') ;
Insert into patient values ( '567', 'omar', 'mohammed', 'mansora','unstable') ;
Insert into patient values ( '578', 'sara', 'ahmed', 'cario','stable') ;
Insert into patient values ( '599', 'farah', 'nabel', 'kafr el_shak','unstable') ;



 Update Appointment
 set App_time= '10:00 Am'
where App_id = 142;

Update patient 
set Pat_address= 'sedy salem'
where Pat_Lname ='ahmed';

Update patient 
set Pat_fname= 'Naseem'
where Pat_Lname ='nabel';

Update Appointment
  set App_reason= 'stroke'
where App_id= '120';

Update Appointment
 set App_duration ='45 min'
where App_date='10/9/2020'


Delete from patient  where Pat_Lname=' mohammed' ; 
Delete from Doctor Where Doc_fname=' maram'; 
Delete from Doctor where Doc_id=' 222' ;
Delete from patient  where Pat_address= 'cario'; 
Delete from Appointment where App_id = ' 120' ;








