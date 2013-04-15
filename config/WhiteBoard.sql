--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.attendances DROP CONSTRAINT "FK_Attendance_Users";
ALTER TABLE ONLY public.attendances DROP CONSTRAINT "FK_Attendance_Sections";
ALTER TABLE ONLY public.attendances DROP CONSTRAINT "PK_Attendance_ID";
ALTER TABLE public.attendances ALTER COLUMN attendance_id DROP DEFAULT;
DROP SEQUENCE public.attendance_attendance_id_seq;
DROP SEQUENCE public."Attendance_user_id_seq";
DROP SEQUENCE public."Attendance_section_id_seq";
DROP TABLE public.attendances;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attendances; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attendances (
    section_id integer NOT NULL,
    user_id integer NOT NULL,
    class_date date NOT NULL,
    attendance_id integer NOT NULL,
    attendance integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.attendances OWNER TO postgres;

--
-- Name: COLUMN attendances.attendance; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN attendances.attendance IS 'present=1, absent=2, tardy=3, excused=4';


--
-- Name: Attendance_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Attendance_section_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Attendance_section_id_seq" OWNER TO postgres;

--
-- Name: Attendance_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Attendance_section_id_seq" OWNED BY attendances.section_id;


--
-- Name: Attendance_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Attendance_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Attendance_user_id_seq" OWNER TO postgres;

--
-- Name: Attendance_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Attendance_user_id_seq" OWNED BY attendances.user_id;


--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attendance_attendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attendance_attendance_id_seq OWNER TO postgres;

--
-- Name: attendance_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attendance_attendance_id_seq OWNED BY attendances.attendance_id;


--
-- Name: attendance_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attendances ALTER COLUMN attendance_id SET DEFAULT nextval('attendance_attendance_id_seq'::regclass);


--
-- Name: PK_Attendance_ID; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attendances
    ADD CONSTRAINT "PK_Attendance_ID" PRIMARY KEY (attendance_id);


--
-- Name: FK_Attendance_Sections; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attendances
    ADD CONSTRAINT "FK_Attendance_Sections" FOREIGN KEY (section_id) REFERENCES sections(section_id);


--
-- Name: FK_Attendance_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attendances
    ADD CONSTRAINT "FK_Attendance_Users" FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- PostgreSQL database dump complete
--

