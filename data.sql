CREATE TABLE students (
	student_id bigserial primary key,
	name varchar(100) NOT NULL,
	surname varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	age integer NOT NULL
);

INSERT INTO students VALUES ('1234', 'John', 'Smith', 'jsmith@dit.ie', 22);
INSERT INTO students VALUES ('1235', 'Stephen', 'Stokes', 'sstokes@dit.ie', 29);

CREATE OR REPLACE FUNCTION student_list() 
RETURNS TABLE(id bigint, name character varying, surname character varying, email character varying, age integer) AS 
$$
DECLARE                    
BEGIN                         
    RETURN QUERY
        SELECT * FROM students;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE 
FUNCTION add_student(_id bigint, _name character varying, _surname character varying, _email character varying, _age integer)
RETURNS boolean AS 
$$
DECLARE
BEGIN
	INSERT INTO students VALUES (_id, _name, _surname, _email, _age);

	IF FOUND THEN RETURN TRUE;
	ELSE RETURN FALSE;
	END IF;
END
$$
LANGUAGE plpgsql;