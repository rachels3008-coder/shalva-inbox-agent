# SharePoint lists – Shalva's database

Creating the lists by hand? Use the names below exactly. Column types are SharePoint types.

- **Text** = single line of text
- **Note** = multiple lines of text (plain)
- **URL** = hyperlink

## ShalvaTasks
Open tasks; this is the dashboard's main table.
- Title renamed to **Subject**.

| Column | Type |
|---|---|
| Priority | Choice: 1 Urgent, 2 Today, 3 This week, 4 To check, 6 Waiting |
| Client | Text |
| Sender | Text |
| Action | Note |
| ConversationId | Text |
| MessageId | Note |
| EmailLink | URL |
| DraftLink | URL |
| SessionLink | URL |
| BlockStart | Date/time |
| BlockLink | URL |
| ReceivedAt | Date/time |

## ShalvaArchive
Every email that was filed with no action, with a one-line summary.
- Title renamed to **Subject**.

| Column | Type |
|---|---|
| Client | Text |
| Folder | Text |
| Sender | Text |
| Summary | Note |
| ConversationId | Text |
| ReceivedAt | Date/time |
| ArchivedAt | Date/time |
| EmailLink | URL |

## ShalvaDrafts
Every draft Shalva created and what happened to it.
- Title renamed to **Subject**.

| Column | Type |
|---|---|
| Recipient | Text |
| Kind | Choice: reply, followup, session |
| Lang | Text |
| ConversationId | Text |
| DraftMessageId | Note |
| CreatedAt | Date/time |
| DraftText | Note |
| RuleIds | Text |
| Outcome | Choice: pending, as_is, edited, rewritten, unsent |
| Similarity | Number |
| Changes | Note |
| CheckedAt | Date/time |
| SentAt | Date/time |
| EmailLink | URL |
| SentLink | URL |

## ShalvaRules
Rules Shalva learned from your edits.
- Title renamed to **Rule**.
- Disable or enable a rule with the button in the Status column.

| Column | Type |
|---|---|
| Slug | Text |
| RuleType | Text |
| Scope | Text |
| Evidence | Number |
| Examples | Note |
| Status | Choice: active, disabled |
| ChangedBy | Choice: shalva, user |
| InProfile | Yes/No |

## ShalvaRuns
One item per run.
- Title renamed to **RunAt**.

| Column | Type |
|---|---|
| Scanned | Number |
| Filed | Number |
| Noise | Number |
| DraftsCreated | Number |
| OpenTasks | Number |
| RemainingInbox | Number |
| RulesPending | Number |
| NextRun | Text |
| Notes | Note |

## ShalvaBlocks
Focus blocks on the calendar.
- Title stays **Title**.

| Column | Type |
|---|---|
| EventId | Note |
| Start | Date/time |
| End | Date/time |
| Tasks | Note |
| EventLink | URL |

## ShalvaSessions
Complex emails. A new item starts a deep-draft run.
- Title renamed to **Subject**.

| Column | Type |
|---|---|
| ConversationId | Text |
| Request | Note |
| Status | Choice: in progress, ready, failed |
| DraftLink | URL |
| Documents | Note |
| Summary | Note |
