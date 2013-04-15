--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: assignments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE assignments (
    assignment_id integer NOT NULL,
    type_id integer NOT NULL,
    section_id integer NOT NULL,
    due_date date,
    highest_grade_value integer DEFAULT 100 NOT NULL,
    weight double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    description text
);


ALTER TABLE public.assignments OWNER TO postgres;

--
-- Name: Assignments_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Assignments_assignment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Assignments_assignment_id_seq" OWNER TO postgres;

--
-- Name: Assignments_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Assignments_assignment_id_seq" OWNED BY assignments.assignment_id;


--
-- Name: Assignments_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Assignments_section_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Assignments_section_id_seq" OWNER TO postgres;

--
-- Name: Assignments_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Assignments_section_id_seq" OWNED BY assignments.section_id;


--
-- Name: Assignments_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Assignments_type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Assignments_type_id_seq" OWNER TO postgres;

--
-- Name: Assignments_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Assignments_type_id_seq" OWNED BY assignments.type_id;


--
-- Name: assignment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignments ALTER COLUMN assignment_id SET DEFAULT nextval('"Assignments_assignment_id_seq"'::regclass);


--
-- Name: Assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY assignments
    ADD CONSTRAINT "Assignments_pkey" PRIMARY KEY (assignment_id);


--
-- Name: FK_Assignments_AssignmentTypes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignments
    ADD CONSTRAINT "FK_Assignments_AssignmentTypes" FOREIGN KEY (type_id) REFERENCES assignment_types(type_id);


--
-- Name: FK_Assignments_Sections; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignments
    ADD CONSTRAINT "FK_Assignments_Sections" FOREIGN KEY (section_id) REFERENCES sections(section_id);


--
-- PostgreSQL database dump complete
--

