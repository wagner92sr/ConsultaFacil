                                      Table "public.doctors"
   Column    |            Type             |                      Modifiers                       
-------------+-----------------------------+------------------------------------------------------
 id          | bigint                      | not null default nextval('doctors_id_seq'::regclass)
 crm         | integer                     | 
 name        | character varying           | 
 address     | character varying           | 
 city        | character varying           | 
 phone       | character varying           | 
 skill       | integer                     | 
 hospital_id | bigint                      | 
 created_at  | timestamp without time zone | not null
 updated_at  | timestamp without time zone | not null
Indexes:
    "doctors_pkey" PRIMARY KEY, btree (id)
    "index_doctors_on_hospital_id" btree (hospital_id)
Foreign-key constraints:
    "fk_rails_5d3ea700f7" FOREIGN KEY (hospital_id) REFERENCES hospitals(id)

