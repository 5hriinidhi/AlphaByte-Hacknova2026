-- Sample Data for SaralClass Adaptive Learning Platform
-- Run this SQL in the Supabase SQL Editor to populate test data

-- Sample students
INSERT INTO students (id, roll_number, name, email)
VALUES
  ('00000000-0000-0000-0000-000000000001', '2024001', 'Arjun Sharma', 'arjun@example.com'),
  ('00000000-0000-0000-0000-000000000002', '2024002', 'Priya Patel', 'priya@example.com'),
  ('00000000-0000-0000-0000-000000000003', '2024003', 'Rahul Kumar', 'rahul@example.com'),
  ('00000000-0000-0000-0000-000000000004', '2024004', 'Ananya Singh', 'ananya@example.com')
ON CONFLICT (roll_number) DO NOTHING;

-- Disability profiles for students
INSERT INTO disability_profiles (student_id, disability_type, severity)
VALUES
  -- Arjun: Visually Impaired + ADHD
  ('00000000-0000-0000-0000-000000000001', 'visually_impaired', 'moderate'),
  ('00000000-0000-0000-0000-000000000001', 'adhd', 'mild'),

  -- Priya: Hearing Impaired
  ('00000000-0000-0000-0000-000000000002', 'hearing_impaired', 'moderate'),

  -- Rahul: Motor Disabilities
  ('00000000-0000-0000-0000-000000000003', 'motor_disabilities', 'severe'),

  -- Ananya: ADHD
  ('00000000-0000-0000-0000-000000000004', 'adhd', 'moderate')
ON CONFLICT DO NOTHING;

-- Accessibility settings for each student
INSERT INTO accessibility_settings (
  student_id,
  semantic_reader_enabled,
  ai_image_descriptions_enabled,
  braille_input_enabled,
  live_captions_enabled,
  emotion_tags_enabled,
  focus_tunnel_enabled,
  bionic_reading_enabled,
  ai_summaries_enabled,
  voice_navigation_enabled,
  big_click_zones_enabled,
  font_size,
  contrast_mode
)
VALUES
  -- Arjun: Visually Impaired + ADHD
  ('00000000-0000-0000-0000-000000000001', true, true, true, false, false, true, true, true, false, false, 18, 'high'),

  -- Priya: Hearing Impaired
  ('00000000-0000-0000-0000-000000000002', false, false, false, true, true, false, false, false, false, false, 16, 'normal'),

  -- Rahul: Motor Disabilities
  ('00000000-0000-0000-0000-000000000003', false, false, false, false, false, false, false, false, true, true, 20, 'normal'),

  -- Ananya: ADHD
  ('00000000-0000-0000-0000-000000000004', false, false, false, false, false, true, true, true, false, false, 16, 'normal')
ON CONFLICT (student_id) DO UPDATE SET
  semantic_reader_enabled = EXCLUDED.semantic_reader_enabled,
  ai_image_descriptions_enabled = EXCLUDED.ai_image_descriptions_enabled,
  braille_input_enabled = EXCLUDED.braille_input_enabled,
  live_captions_enabled = EXCLUDED.live_captions_enabled,
  emotion_tags_enabled = EXCLUDED.emotion_tags_enabled,
  focus_tunnel_enabled = EXCLUDED.focus_tunnel_enabled,
  bionic_reading_enabled = EXCLUDED.bionic_reading_enabled,
  ai_summaries_enabled = EXCLUDED.ai_summaries_enabled,
  voice_navigation_enabled = EXCLUDED.voice_navigation_enabled,
  big_click_zones_enabled = EXCLUDED.big_click_zones_enabled,
  font_size = EXCLUDED.font_size,
  contrast_mode = EXCLUDED.contrast_mode;

-- Learning health records
INSERT INTO learning_health_records (student_id, subject, topic, comprehension_score, confusion_level, engagement_score, recorded_at)
VALUES
  -- Arjun's records
  ('00000000-0000-0000-0000-000000000001', 'Mathematics', 'Algebra', 75, 20, 85, NOW() - INTERVAL '5 days'),
  ('00000000-0000-0000-0000-000000000001', 'Science', 'Physics', 65, 35, 70, NOW() - INTERVAL '4 days'),
  ('00000000-0000-0000-0000-000000000001', 'History', 'World War II', 80, 15, 90, NOW() - INTERVAL '3 days'),
  ('00000000-0000-0000-0000-000000000001', 'Mathematics', 'Geometry', 70, 25, 80, NOW() - INTERVAL '2 days'),
  ('00000000-0000-0000-0000-000000000001', 'English', 'Literature', 85, 10, 95, NOW() - INTERVAL '1 day'),

  -- Priya's records
  ('00000000-0000-0000-0000-000000000002', 'Mathematics', 'Calculus', 90, 5, 95, NOW() - INTERVAL '3 days'),
  ('00000000-0000-0000-0000-000000000002', 'Science', 'Chemistry', 85, 10, 90, NOW() - INTERVAL '2 days'),
  ('00000000-0000-0000-0000-000000000002', 'Computer Science', 'Programming', 95, 3, 98, NOW() - INTERVAL '1 day'),

  -- Rahul's records
  ('00000000-0000-0000-0000-000000000003', 'Mathematics', 'Statistics', 60, 40, 65, NOW() - INTERVAL '4 days'),
  ('00000000-0000-0000-0000-000000000003', 'Science', 'Biology', 70, 25, 75, NOW() - INTERVAL '2 days'),

  -- Ananya's records
  ('00000000-0000-0000-0000-000000000004', 'History', 'Ancient Civilizations', 75, 20, 80, NOW() - INTERVAL '3 days'),
  ('00000000-0000-0000-0000-000000000004', 'Geography', 'Climate Change', 80, 15, 85, NOW() - INTERVAL '1 day')
