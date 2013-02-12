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
-- Name: assignment_grades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE assignment_grades (
    grade_id integer NOT NULL,
    assignment_id integer NOT NULL,
    user_id integer NOT NULL,
    calculated boolean,
    grade_value double precision
);


ALTER TABLE public.assignment_grades OWNER TO postgres;

--
-- Name: AssignmentGrades_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "AssignmentGrades_assignment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AssignmentGrades_assignment_id_seq" OWNER TO postgres;

--
-- Name: AssignmentGrades_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "AssignmentGrades_assignment_id_seq" OWNED BY assignment_grades.assignment_id;


--
-- Name: AssignmentGrades_grade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "AssignmentGrades_grade_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AssignmentGrades_grade_id_seq" OWNER TO postgres;

--
-- Name: AssignmentGrades_grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "AssignmentGrades_grade_id_seq" OWNED BY assignment_grades.grade_id;


--
-- Name: AssignmentGrades_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "AssignmentGrades_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AssignmentGrades_user_id_seq" OWNER TO postgres;

--
-- Name: AssignmentGrades_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "AssignmentGrades_user_id_seq" OWNED BY assignment_grades.user_id;


--
-- Name: assignment_types; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE assignment_types (
    type_id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.assignment_types OWNER TO postgres;

--
-- Name: AssignmentTypes_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "AssignmentTypes_type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AssignmentTypes_type_id_seq" OWNER TO postgres;

--
-- Name: AssignmentTypes_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "AssignmentTypes_type_id_seq" OWNED BY assignment_types.type_id;


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
    updated_at timestamp without time zone
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
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attendance (
    section_id integer NOT NULL,
    user_id integer NOT NULL,
    class_date date NOT NULL,
    present boolean DEFAULT true,
    absent boolean DEFAULT false,
    tardy boolean DEFAULT false,
    excused boolean DEFAULT false
);


ALTER TABLE public.attendance OWNER TO postgres;

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

ALTER SEQUENCE "Attendance_section_id_seq" OWNED BY attendance.section_id;


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

ALTER SEQUENCE "Attendance_user_id_seq" OWNED BY attendance.user_id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE courses (
    course_id integer NOT NULL,
    number text NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: Courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Courses_course_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Courses_course_id_seq" OWNER TO postgres;

--
-- Name: Courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Courses_course_id_seq" OWNED BY courses.course_id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.groups_users OWNER TO postgres;

--
-- Name: GroupUsers_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "GroupUsers_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GroupUsers_group_id_seq" OWNER TO postgres;

--
-- Name: GroupUsers_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "GroupUsers_group_id_seq" OWNED BY groups_users.group_id;


--
-- Name: GroupUsers_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "GroupUsers_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GroupUsers_user_id_seq" OWNER TO postgres;

--
-- Name: GroupUsers_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "GroupUsers_user_id_seq" OWNED BY groups_users.user_id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    group_id integer NOT NULL,
    name text NOT NULL,
    associated_course integer NOT NULL,
    associated_section integer NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: Groups_associated_course_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Groups_associated_course_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Groups_associated_course_seq" OWNER TO postgres;

--
-- Name: Groups_associated_course_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Groups_associated_course_seq" OWNED BY groups.associated_course;


--
-- Name: Groups_associated_section_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Groups_associated_section_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Groups_associated_section_seq" OWNER TO postgres;

--
-- Name: Groups_associated_section_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Groups_associated_section_seq" OWNED BY groups.associated_section;


--
-- Name: Groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Groups_group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Groups_group_id_seq" OWNER TO postgres;

--
-- Name: Groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Groups_group_id_seq" OWNED BY groups.group_id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE messages (
    message_id integer NOT NULL,
    sender_id integer NOT NULL,
    receiver_id integer NOT NULL,
    sent boolean DEFAULT false,
    subject text,
    message text,
    receiver_read boolean DEFAULT false,
    sender_deleted boolean DEFAULT false,
    receiver_deleted boolean DEFAULT false
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: Messages_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Messages_message_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Messages_message_id_seq" OWNER TO postgres;

--
-- Name: Messages_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Messages_message_id_seq" OWNED BY messages.message_id;


--
-- Name: Messages_receiver_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Messages_receiver_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Messages_receiver_id_seq" OWNER TO postgres;

--
-- Name: Messages_receiver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Messages_receiver_id_seq" OWNED BY messages.receiver_id;


--
-- Name: Messages_sender_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Messages_sender_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Messages_sender_id_seq" OWNER TO postgres;

--
-- Name: Messages_sender_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Messages_sender_id_seq" OWNED BY messages.sender_id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permissions (
    perm_id integer NOT NULL,
    role_id integer NOT NULL,
    perm_name text NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: Permissions_perm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Permissions_perm_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Permissions_perm_id_seq" OWNER TO postgres;

--
-- Name: Permissions_perm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Permissions_perm_id_seq" OWNED BY permissions.perm_id;


--
-- Name: Permissions_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Permissions_role_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Permissions_role_id_seq" OWNER TO postgres;

--
-- Name: Permissions_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Permissions_role_id_seq" OWNED BY permissions.role_id;


--
-- Name: quiz_answers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_answers (
    answer_id integer NOT NULL,
    question_id integer NOT NULL,
    answer_text text,
    is_correct boolean DEFAULT false NOT NULL
);


ALTER TABLE public.quiz_answers OWNER TO postgres;

--
-- Name: QuizAnswers_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "QuizAnswers_answer_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."QuizAnswers_answer_id_seq" OWNER TO postgres;

--
-- Name: QuizAnswers_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "QuizAnswers_answer_id_seq" OWNED BY quiz_answers.answer_id;


--
-- Name: QuizAnswers_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "QuizAnswers_question_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."QuizAnswers_question_id_seq" OWNER TO postgres;

--
-- Name: QuizAnswers_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "QuizAnswers_question_id_seq" OWNED BY quiz_answers.question_id;


--
-- Name: quiz_attempts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_attempts (
    attempt_id integer NOT NULL,
    question_id integer NOT NULL,
    user_id integer NOT NULL,
    answer_id integer NOT NULL,
    question_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.quiz_attempts OWNER TO postgres;

--
-- Name: QuizAttempts_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "QuizAttempts_answer_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."QuizAttempts_answer_id_seq" OWNER TO postgres;

--
-- Name: QuizAttempts_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "QuizAttempts_answer_id_seq" OWNED BY quiz_attempts.answer_id;


--
-- Name: QuizAttempts_attempt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "QuizAttempts_attempt_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."QuizAttempts_attempt_id_seq" OWNER TO postgres;

--
-- Name: QuizAttempts_attempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "QuizAttempts_attempt_id_seq" OWNED BY quiz_attempts.attempt_id;


--
-- Name: QuizAttempts_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "QuizAttempts_question_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."QuizAttempts_question_id_seq" OWNER TO postgres;

--
-- Name: QuizAttempts_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "QuizAttempts_question_id_seq" OWNED BY quiz_attempts.question_id;


--
-- Name: QuizAttempts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "QuizAttempts_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."QuizAttempts_user_id_seq" OWNER TO postgres;

--
-- Name: QuizAttempts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "QuizAttempts_user_id_seq" OWNED BY quiz_attempts.user_id;


--
-- Name: quiz_questions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_questions (
    question_id integer NOT NULL,
    quiz_id integer NOT NULL,
    question_text text
);


ALTER TABLE public.quiz_questions OWNER TO postgres;

--
-- Name: QuizQuestions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "QuizQuestions_question_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."QuizQuestions_question_id_seq" OWNER TO postgres;

--
-- Name: QuizQuestions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "QuizQuestions_question_id_seq" OWNED BY quiz_questions.question_id;


--
-- Name: QuizQuestions_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "QuizQuestions_quiz_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."QuizQuestions_quiz_id_seq" OWNER TO postgres;

--
-- Name: QuizQuestions_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "QuizQuestions_quiz_id_seq" OWNED BY quiz_questions.quiz_id;


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quizzes (
    quiz_id integer NOT NULL,
    section_id integer NOT NULL,
    due_date date,
    times_allowed integer DEFAULT 1
);


ALTER TABLE public.quizzes OWNER TO postgres;

--
-- Name: Quizzes_quiz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Quizzes_quiz_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Quizzes_quiz_id_seq" OWNER TO postgres;

--
-- Name: Quizzes_quiz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Quizzes_quiz_id_seq" OWNED BY quizzes.quiz_id;


--
-- Name: Quizzes_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Quizzes_section_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Quizzes_section_id_seq" OWNER TO postgres;

--
-- Name: Quizzes_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Quizzes_section_id_seq" OWNED BY quizzes.section_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    role_id integer NOT NULL,
    name character varying(255),
    resource_id integer,
    resource_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Roles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Roles_id_seq" OWNER TO postgres;

--
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Roles_id_seq" OWNED BY roles.role_id;


--
-- Name: sections_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sections_users (
    section_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.sections_users OWNER TO postgres;

--
-- Name: SectionUsers_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "SectionUsers_section_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SectionUsers_section_id_seq" OWNER TO postgres;

--
-- Name: SectionUsers_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "SectionUsers_section_id_seq" OWNED BY sections_users.section_id;


--
-- Name: SectionUsers_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "SectionUsers_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SectionUsers_user_id_seq" OWNER TO postgres;

--
-- Name: SectionUsers_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "SectionUsers_user_id_seq" OWNED BY sections_users.user_id;


--
-- Name: sections; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sections (
    section_id integer NOT NULL,
    course_id integer NOT NULL,
    number integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.sections OWNER TO postgres;

--
-- Name: Sections_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sections_course_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sections_course_id_seq" OWNER TO postgres;

--
-- Name: Sections_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sections_course_id_seq" OWNED BY sections.course_id;


--
-- Name: Sections_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Sections_section_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sections_section_id_seq" OWNER TO postgres;

--
-- Name: Sections_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Sections_section_id_seq" OWNED BY sections.section_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    user_id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Users_id_seq" OWNED BY users.user_id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users_roles (
    user_id integer,
    role_id integer
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- Name: grade_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignment_grades ALTER COLUMN grade_id SET DEFAULT nextval('"AssignmentGrades_grade_id_seq"'::regclass);


--
-- Name: assignment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignment_grades ALTER COLUMN assignment_id SET DEFAULT nextval('"AssignmentGrades_assignment_id_seq"'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignment_grades ALTER COLUMN user_id SET DEFAULT nextval('"AssignmentGrades_user_id_seq"'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignment_types ALTER COLUMN type_id SET DEFAULT nextval('"AssignmentTypes_type_id_seq"'::regclass);


--
-- Name: assignment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignments ALTER COLUMN assignment_id SET DEFAULT nextval('"Assignments_assignment_id_seq"'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignments ALTER COLUMN type_id SET DEFAULT nextval('"Assignments_type_id_seq"'::regclass);


--
-- Name: section_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignments ALTER COLUMN section_id SET DEFAULT nextval('"Assignments_section_id_seq"'::regclass);


--
-- Name: section_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attendance ALTER COLUMN section_id SET DEFAULT nextval('"Attendance_section_id_seq"'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attendance ALTER COLUMN user_id SET DEFAULT nextval('"Attendance_user_id_seq"'::regclass);


--
-- Name: course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY courses ALTER COLUMN course_id SET DEFAULT nextval('"Courses_course_id_seq"'::regclass);


--
-- Name: group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN group_id SET DEFAULT nextval('"Groups_group_id_seq"'::regclass);


--
-- Name: associated_course; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN associated_course SET DEFAULT nextval('"Groups_associated_course_seq"'::regclass);


--
-- Name: associated_section; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN associated_section SET DEFAULT nextval('"Groups_associated_section_seq"'::regclass);


--
-- Name: group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_users ALTER COLUMN group_id SET DEFAULT nextval('"GroupUsers_group_id_seq"'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_users ALTER COLUMN user_id SET DEFAULT nextval('"GroupUsers_user_id_seq"'::regclass);


--
-- Name: message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages ALTER COLUMN message_id SET DEFAULT nextval('"Messages_message_id_seq"'::regclass);


--
-- Name: sender_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages ALTER COLUMN sender_id SET DEFAULT nextval('"Messages_sender_id_seq"'::regclass);


--
-- Name: receiver_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages ALTER COLUMN receiver_id SET DEFAULT nextval('"Messages_receiver_id_seq"'::regclass);


--
-- Name: perm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions ALTER COLUMN perm_id SET DEFAULT nextval('"Permissions_perm_id_seq"'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions ALTER COLUMN role_id SET DEFAULT nextval('"Permissions_role_id_seq"'::regclass);


--
-- Name: answer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_answers ALTER COLUMN answer_id SET DEFAULT nextval('"QuizAnswers_answer_id_seq"'::regclass);


--
-- Name: question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_answers ALTER COLUMN question_id SET DEFAULT nextval('"QuizAnswers_question_id_seq"'::regclass);


--
-- Name: attempt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_attempts ALTER COLUMN attempt_id SET DEFAULT nextval('"QuizAttempts_attempt_id_seq"'::regclass);


--
-- Name: question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_attempts ALTER COLUMN question_id SET DEFAULT nextval('"QuizAttempts_question_id_seq"'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_attempts ALTER COLUMN user_id SET DEFAULT nextval('"QuizAttempts_user_id_seq"'::regclass);


--
-- Name: answer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_attempts ALTER COLUMN answer_id SET DEFAULT nextval('"QuizAttempts_answer_id_seq"'::regclass);


--
-- Name: question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_questions ALTER COLUMN question_id SET DEFAULT nextval('"QuizQuestions_question_id_seq"'::regclass);


--
-- Name: quiz_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_questions ALTER COLUMN quiz_id SET DEFAULT nextval('"QuizQuestions_quiz_id_seq"'::regclass);


--
-- Name: quiz_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quizzes ALTER COLUMN quiz_id SET DEFAULT nextval('"Quizzes_quiz_id_seq"'::regclass);


--
-- Name: section_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quizzes ALTER COLUMN section_id SET DEFAULT nextval('"Quizzes_section_id_seq"'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN role_id SET DEFAULT nextval('"Roles_id_seq"'::regclass);


--
-- Name: section_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sections ALTER COLUMN section_id SET DEFAULT nextval('"Sections_section_id_seq"'::regclass);


--
-- Name: course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sections ALTER COLUMN course_id SET DEFAULT nextval('"Sections_course_id_seq"'::regclass);


--
-- Name: section_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sections_users ALTER COLUMN section_id SET DEFAULT nextval('"SectionUsers_section_id_seq"'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sections_users ALTER COLUMN user_id SET DEFAULT nextval('"SectionUsers_user_id_seq"'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Name: AssignmentGrades_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"AssignmentGrades_assignment_id_seq"', 1, false);


--
-- Name: AssignmentGrades_grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"AssignmentGrades_grade_id_seq"', 1, false);


--
-- Name: AssignmentGrades_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"AssignmentGrades_user_id_seq"', 1, false);


--
-- Name: AssignmentTypes_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"AssignmentTypes_type_id_seq"', 1, true);


--
-- Name: Assignments_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Assignments_assignment_id_seq"', 3, true);


--
-- Name: Assignments_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Assignments_section_id_seq"', 1, false);


--
-- Name: Assignments_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Assignments_type_id_seq"', 1, false);


--
-- Name: Attendance_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Attendance_section_id_seq"', 1, false);


--
-- Name: Attendance_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Attendance_user_id_seq"', 1, false);


--
-- Name: Courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Courses_course_id_seq"', 2, true);


--
-- Name: GroupUsers_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"GroupUsers_group_id_seq"', 1, false);


--
-- Name: GroupUsers_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"GroupUsers_user_id_seq"', 1, false);


--
-- Name: Groups_associated_course_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Groups_associated_course_seq"', 1, false);


--
-- Name: Groups_associated_section_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Groups_associated_section_seq"', 1, false);


--
-- Name: Groups_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Groups_group_id_seq"', 1, false);


--
-- Name: Messages_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Messages_message_id_seq"', 1, false);


--
-- Name: Messages_receiver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Messages_receiver_id_seq"', 1, false);


--
-- Name: Messages_sender_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Messages_sender_id_seq"', 1, false);


--
-- Name: Permissions_perm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Permissions_perm_id_seq"', 1, false);


--
-- Name: Permissions_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Permissions_role_id_seq"', 1, false);


--
-- Name: QuizAnswers_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"QuizAnswers_answer_id_seq"', 1, false);


--
-- Name: QuizAnswers_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"QuizAnswers_question_id_seq"', 1, false);


--
-- Name: QuizAttempts_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"QuizAttempts_answer_id_seq"', 1, false);


--
-- Name: QuizAttempts_attempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"QuizAttempts_attempt_id_seq"', 1, false);


--
-- Name: QuizAttempts_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"QuizAttempts_question_id_seq"', 1, false);


--
-- Name: QuizAttempts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"QuizAttempts_user_id_seq"', 1, false);


--
-- Name: QuizQuestions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"QuizQuestions_question_id_seq"', 1, false);


--
-- Name: QuizQuestions_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"QuizQuestions_quiz_id_seq"', 1, false);


--
-- Name: Quizzes_quiz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Quizzes_quiz_id_seq"', 1, false);


--
-- Name: Quizzes_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Quizzes_section_id_seq"', 1, false);


--
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Roles_id_seq"', 3, true);


--
-- Name: SectionUsers_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"SectionUsers_section_id_seq"', 1, false);


--
-- Name: SectionUsers_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"SectionUsers_user_id_seq"', 1, false);


--
-- Name: Sections_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sections_course_id_seq"', 1, false);


--
-- Name: Sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Sections_section_id_seq"', 1, true);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Users_id_seq"', 5, true);


--
-- Data for Name: assignment_grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY assignment_grades (grade_id, assignment_id, user_id, calculated, grade_value) FROM stdin;
\.


--
-- Data for Name: assignment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY assignment_types (type_id, name, created_at, updated_at) FROM stdin;
1	Homework	2013-02-12 17:27:58.553135	2013-02-12 17:27:58.553135
\.


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY assignments (assignment_id, type_id, section_id, due_date, highest_grade_value, weight, created_at, updated_at) FROM stdin;
1	1	1	2020-02-12	100	1	2013-02-12 17:27:58.598799	2013-02-12 17:27:58.598799
3	1	1	2013-02-12	100	7	2013-02-12 17:42:04.044711	2013-02-12 17:42:16.522085
\.


--
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attendance (section_id, user_id, class_date, present, absent, tardy, excused) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY courses (course_id, number, name, created_at, updated_at) FROM stdin;
1	2000	Data Structures	2013-02-12 17:27:58.489006	2013-02-12 17:27:58.489006
2	10000	Machine Learning	2013-02-12 17:42:36.612343	2013-02-12 17:42:36.612343
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (group_id, name, associated_course, associated_section) FROM stdin;
\.


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups_users (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messages (message_id, sender_id, receiver_id, sent, subject, message, receiver_read, sender_deleted, receiver_deleted) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permissions (perm_id, role_id, perm_name) FROM stdin;
\.


--
-- Data for Name: quiz_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quiz_answers (answer_id, question_id, answer_text, is_correct) FROM stdin;
\.


--
-- Data for Name: quiz_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quiz_attempts (attempt_id, question_id, user_id, answer_id, question_count) FROM stdin;
\.


--
-- Data for Name: quiz_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quiz_questions (question_id, quiz_id, question_text) FROM stdin;
\.


--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quizzes (quiz_id, section_id, due_date, times_allowed) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (role_id, name, resource_id, resource_type, created_at, updated_at) FROM stdin;
1	admin	\N	\N	2013-02-12 17:16:06.599824	2013-02-12 17:16:06.599824
2	user	\N	\N	2013-02-12 17:16:06.628969	2013-02-12 17:16:06.628969
3	VIP	\N	\N	2013-02-12 17:16:06.636287	2013-02-12 17:16:06.636287
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20130205185153
20130205185156
20130205185201
20130211230823
20130212024155
20130212151903
20130212152603
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sections (section_id, course_id, number, created_at, updated_at) FROM stdin;
1	1	1	2013-02-12 17:27:58.530747	2013-02-12 17:27:58.530747
\.


--
-- Data for Name: sections_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sections_users (section_id, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (user_id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name) FROM stdin;
2	kip@test.com	$2a$10$Nhr2Z88UP7nl8GXX0nsB8OzAYdGGDFR6z7iavbZslCjC8HOEyyLZS	\N	\N	\N	2	2013-02-09 00:20:35.951839	2013-02-09 00:20:20.846449	127.0.0.1	127.0.0.1	2013-02-09 00:20:20.825034	2013-02-09 00:20:35.95264	kipnichols
3	group8admin@baylor.edu	$2a$10$YcQ9AcgYPIBEXS/IRfLJceIg4BgU4zkzQbehzlZU6aj4SIE7wHuWe	\N	\N	\N	0	\N	\N	\N	\N	2013-02-12 17:16:06.755289	2013-02-12 17:16:06.755289	group8admin
4	jordan@wtf.com	$2a$10$FjM6B8wtTC7MZ8VDS.HKmu.tAhT45VmRMOl/MGk9Mz9fBJu9z4CPK	\N	\N	\N	1	2013-02-12 17:29:43.230596	2013-02-12 17:29:43.230596	127.0.0.1	127.0.0.1	2013-02-12 17:29:43.210981	2013-02-12 17:29:43.23146	Jordan
5	test@example.com	$2a$10$7bk5HQPbEKV9T.R3LPv7x.MbGtSIbQdtFaxMGyq43lNUEyKFQpI5G	\N	\N	\N	1	2013-02-12 17:41:39.726344	2013-02-12 17:41:39.726344	127.0.0.1	127.0.0.1	2013-02-12 17:41:39.706301	2013-02-12 17:41:52.329981	Hello
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_roles (user_id, role_id) FROM stdin;
3	1
\.


--
-- Name: AssignmentGrades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY assignment_grades
    ADD CONSTRAINT "AssignmentGrades_pkey" PRIMARY KEY (grade_id);


--
-- Name: AssignmentTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY assignment_types
    ADD CONSTRAINT "AssignmentTypes_pkey" PRIMARY KEY (type_id);


--
-- Name: Assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY assignments
    ADD CONSTRAINT "Assignments_pkey" PRIMARY KEY (assignment_id);


--
-- Name: Courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT "Courses_pkey" PRIMARY KEY (course_id);


--
-- Name: Groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY (group_id);


--
-- Name: Messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT "Messages_pkey" PRIMARY KEY (message_id);


--
-- Name: Permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT "Permissions_pkey" PRIMARY KEY (perm_id);


--
-- Name: QuizAnswers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_answers
    ADD CONSTRAINT "QuizAnswers_pkey" PRIMARY KEY (answer_id);


--
-- Name: QuizAttempts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_attempts
    ADD CONSTRAINT "QuizAttempts_pkey" PRIMARY KEY (attempt_id);


--
-- Name: QuizQuestions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_questions
    ADD CONSTRAINT "QuizQuestions_pkey" PRIMARY KEY (question_id);


--
-- Name: Quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quizzes
    ADD CONSTRAINT "Quizzes_pkey" PRIMARY KEY (quiz_id);


--
-- Name: Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (role_id);


--
-- Name: Sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT "Sections_pkey" PRIMARY KEY (section_id);


--
-- Name: Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);


--
-- Name: index_Roles_on_role_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "index_Roles_on_role_name" ON roles USING btree (name);


--
-- Name: index_Roles_on_role_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "index_Roles_on_role_name_and_resource_type_and_resource_id" ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_UserRoles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "index_UserRoles_on_user_id_and_role_id" ON users_roles USING btree (user_id, role_id);


--
-- Name: index_Users_on_email; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "index_Users_on_email" ON users USING btree (email);


--
-- Name: index_Users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX "index_Users_on_reset_password_token" ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: FK_AssignmentGrades_Assignments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignment_grades
    ADD CONSTRAINT "FK_AssignmentGrades_Assignments" FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id);


--
-- Name: FK_AssignmentGrades_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assignment_grades
    ADD CONSTRAINT "FK_AssignmentGrades_Users" FOREIGN KEY (user_id) REFERENCES users(user_id);


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
-- Name: FK_Attendance_Sections; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attendance
    ADD CONSTRAINT "FK_Attendance_Sections" FOREIGN KEY (section_id) REFERENCES sections(section_id);


--
-- Name: FK_Attendance_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attendance
    ADD CONSTRAINT "FK_Attendance_Users" FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: FK_GroupUsers_Groups; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_users
    ADD CONSTRAINT "FK_GroupUsers_Groups" FOREIGN KEY (group_id) REFERENCES groups(group_id);


--
-- Name: FK_GroupUsers_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_users
    ADD CONSTRAINT "FK_GroupUsers_Users" FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: FK_Groups_Courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT "FK_Groups_Courses" FOREIGN KEY (associated_course) REFERENCES courses(course_id);


--
-- Name: FK_Groups_Sections; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT "FK_Groups_Sections" FOREIGN KEY (associated_section) REFERENCES sections(section_id);


--
-- Name: FK_Messages_UserReceiver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT "FK_Messages_UserReceiver" FOREIGN KEY (receiver_id) REFERENCES users(user_id);


--
-- Name: FK_Messages_UserSender; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT "FK_Messages_UserSender" FOREIGN KEY (sender_id) REFERENCES users(user_id);


--
-- Name: FK_Permissions_Roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT "FK_Permissions_Roles" FOREIGN KEY (role_id) REFERENCES roles(role_id);


--
-- Name: FK_QuizAnswers_QuizQuestions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_answers
    ADD CONSTRAINT "FK_QuizAnswers_QuizQuestions" FOREIGN KEY (question_id) REFERENCES quiz_questions(question_id);


--
-- Name: FK_QuizAttempts_QuizAnswers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_attempts
    ADD CONSTRAINT "FK_QuizAttempts_QuizAnswers" FOREIGN KEY (answer_id) REFERENCES quiz_answers(answer_id);


--
-- Name: FK_QuizAttempts_QuizQuestions; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_attempts
    ADD CONSTRAINT "FK_QuizAttempts_QuizQuestions" FOREIGN KEY (question_id) REFERENCES quiz_questions(question_id);


--
-- Name: FK_QuizAttempts_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_attempts
    ADD CONSTRAINT "FK_QuizAttempts_Users" FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: FK_QuizQuestions_Quizzes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quiz_questions
    ADD CONSTRAINT "FK_QuizQuestions_Quizzes" FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id);


--
-- Name: FK_Quizzes_Sections; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quizzes
    ADD CONSTRAINT "FK_Quizzes_Sections" FOREIGN KEY (section_id) REFERENCES sections(section_id);


--
-- Name: FK_SectionUsers_Sections; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sections_users
    ADD CONSTRAINT "FK_SectionUsers_Sections" FOREIGN KEY (section_id) REFERENCES sections(section_id);


--
-- Name: FK_SectionUsers_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sections_users
    ADD CONSTRAINT "FK_SectionUsers_Users" FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: FK_Sections_Courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sections
    ADD CONSTRAINT "FK_Sections_Courses" FOREIGN KEY (course_id) REFERENCES courses(course_id);


--
-- Name: FK_UserRoles_Roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT "FK_UserRoles_Roles" FOREIGN KEY (role_id) REFERENCES roles(role_id);


--
-- Name: FK_UserRoles_Users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT "FK_UserRoles_Users" FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
