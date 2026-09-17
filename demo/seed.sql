-- Demo data for an isolated workspace. Fictional companies, people and deals only.
--
-- A small fund's network: six startups, founders, co-investors, an LP and an
-- operator, a pipeline with a deal in every default stage, and a warm-intro
-- graph. Pipeline stages are left to the app, which creates its defaults on
-- first use; the deals below use those default stage keys.

INSERT INTO companies (id, name, domain, industry, location, email, notes) VALUES
  ('5a1c0e10-0000-4000-8000-000000000001', 'Tidewater Robotics', 'tidewater.example.test', 'Robotics', 'Rotterdam', 'hello@tidewater.example.test', 'Warehouse picking arms for mid-size 3PLs.'),
  ('5a1c0e10-0000-4000-8000-000000000002', 'Lumen Health', 'lumenhealth.example.test', 'Health tech', 'Berlin', 'team@lumenhealth.example.test', 'Remote cardiac monitoring for clinics.'),
  ('5a1c0e10-0000-4000-8000-000000000003', 'Fernway Logistics', 'fernway.example.test', 'Logistics', 'Lisbon', 'ops@fernway.example.test', 'Route planning for regional couriers.'),
  ('5a1c0e10-0000-4000-8000-000000000004', 'Quillstack', 'quillstack.example.test', 'Developer tools', 'Amsterdam', 'founders@quillstack.example.test', 'Docs-as-code platform for API teams.'),
  ('5a1c0e10-0000-4000-8000-000000000005', 'Harrow Energy', 'harrow.example.test', 'Climate', 'Copenhagen', 'info@harrow.example.test', 'Battery scheduling for small solar farms.'),
  ('5a1c0e10-0000-4000-8000-000000000006', 'Birchline Capital', 'birchline.example.test', 'Venture capital', 'London', 'deals@birchline.example.test', 'Seed fund we co-invest with.');

INSERT INTO contacts (id, first_name, last_name, email, phone, company_id, title, status) VALUES
  ('c0a7ac70-0000-4000-8000-000000000001', 'Maya', 'Lindqvist', 'maya@tidewater.example.test', '', '5a1c0e10-0000-4000-8000-000000000001', 'CEO & co-founder', 'founder'),
  ('c0a7ac70-0000-4000-8000-000000000002', 'Tomas', 'Okafor', 'tomas@tidewater.example.test', '', '5a1c0e10-0000-4000-8000-000000000001', 'CTO & co-founder', 'founder'),
  ('c0a7ac70-0000-4000-8000-000000000003', 'Priya', 'Raman', 'priya@lumenhealth.example.test', '', '5a1c0e10-0000-4000-8000-000000000002', 'CEO & founder', 'founder'),
  ('c0a7ac70-0000-4000-8000-000000000004', 'Jonas', 'Weber', 'jonas@fernway.example.test', '', '5a1c0e10-0000-4000-8000-000000000003', 'Founder', 'founder'),
  ('c0a7ac70-0000-4000-8000-000000000005', 'Elena', 'Costa', 'elena@quillstack.example.test', '', '5a1c0e10-0000-4000-8000-000000000004', 'CEO & co-founder', 'founder'),
  ('c0a7ac70-0000-4000-8000-000000000006', 'Sofie', 'Dahl', 'sofie@harrow.example.test', '', '5a1c0e10-0000-4000-8000-000000000005', 'Founder', 'founder'),
  ('c0a7ac70-0000-4000-8000-000000000007', 'Oliver', 'Grant', 'oliver@birchline.example.test', '', '5a1c0e10-0000-4000-8000-000000000006', 'Partner', 'investor'),
  ('c0a7ac70-0000-4000-8000-000000000008', 'Hana', 'Sato', 'hana.sato@example.test', '', NULL, 'Family office principal', 'lp'),
  ('c0a7ac70-0000-4000-8000-000000000009', 'Rafael', 'Mendes', 'rafael.mendes@example.test', '', NULL, 'Former VP Operations', 'operator'),
  ('c0a7ac70-0000-4000-8000-000000000010', 'Ines', 'Moreau', 'ines.moreau@example.test', '', NULL, 'Angel investor', 'investor');

