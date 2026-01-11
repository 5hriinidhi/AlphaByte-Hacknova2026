# SaralClass Adaptive Learning Platform

A comprehensive adaptive learning platform that morphs based on students' disability profiles, providing personalized accessibility features and AI-powered learning support.

## Features

### 1. Kiosk Login System
- Students log in using their roll number
- Automatically loads personalized accessibility settings
- Interface "morphs" based on disability profile

### 2. Unified Profile Dashboard
- Learning Health Record with comprehension, engagement, and confusion metrics
- Recent classroom feedback display
- AI-generated remedial assignments
- Visual indicators for accessibility profiles

### 3. Disability-Specific UI Features

#### Visually Impaired
- **Semantic Reader**: Text-to-speech with adjustable speed
- **AI Image Descriptions**: Simulated Gemini Vision integration
- **Braille Input Support**: Ready for physical Braille BoxX integration

#### Hearing Impaired
- **Live Captions**: Real-time text for audio content
- **Emotion Tags**: AI-driven tone/emotion labels

#### ADHD
- **Focus Tunnel**: Dims everything except primary content
- **Bionic Reading**: Highlights word parts to guide reading
- **AI Summaries**: Condensed versions of long texts

#### Motor Disabilities
- **Voice Navigation**: Speech-to-text control (simulated)
- **Big-Click Zones**: Enlarged interactive elements

### 4. Adaptive Browser Extension (Global Toolbar)
- Toggle accessibility features on/off
- Adjust font size globally
- Change contrast modes
- Settings persist in database

### 5. Uni-Buddy AI Assistant
- Conversational AI support
- Adapts responses based on disability profile
- Provides automated assignment suggestions
- Always accessible via floating chat widget

## Database Schema

The platform uses Supabase with the following tables:
- `students` - Student profiles and login data
- `disability_profiles` - Student disability configurations
- `accessibility_settings` - Feature toggles and preferences
- `learning_health_records` - Performance metrics over time
- `classroom_feedback` - Real-time feedback from classes
- `remedial_assignments` - AI-generated practice tasks

## Getting Started

### Prerequisites
- Node.js 18+
- Supabase account (already configured)

### Setup

1. Install dependencies:
```bash
npm install
```

2. The Supabase database is already configured with all necessary tables and Row Level Security policies.


4. Start the development server (automatically started):
```bash
npm run dev
```

5. Build for production:
```bash
npm run build
```

## Usage

1. Open the application
2. Enter roll number: `2024001`
3. The interface will automatically adapt based on the student's disability profile
4. Explore the Dashboard to see learning metrics
5. Navigate to "Learning Content" to see adaptive features in action
6. Use the Adaptive Toolbar to toggle features
7. Click Uni-Buddy to interact with the AI assistant

## Architecture

- **Frontend**: React + TypeScript + Vite
- **Styling**: Tailwind CSS
- **Database**: Supabase (PostgreSQL)
- **Icons**: Lucide React
- **Authentication**: Custom roll-number-based (non-Supabase Auth)

## more enhancements in extension Enhancements

- Real Gemini Vision API integration for image descriptions
- Web Speech API implementation for voice navigation
- Real-time AI conversation with LLM backend
- Braille BoxX hardware integration
- Live classroom monitoring and feedback collection
- Advanced analytics dashboard for educators
- Multi-language support
