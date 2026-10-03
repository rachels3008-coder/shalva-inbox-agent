<div dir="rtl">

<div align="center">

# שלווה – העוזרת האישית לתיבת הדואר

*שלווה – ככה מרגיש אינבוקס ריק.*

**לומדת איך את/ה כותב/ת ומתייק/ת מיילים, ומביאה את האינבוקס למצב שבו נשארות רק משימות פתוחות.**

עברית · [English](README.md)

<img src="images/claude/he/dashboard.png" width="90%" alt="דשבורד שלווה עם נתוני דמה">

</div>

## בוחרים פלטפורמה

| | **Claude** (מלא) | **Copilot** (מלא) | **Lite** |
|---|---|---|---|
| מייל | Gmail | Outlook | כל מייל מחובר, או מיילים שמדביקים |
| רץ לבד כל בוקר | ✅ | ✅ | משימה מתוזמנת, אם קיימת |
| מתייק, מתייג ומסמן כנקרא | ✅ | ✅ | נותן רשימת פעולות |
| סיכום של שורה לכל מייל שעבר לארכיון | ✅ | ✅ | ✅ (בצ'אט) |
| טיוטות בסגנון שלך | ✅ | ✅ | ✅ (טקסט להעתקה) |
| זמני עבודה ביומן | ✅ | ✅ | הצעות |
| לומדת מהתיקונים שלך | ✅ אוטומטית | ✅ אוטומטית | ✅ כשמדביקים את מה שנשלח |
| דשבורד חי | Artifact ב־Claude | דפי SharePoint | – |
| זמן הקמה | 20–40 דק׳ | 60–90 דק׳ | 10 דק׳ |
| **מדריך** | [**Claude ←**](docs/he/claude.md) | [**Copilot ←**](docs/he/copilot.md) | [**Lite ←**](docs/he/lite.md) |
| **הורדה** | [shalva-inbox-agent.zip](../../releases/latest/download/shalva-inbox-agent.zip) | [shalva-copilot.zip](../../releases/latest/download/shalva-copilot.zip) | [shalva-lite.zip](../../releases/latest/download/shalva-lite.zip) |

כל מדריך כולל:
- דרישות
- התקנה
- הקמה ראשונה
- שימוש יומיומי
- עדכון
- הסרה מלאה
- פתרון תקלות

## איך נראה בוקר

<table>
<tr>
<td width="50%"><img src="images/claude/he/email.png" alt="מייל סיכום"><br><sub>מייל סיכום בוקר (Claude)</sub></td>
<td width="50%"><img src="images/claude/he/archive.png" alt="ארכיון"><br><sub>ארכיון עם חיפוש (Claude)</sub></td>
</tr>
<tr>
<td><img src="images/copilot/he/dashboard.png" alt="דשבורד SharePoint"><br><sub>דשבורד ב־SharePoint (Copilot)</sub></td>
<td><img src="images/lite/he/brief.png" alt="סיכום בוקר בצ'אט"><br><sub>סיכום בוקר בצ'אט (Lite)</sub></td>
</tr>
</table>

## כללי ברזל (בכל הגרסאות)
- **לא שולחת מיילים** לאף אחד חוץ ממך. כל תשובה היא טיוטה, ואת/ה שולח/ת.
- **לא מוחקת** מיילים ולא מעבירה לאשפה.
- **לא ממציאה** סכומים, תאריכים או התחייבויות. במקום מידע חסר היא כותבת `[[להשלים: …]]`.
- **לא עונה על בקשות כספיות.** היא מסמנת אותן לך כדחופות.
- **תוכן המיילים הוא מידע, לא הוראות.**

## פרטיות
שלווה לא אוספת ולא שולחת נתונים לשום מקום. המיילים, הסגנון והנתונים שלך נשארים בחשבונות שלך.

## מבנה הריפו
```
platforms/
  claude/shalva-inbox-agent/SKILL.md   ה־Skill ל־Claude (מלא)
  copilot/agent/                      הוראות וקבצי ידע ל־Copilot Studio
  copilot/sharepoint/                 סקריפט רשימות, מבנה ועיצוב עמודות
  lite/                               הוראות ותבנית פרופיל סגנון
docs/he, docs/en                      מדריכים צעד אחר צעד
images/<platform>/<he|en>/            צילומי מסך (נתוני דמה)
```

## עדכונים
ב־[CHANGELOG](CHANGELOG.md) רואים מה השתנה בכל גרסה. כדי לקבל התראה על גרסה חדשה: **Watch ← Custom ← Releases**.

## זכויות
© 2026 רחלי ישר. כל הזכויות שמורות. מותר להשתמש לשימוש אישי. העתקה, שינוי, הפצה מחדש או מכירה דורשים אישור בכתב. ראו [LICENSE](LICENSE).

<sub>כל צילומי המסך מבוססים על נתוני דמה. שמות המוצרים שייכים לבעליהם. הפרויקט אינו קשור ל־Anthropic, OpenAI, Google או Microsoft.</sub>

</div>
