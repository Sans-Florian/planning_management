#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Employee
#------------------------------------------------------------

CREATE TABLE Employee(
        employee_id     Int  Auto_increment  NOT NULL ,
        name            Varchar (150) ,
        first_name      Varchar (150) ,
        employee_number Varchar (50) ,
        road            Varchar (150) NOT NULL ,
        zip_code        Int NOT NULL ,
        town            Varchar (75) NOT NULL ,
        phone           Int ,
        email           Varchar (150)
	,CONSTRAINT Employee_PK PRIMARY KEY (employee_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Week
#------------------------------------------------------------

CREATE TABLE Week(
        id_week         Int  Auto_increment  NOT NULL ,
        number_week     Int ,
        start_date_week Date ,
        end_date_week   Date
	,CONSTRAINT Week_PK PRIMARY KEY (id_week)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Days
#------------------------------------------------------------

CREATE TABLE Days(
        id_day   Int  Auto_increment  NOT NULL ,
        day_name Varchar (150) NOT NULL ,
        day_date Date NOT NULL
	,CONSTRAINT Days_PK PRIMARY KEY (id_day)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Service
#------------------------------------------------------------

CREATE TABLE Service(
        service_id   Int  Auto_increment  NOT NULL ,
        service_name Varchar (150) NOT NULL
	,CONSTRAINT Service_PK PRIMARY KEY (service_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Vacation
#------------------------------------------------------------

CREATE TABLE Vacation(
        id                      Int  Auto_increment  NOT NULL ,
        start_date              Date ,
        end_date                Date ,
        remaining_vacation_days Int ,
        total_vacation_days     Int ,
        taken_vacation_days     Int
	,CONSTRAINT Vacation_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: User_Manager
#------------------------------------------------------------

CREATE TABLE User_Manager(
        id_manager        Int  Auto_increment  NOT NULL ,
        manager_name      Varchar (150) NOT NULL ,
        manager_firstname Varchar (150) NOT NULL ,
        login             Varchar (150) ,
        password          Varchar (150)
	,CONSTRAINT User_Manager_PK PRIMARY KEY (id_manager)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Team
#------------------------------------------------------------

CREATE TABLE Team(
        team_id   Int  Auto_increment  NOT NULL ,
        team_name Varchar (150) NOT NULL
	,CONSTRAINT Team_PK PRIMARY KEY (team_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Contract
#------------------------------------------------------------

CREATE TABLE Contract(
        contract_id    Int  Auto_increment  NOT NULL ,
        contract_type  Varchar (150) ,
        contract_hours Int ,
        contract_days  Int ,
        hiring_date    Date ,
        employee_id    Int NOT NULL
	,CONSTRAINT Contract_PK PRIMARY KEY (contract_id)

	,CONSTRAINT Contract_Employee_FK FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Work_Time
#------------------------------------------------------------

CREATE TABLE Work_Time(
        work_time_id   Int  Auto_increment  NOT NULL ,
        worked_time    Float NOT NULL ,
        remaining_work Float NOT NULL ,
        employee_id    Int NOT NULL
	,CONSTRAINT Work_Time_PK PRIMARY KEY (work_time_id)

	,CONSTRAINT Work_Time_Employee_FK FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: is composed by 
#------------------------------------------------------------

CREATE TABLE is_composed_by(
        work_time_id Int NOT NULL ,
        id_week      Int NOT NULL ,
        id_day       Int NOT NULL
	,CONSTRAINT is_composed_by_PK PRIMARY KEY (work_time_id,id_week,id_day)

	,CONSTRAINT is_composed_by_Work_Time_FK FOREIGN KEY (work_time_id) REFERENCES Work_Time(work_time_id)
	,CONSTRAINT is_composed_by_Week0_FK FOREIGN KEY (id_week) REFERENCES Week(id_week)
	,CONSTRAINT is_composed_by_Days1_FK FOREIGN KEY (id_day) REFERENCES Days(id_day)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: works in
#------------------------------------------------------------

CREATE TABLE works_in(
        employee_id Int NOT NULL ,
        service_id  Int NOT NULL ,
        team_id     Int NOT NULL
	,CONSTRAINT works_in_PK PRIMARY KEY (employee_id,service_id,team_id)

	,CONSTRAINT works_in_Employee_FK FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
	,CONSTRAINT works_in_Service0_FK FOREIGN KEY (service_id) REFERENCES Service(service_id)
	,CONSTRAINT works_in_Team1_FK FOREIGN KEY (team_id) REFERENCES Team(team_id)
)ENGINE=InnoDB;




	=======================================================================
	   Désolé, il faut activer cette version pour voir la suite du script ! 
	=======================================================================
