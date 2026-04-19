-- OTCi Attendance & Certification Tracker
-- Schema + seed data for masterclass Project 2

CREATE TABLE IF NOT EXISTS courses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  description TEXT,
  start_date TEXT,
  end_date TEXT
);

CREATE TABLE IF NOT EXISTS sessions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  course_id INTEGER NOT NULL REFERENCES courses(id),
  session_number INTEGER NOT NULL,
  date TEXT NOT NULL,
  topic TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS attendees (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  org TEXT NOT NULL,
  code TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS enrollments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  attendee_id INTEGER NOT NULL REFERENCES attendees(id),
  course_id INTEGER NOT NULL REFERENCES courses(id),
  UNIQUE(attendee_id, course_id)
);

CREATE TABLE IF NOT EXISTS attendance (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  enrollment_id INTEGER NOT NULL REFERENCES enrollments(id),
  session_id INTEGER NOT NULL REFERENCES sessions(id),
  present INTEGER NOT NULL DEFAULT 0,
  UNIQUE(enrollment_id, session_id)
);

-- Courses
INSERT INTO courses (name, description, start_date, end_date) VALUES
  ('Digital Literacy for Shop Stewards', 'Equip union shop stewards with essential digital skills for modern workplace representation', '2026-05-04', '2026-06-08'),
  ('Workplace Safety & Health Essentials', 'WSH fundamentals for union safety representatives across industries', '2026-05-06', '2026-06-10'),
  ('Young Union Leaders Bootcamp', 'Accelerated leadership development for union members under 35', '2026-05-10', '2026-06-14');

-- Sessions for Course 1: Digital Literacy for Shop Stewards
INSERT INTO sessions (course_id, session_number, date, topic) VALUES
  (1, 1, '2026-05-04', 'Opening & Digital Landscape Overview'),
  (1, 2, '2026-05-11', 'Cloud Tools for Union Administration'),
  (1, 3, '2026-05-18', 'Data Basics — Spreadsheets & Surveys'),
  (1, 4, '2026-05-25', 'Digital Communication & Social Media'),
  (1, 5, '2026-06-01', 'Cybersecurity Awareness'),
  (1, 6, '2026-06-08', 'Assessment & Digital Action Plan');

-- Sessions for Course 2: Workplace Safety & Health Essentials
INSERT INTO sessions (course_id, session_number, date, topic) VALUES
  (2, 1, '2026-05-06', 'Opening & WSH Framework'),
  (2, 2, '2026-05-13', 'Risk Assessment Methods'),
  (2, 3, '2026-05-20', 'Incident Investigation & Reporting'),
  (2, 4, '2026-05-27', 'Workplace Ergonomics'),
  (2, 5, '2026-06-03', 'Chemical & Biological Hazards'),
  (2, 6, '2026-06-10', 'Assessment & Safety Plan Presentation');

-- Sessions for Course 3: Young Union Leaders Bootcamp
INSERT INTO sessions (course_id, session_number, date, topic) VALUES
  (3, 1, '2026-05-10', 'Opening & Labour Movement History'),
  (3, 2, '2026-05-17', 'Collective Bargaining Fundamentals'),
  (3, 3, '2026-05-24', 'Member Engagement Strategies'),
  (3, 4, '2026-05-31', 'Public Speaking & Advocacy'),
  (3, 5, '2026-06-07', 'Negotiation Simulation'),
  (3, 6, '2026-06-14', 'Assessment & Leadership Reflection');

-- Attendees (20 participants across NTUC-affiliated organisations)
INSERT INTO attendees (name, email, org, code) VALUES
  ('Rachel Tan', 'rachel@uwl.org.sg', 'United Workers of Electronics & Electrical Industries', '7432'),
  ('Marcus Lim', 'marcus@ntuc.org.sg', 'NTUC Central Committee', '1985'),
  ('Priya Raj', 'priya@income.com.sg', 'NTUC Income', '3047'),
  ('Wei Jie Koh', 'weijie@fwu.org.sg', 'Food, Drinks & Allied Workers Union', '5581'),
  ('Aisha Binte Hassan', 'aisha@heu.org.sg', 'Healthcare Employees'' Union', '2294'),
  ('Daniel Ng', 'daniel@sbeu.org.sg', 'Singapore Bank Employees'' Union', '6718'),
  ('Kavitha Suresh', 'kavitha@ntuc.org.sg', 'NTUC LearningHub', '4039'),
  ('Zhiming Chen', 'zhiming@smmwu.org.sg', 'Singapore Maritime & Miscellaneous Workers'' Union', '8156'),
  ('Sarah Wong', 'sarah@aeu.org.sg', 'Amalgamated Union of Public Employees', '9473'),
  ('Rajesh Kumar', 'rajesh@ceu.org.sg', 'Construction & Engineering Workers'' Union', '3825'),
  ('Mei Ling Ong', 'meiling@ntuc.org.sg', 'NTUC First Campus', '7160'),
  ('Hafiz Abdul Rahman', 'hafiz@twu.org.sg', 'Transport Workers'' Union', '2547'),
  ('Joyce Teo', 'joyce@sieu.org.sg', 'Singapore Industrial & Services Employees'' Union', '6382'),
  ('Arjun Menon', 'arjun@ntuc.org.sg', 'NTUC FairPrice', '1094'),
  ('Li Hua Tan', 'lihua@heu.org.sg', 'Healthcare Employees'' Union', '5738'),
  ('Nurul Iman', 'nurul@uwl.org.sg', 'Union of Workers in Leisure Industry', '4261'),
  ('Boon Kiat Loh', 'boonkiat@satu.org.sg', 'Singapore Airlines Technical & Admin Union', '8907'),
  ('Deepa Nair', 'deepa@ntuc.org.sg', 'NTUC Club', '3614'),
  ('Hao Wei Sim', 'haowei@ceu.org.sg', 'Construction & Engineering Workers'' Union', '7293'),
  ('Amanda Liew', 'amanda@ntuc.org.sg', 'NTUC Health', '5086');

-- Enrollments (attendees spread across courses, some in multiple)
-- Course 1: Digital Literacy — 10 enrolled
INSERT INTO enrollments (attendee_id, course_id) VALUES
  (1, 1), (2, 1), (4, 1), (5, 1), (6, 1),
  (7, 1), (9, 1), (11, 1), (14, 1), (16, 1);

-- Course 2: WSH Essentials — 10 enrolled
INSERT INTO enrollments (attendee_id, course_id) VALUES
  (3, 2), (4, 2), (5, 2), (8, 2), (10, 2),
  (12, 2), (13, 2), (15, 2), (17, 2), (19, 2);

-- Course 3: Young Leaders — 8 enrolled
INSERT INTO enrollments (attendee_id, course_id) VALUES
  (1, 3), (2, 3), (3, 3), (6, 3),
  (18, 3), (19, 3), (20, 3), (16, 3);