INSERT INTO deals (id, name, contact_id, value, stage, round, valuation, source_contact_id, pass_reason, close_date, notes) VALUES
  ('dea10000-0000-4000-8000-000000000001', 'Tidewater Robotics — Seed', 'c0a7ac70-0000-4000-8000-000000000001', 750000, 'diligence', 'Seed', 9000000, 'c0a7ac70-0000-4000-8000-000000000009', '', date('now', '+21 days'), 'Customer calls booked with two 3PLs.'),
  ('dea10000-0000-4000-8000-000000000002', 'Lumen Health — Series A', 'c0a7ac70-0000-4000-8000-000000000003', 1500000, 'term_sheet', 'Series A', 32000000, 'c0a7ac70-0000-4000-8000-000000000007', '', date('now', '+10 days'), 'Birchline leads; we take the remaining allocation.'),
  ('dea10000-0000-4000-8000-000000000003', 'Fernway Logistics — Pre-seed', 'c0a7ac70-0000-4000-8000-000000000004', 250000, 'screening', 'Pre-seed', 4000000, NULL, '', '', 'Inbound via the website form.'),
  ('dea10000-0000-4000-8000-000000000004', 'Quillstack — Seed', 'c0a7ac70-0000-4000-8000-000000000005', 600000, 'partner_meeting', 'Seed', 12000000, 'c0a7ac70-0000-4000-8000-000000000010', '', date('now', '+30 days'), 'Partner meeting next Tuesday.'),
  ('dea10000-0000-4000-8000-000000000005', 'Harrow Energy — Seed', 'c0a7ac70-0000-4000-8000-000000000006', 500000, 'sourced', 'Seed', 0, 'c0a7ac70-0000-4000-8000-000000000008', '', '', 'Intro from Hana, not yet contacted.'),
  ('dea10000-0000-4000-8000-000000000006', 'Tidewater Robotics — Pre-seed', 'c0a7ac70-0000-4000-8000-000000000002', 200000, 'invested', 'Pre-seed', 3000000, 'c0a7ac70-0000-4000-8000-000000000009', '', date('now', '-240 days'), 'First cheque in the company.'),
  ('dea10000-0000-4000-8000-000000000007', 'Lumen Health — Seed', 'c0a7ac70-0000-4000-8000-000000000003', 400000, 'passed', 'Seed', 10000000, NULL, 'Too early on clinical validation', date('now', '-400 days'), 'Revisit at Series A.');

INSERT INTO activities (id, entity_type, entity_id, type, body, meta, created_at) VALUES
  ('ac710000-0000-4000-8000-000000000001', 'contact', 'c0a7ac70-0000-4000-8000-000000000001', 'note', 'Strong demo. Asked for pilot contracts before the partner meeting.', '{}', datetime('now', '-6 days')),
  ('ac710000-0000-4000-8000-000000000002', 'contact', 'c0a7ac70-0000-4000-8000-000000000001', 'meeting', 'Diligence call with Maya', '{"start":"2026-09-02T10:00:00","timezone":"Europe/Amsterdam"}', datetime('now', '-3 days')),
  ('ac710000-0000-4000-8000-000000000003', 'contact', 'c0a7ac70-0000-4000-8000-000000000003', 'email', 'Term sheet draft', '{"to":"priya@lumenhealth.example.test"}', datetime('now', '-2 days')),
  ('ac710000-0000-4000-8000-000000000004', 'contact', 'c0a7ac70-0000-4000-8000-000000000005', 'note', 'Met at a developer meetup; growing through open-source adoption.', '{}', datetime('now', '-9 days')),
  ('ac710000-0000-4000-8000-000000000005', 'deal', 'dea10000-0000-4000-8000-000000000006', 'stage_change', 'Investment closed — Invested', '{"stage":"invested","value":200000}', datetime('now', '-240 days')),
  ('ac710000-0000-4000-8000-000000000006', 'deal', 'dea10000-0000-4000-8000-000000000007', 'stage_change', 'Passed — Too early on clinical validation', '{"stage":"passed","pass_reason":"Too early on clinical validation"}', datetime('now', '-400 days')),
  ('ac710000-0000-4000-8000-000000000007', 'company', '5a1c0e10-0000-4000-8000-000000000002', 'note', 'Birchline shared their Series A memo.', '{}', datetime('now', '-4 days'));

INSERT INTO relationships (id, contact_id, knows_contact_id, strength, context) VALUES
  ('4e1a0000-0000-4000-8000-000000000001', 'c0a7ac70-0000-4000-8000-000000000009', 'c0a7ac70-0000-4000-8000-000000000001', 'strong', 'Worked together at a logistics company'),
  ('4e1a0000-0000-4000-8000-000000000002', 'c0a7ac70-0000-4000-8000-000000000001', 'c0a7ac70-0000-4000-8000-000000000009', 'strong', 'Worked together at a logistics company'),
  ('4e1a0000-0000-4000-8000-000000000003', 'c0a7ac70-0000-4000-8000-000000000007', 'c0a7ac70-0000-4000-8000-000000000003', 'strong', 'Birchline board observer'),
  ('4e1a0000-0000-4000-8000-000000000004', 'c0a7ac70-0000-4000-8000-000000000010', 'c0a7ac70-0000-4000-8000-000000000005', 'medium', 'Angel in the pre-seed round'),
  ('4e1a0000-0000-4000-8000-000000000005', 'c0a7ac70-0000-4000-8000-000000000008', 'c0a7ac70-0000-4000-8000-000000000006', 'weak', 'Met at a climate conference'),
  ('4e1a0000-0000-4000-8000-000000000006', 'c0a7ac70-0000-4000-8000-000000000007', 'c0a7ac70-0000-4000-8000-000000000010', 'medium', 'Co-invested twice');
