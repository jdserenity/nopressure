# NoPressure Architecture

## Product Intent
- Build an iOS-first dating app that drives real-life meetups instead of endless in-app engagement
- MVP success metric: prove strangers meet in person more often than in traditional swipe-first apps
- Product tone: low-pressure, playful, socially healthy, intentional, optimistic

## Core Behavioral Rules (MVP, Non-Optional)
- No swiping or likes; users are directly sent matches
- Maximum 3 active matches per user at any time
- Every match expires exactly 7 days after creation
- Matching is local only
- Expired match pairs are blocked from immediate rematching (cooldown is required)
- Inactive users are disabled/removed from the ecosystem
- Accounts disabled for inactivity are not reactivated at this stage
- Meetup verification requires mutual confirmation from both users

## MVP Feature Scope
- Authentication: Sign in with Apple and simple onboarding
- Profiles: first name, age, gender, interested in, short bio, up to 4 photos, approximate location
- Matching: enforce 3 active matches, 7-day expiration, replacement logic, local constraints
- Chat: simple 1-to-1 messaging with focus on moving users toward real-life interaction
- Trust and safety: reporting, blocking, banning, and report review
- Meetup verification: simple mutually confirmed meetup state

## Trust and Safety Direction
- 18+ only
- iOS-only launch posture
- Anti-abuse direction includes Apple App Attest and DeviceCheck
- No manual photo pre-approval gate before profile usage
- Blocking must prevent future rematching

## Monetization and Access (MVP)
- Not subscription-first
- Women use the app for free
- Men access via either:
  - one-time USD 5 entry payment, or
  - referral from a woman
- Each woman gets one referral
- Contextual beauty/fashion/date-prep advertising aimed at women is part of current monetization direction

## Technical Stack
- Frontend: Swift + SwiftUI (native iOS only)
- Backend: Supabase (PostgreSQL, Auth, Storage, Realtime where useful)
- App architecture: pragmatic MVVM
- Priorities: fast iteration, clean readable code, minimal unnecessary abstraction
- Offline support is out of scope for MVP

## Product Non-Goals
- Endless browsing
- Passive validation loops
- Match hoarding
- Engagement-maximized addictive mechanics
- Long parasocial texting as the primary product behavior