ON CONFLICT DO NOTHING;

-- Classroom feedback
INSERT INTO classroom_feedback (student_id, session_id, feedback_type, content, ai_analysis, created_at)
VALUES
  ('00000000-0000-0000-0000-000000000001', 'MATH-101-2024-01', 'confusion', 'Having trouble understanding quadratic equations', '{"sentiment": "confused", "topic": "quadratic equations", "confidence": 0.85}', NOW() - INTERVAL '2 days'),
  ('00000000-0000-0000-0000-000000000001', 'PHYS-201-2024-01', 'question', 'Can you explain Newton''s third law again?', '{"sentiment": "curious", "topic": "Newton''s laws", "confidence": 0.90}', NOW() - INTERVAL '1 day'),
  ('00000000-0000-0000-0000-000000000002', 'CS-301-2024-01', 'engagement', 'This programming concept is really interesting!', '{"sentiment": "positive", "topic": "programming", "confidence": 0.95}', NOW() - INTERVAL '1 day'),
  ('00000000-0000-0000-0000-000000000003', 'MATH-101-2024-02', 'confusion', 'Lost track during the probability section', '{"sentiment": "confused", "topic": "probability", "confidence": 0.80}', NOW() - INTERVAL '3 days'),
  ('00000000-0000-0000-0000-000000000004', 'HIST-101-2024-01', 'question', 'What were the main causes of World War I?', '{"sentiment": "curious", "topic": "World War I", "confidence": 0.88}', NOW() - INTERVAL '2 days')
ON CONFLICT DO NOTHING;

-- Remedial assignments
INSERT INTO remedial_assignments (student_id, title, description, topic, difficulty_level, status, created_at, completed_at, score)
VALUES
  -- Arjun's assignments
  ('00000000-0000-0000-0000-000000000001', 'Algebra Basics Review', 'Complete 10 problems on linear equations to strengthen your understanding of basic algebra concepts.', 'Algebra', 'medium', 'completed', NOW() - INTERVAL '7 days', NOW() - INTERVAL '5 days', 85),
  ('00000000-0000-0000-0000-000000000001', 'Quadratic Equations Practice', 'Work through examples of solving quadratic equations using different methods.', 'Algebra', 'medium', 'in_progress', NOW() - INTERVAL '2 days', NULL, NULL),
  ('00000000-0000-0000-0000-000000000001', 'Physics: Newton''s Laws', 'Interactive exercises to understand the three laws of motion with real-world examples.', 'Physics', 'medium', 'pending', NOW() - INTERVAL '1 day', NULL, NULL),

  -- Priya's assignments
  ('00000000-0000-0000-0000-000000000002', 'Advanced Programming Concepts', 'Deep dive into object-oriented programming with hands-on coding exercises.', 'Programming', 'hard', 'completed', NOW() - INTERVAL '5 days', NOW() - INTERVAL '3 days', 95),
  ('00000000-0000-0000-0000-000000000002', 'Data Structures Challenge', 'Implement various data structures and analyze their time complexity.', 'Computer Science', 'hard', 'pending', NOW(), NULL, NULL),

  -- Rahul's assignments
  ('00000000-0000-0000-0000-000000000003', 'Statistics Fundamentals', 'Learn basic statistical concepts with visual aids and step-by-step examples.', 'Statistics', 'easy', 'in_progress', NOW() - INTERVAL '4 days', NULL, NULL),
  ('00000000-0000-0000-0000-000000000003', 'Biology: Cell Structure', 'Explore cell components with interactive diagrams and voice-guided explanations.', 'Biology', 'medium', 'pending', NOW() - INTERVAL '2 days', NULL, NULL),

  -- Ananya's assignments
  ('00000000-0000-0000-0000-000000000004', 'Ancient Civilizations Summary', 'Short, focused review of major ancient civilizations with key points highlighted.', 'History', 'medium', 'completed', NOW() - INTERVAL '6 days', NOW() - INTERVAL '4 days', 78),
  ('00000000-0000-0000-0000-000000000004', 'Climate Change Overview', 'Bite-sized lessons on climate change causes and effects with visual summaries.', 'Geography', 'medium', 'in_progress', NOW() - INTERVAL '1 day', NULL, NULL)
ON CONFLICT DO NOTHING;

-- Print summary
DO $$
BEGIN
  RAISE NOTICE 'Sample data inserted successfully!';
  RAISE NOTICE 'Test accounts:';
  RAISE NOTICE '  Roll Number: 2024001 (Arjun - Visually Impaired + ADHD)';
  RAISE NOTICE '  Roll Number: 2024002 (Priya - Hearing Impaired)';
  RAISE NOTICE '  Roll Number: 2024003 (Rahul - Motor Disabilities)';
  RAISE NOTICE '  Roll Number: 2024004 (Ananya - ADHD)';
END $$;
