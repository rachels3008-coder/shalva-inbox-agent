# SHALVA-PLAYBOOK (knowledge file)

Full procedures for Shalva. The agent instructions say WHEN; this file says HOW.

## 1. SETUP (run once, in chat, when the owner types "setup")
1. **Language first.** Ask: "Which language should I use with you?" (Hebrew / English / other). Use it for everything you write to the owner from now on: chat, lists, summary email, focus-block titles. Replies to other people stay in the language of the incoming email.
2. **One question block:** work days and hours, time zone, autonomy (default: drafts + automatic filing), focus blocks allowed (default yes, up to 3 a day), what to do with the existing inbox (default: triage everything, oldest last).
3. **Inbox size:** Get emails on Inbox to estimate the backlog. Tell the owner the number and the expected number of runs.
4. **Style learning:** read 100–200 emails from Sent Items to real people (skip auto-replies, no-reply addresses, emails to self, system mail). Separate the owner's text from the quoted thread. Extract per email: incoming language and reply language, recipient type (client / colleague / supplier / abroad), intent, opening, sign-off, length, recurring phrases, how they schedule, decline and ask for documents. Summarize; never store full texts.
5. **Filing map:** look at existing folders and 20–30 emails per folder. Map domain → folder. Shared senders (banks, payment providers, accountant, payroll) are filed by the client mentioned in the email or in CC; ask the owner before deciding. Suggest Outlook rules for noise senders, with exact conditions.
6. **Check the setup the owner did** (see BUILD-GUIDE): categories "Shalva 1 Urgent", "Shalva 2 Today", "Shalva 3 This week", "Shalva 4 To check", "Shalva 5 Draft ready", "Shalva 6 Waiting"; the SharePoint lists; the tools. Report anything missing.
7. **Old drafts:** list the owner's existing drafts as already sent / empty / replaced / old / relevant. Recommend which to delete; you never delete them yourself.
8. **Output STYLE-PROFILE** as one block using the template, and tell the owner to replace the STYLE-PROFILE knowledge file with it.

## 2. Priority criteria
- **1 Urgent:** deadline today or tomorrow, money or payment, legal, a client waiting 3+ days, a manager asking.
- **2 Today:** a client question you can answer, meeting scheduling, a document request with a near date.
- **3 This week:** everything else that needs the owner.
- **4 To check:** older than 60 days and still looks open.
- **6 Waiting:** the owner asked something and is waiting for an answer.

## 3. Check-in drafts to colleagues
When a task depends on someone else (colleague, accountant, supplier):
- New draft to that person: their first name, one sentence on what needs checking, "Done? Let me know.", the owner's sign-off.
- Several topics for the same person go into one draft.
- Add the category "Shalva 5 Draft ready" to the original email.
- Record the draft in ShalvaDrafts with Kind = followup.

## 4. Focus blocks (calendar)
- **Range:** today and the next two work days, within work hours.
- **Free slot:** at least 30 minutes, with a 10-minute buffer from meetings. Use Get events (V4), or Find meeting times (V2) with no attendees.
- **Sizes:**
  - Urgent / Today: 30–60 min, today or tomorrow.
  - This week: 4–6 tasks in one 1-hour block.
  - To check: one weekly block.
- **Limits:** max 3 blocks and 2.5 hours a day. Show as Busy, no attendees, no reminders to others.
- **Content:** title "Shalva | <topic>"; body lists the tasks with links.
- **Cleanup:** delete a Shalva block only if all its tasks are done and it hasn't started. Never create duplicate blocks.
- **Record:** ShalvaBlocks item, and set BlockStart and BlockLink on each task.

## 5. Learning from drafts (start of every run)
For each ShalvaDrafts item with Outcome = pending:
1. **Find what was sent.** Get emails on Sent Items since CreatedAt, matching ConversationId (or recipient + subject for check-ins).
2. **Classify the result:**
   - Draft still exists and nothing sent: stays pending; after 7 days, unsent.
   - Draft gone and nothing sent: unsent.
3. **Clean the sent text** of the quoted thread and full signature.
4. **Similarity:** estimate it carefully as a share of the draft's words kept in the same order, 0–1.
   - 0.95 or more: as_is
   - 0.60–0.95: edited
   - below 0.60: rewritten
5. **Change types** (a list; for each a note and a before/after of up to 80 characters): opening, closing, shorter / longer (below 85% or above 115% of the words), facts, tone, structure, language, recipients, subject.
6. **Update the ShalvaDrafts item:** Outcome, Similarity, Changes, CheckedAt, SentAt, SentLink. Do not store the full sent text.
7. **Turn patterns into rules.** A pattern seen in 2 or more drafts within 60 days becomes a ShalvaRules item:
   - Title: one instruction in the communication language.
   - Fields: Slug, Type, Scope (language, recipient type), Evidence, Examples, Status = active, InProfile = No.
   - It applies from the next draft.
   - A rule the owner disabled is never re-enabled.
   - A rule the owner reverted twice becomes disabled.
   - Facts changes are not style rules, only insights.
8. **Report pending rules.** The summary email says how many active rules have InProfile = No. When the owner chats with you, offer the updated "Learned rules" block for STYLE-PROFILE; after they replace the file, set InProfile = Yes.

## 6. Links
- **Email:** use the web link returned by the tool. If there isn't one, use `https://outlook.office.com/mail/deeplink/read/<URL-encoded message id>`.
- **Event:** use the event's web link.
- **List item:** use the item's URL.

## 7. Summary email
Use the SUMMARY-EMAIL template. Sections, in order:
1. Header metrics: scanned · filed · drafts · open · in inbox.
2. Open tasks table, sorted by priority.
3. Focus blocks.
4. Deep-draft sessions.
5. Check-ins to colleagues.
6. Waiting for reply.
7. What was done.
8. Filed:
   - Grouped by client: "Sender · Subject – summary", with a link.
   - Up to 25 lines, then "+N more – in the ShalvaArchive list".
   - Noise as one count line.
9. Learning from drafts: one line with checked · as is · edited · rewritten, plus new rules and how many are pending in the profile.
10. Insights: 3–5 points.
11. Footer: backlog, calendar status, next run, link to the dashboard page.

**Formatting:**
- Text at least 14px.
- One table.
- Short lines.
- No big cards.
