# TODO

## Open Decisions / Planned Work (Newest First)
- [ ] Install full Xcode app and point `xcode-select` to it for iOS builds/tests (`/Applications/Xcode.app/Contents/Developer` not present yet)
- [ ] Fix local Apple toolchain setup so `swift test` runs (current `xcrun` SDK lookup failure)
- [ ] Define first launch market (city/country) to lock legal/compliance and moderation defaults
- [ ] Decide MVP orientation scope (all-orientation matching now vs narrower initial scope)
- [ ] Set exact rematch cooldown duration after a match expires
- [ ] Define exact inactivity-disable rule (trigger threshold + enforcement timing)
- [ ] Specify meetup confirmation behavior (confirmation window, timeout behavior, mismatch/dispute behavior)
- [ ] Choose chat backend for MVP (`Sendbird` vs `Stream` vs Supabase-native) and lock initial chat feature scope
- [ ] Define moderation operations workflow for MVP (report triage, ban flow, review ownership)
- [ ] Define local matching boundary and location precision shown to users
- [ ] Specify referral mechanics (issuance flow, redemption flow, anti-abuse constraints)
- [ ] Define iOS USD 5 one-time access purchase implementation details (StoreKit product + entitlement model)
- [ ] Decide whether contextual ads ship in MVP v1 or immediately after core behavior validation
- [x] ~~Lock initial test strategy for implementation kickoff (unit + focused integration tests).~~ (Codex 5.3, 2026-05-08 13:58 UTC-3)
- [x] ~~Break the build into milestone slices and choose the first slice to implement (app shell + initial schema + matching rules module).~~ (Codex 5.3, 2026-05-08 13:58 UTC-3)
