# Shalva for Copilot – creates the SharePoint lists that act as Shalva's database and dashboard.
# Requires PnP.PowerShell 2.x and an Entra app registration (ClientId) that your tenant allows for PnP.
# If you can't run PowerShell, create the lists by hand from lists-schema.md – same names, same columns.
#
# Usage:
#   Install-Module PnP.PowerShell -Scope CurrentUser
#   ./create-lists.ps1 -SiteUrl "https://<tenant>.sharepoint.com/sites/<your-site>" -ClientId "<app-id>"

param(
  [Parameter(Mandatory)] [string] $SiteUrl,
  [Parameter(Mandatory)] [string] $ClientId
)

Connect-PnPOnline -Url $SiteUrl -Interactive -ClientId $ClientId

function New-ShalvaList($Name, $TitleName, $Fields) {
  if (-not (Get-PnPList -Identity $Name -ErrorAction SilentlyContinue)) {
    New-PnPList -Title $Name -Template GenericList -OnQuickLaunch | Out-Null
  }
  Set-PnPField -List $Name -Identity "Title" -Values @{ Title = $TitleName } | Out-Null
  foreach ($f in $Fields) {
    if (Get-PnPField -List $Name -Identity $f.Name -ErrorAction SilentlyContinue) { continue }
    $p = @{ List = $Name; DisplayName = $f.Name; InternalName = $f.Name; Type = $f.Type; AddToDefaultView = $true }
    if ($f.Choices) { $p.Choices = $f.Choices }
    Add-PnPField @p | Out-Null
  }
  Write-Host "✓ $Name"
}

$priority = "1 Urgent","2 Today","3 This week","4 To check","6 Waiting"

New-ShalvaList "ShalvaTasks" "Subject" @(
  @{Name="Priority";Type="Choice";Choices=$priority},
  @{Name="Client";Type="Text"}, @{Name="Sender";Type="Text"},
  @{Name="Action";Type="Note"}, @{Name="ConversationId";Type="Text"}, @{Name="MessageId";Type="Note"},
  @{Name="EmailLink";Type="URL"}, @{Name="DraftLink";Type="URL"}, @{Name="SessionLink";Type="URL"},
  @{Name="BlockStart";Type="DateTime"}, @{Name="BlockLink";Type="URL"}, @{Name="ReceivedAt";Type="DateTime"}
)

New-ShalvaList "ShalvaArchive" "Subject" @(
  @{Name="Client";Type="Text"}, @{Name="Folder";Type="Text"}, @{Name="Sender";Type="Text"},
  @{Name="Summary";Type="Note"}, @{Name="ConversationId";Type="Text"},
  @{Name="ReceivedAt";Type="DateTime"}, @{Name="ArchivedAt";Type="DateTime"}, @{Name="EmailLink";Type="URL"}
)

New-ShalvaList "ShalvaDrafts" "Subject" @(
  @{Name="Recipient";Type="Text"}, @{Name="Kind";Type="Choice";Choices="reply","followup","session"},
  @{Name="Lang";Type="Text"}, @{Name="ConversationId";Type="Text"}, @{Name="DraftMessageId";Type="Note"},
  @{Name="CreatedAt";Type="DateTime"}, @{Name="DraftText";Type="Note"}, @{Name="RuleIds";Type="Text"},
  @{Name="Outcome";Type="Choice";Choices="pending","as_is","edited","rewritten","unsent"},
  @{Name="Similarity";Type="Number"}, @{Name="Changes";Type="Note"},
  @{Name="CheckedAt";Type="DateTime"}, @{Name="SentAt";Type="DateTime"},
  @{Name="EmailLink";Type="URL"}, @{Name="SentLink";Type="URL"}
)

New-ShalvaList "ShalvaRules" "Rule" @(
  @{Name="Slug";Type="Text"}, @{Name="RuleType";Type="Text"}, @{Name="Scope";Type="Text"},
  @{Name="Evidence";Type="Number"}, @{Name="Examples";Type="Note"},
  @{Name="Status";Type="Choice";Choices="active","disabled"},
  @{Name="ChangedBy";Type="Choice";Choices="shalva","user"}, @{Name="InProfile";Type="Boolean"}
)

New-ShalvaList "ShalvaRuns" "RunAt" @(
  @{Name="Scanned";Type="Number"}, @{Name="Filed";Type="Number"}, @{Name="Noise";Type="Number"},
  @{Name="DraftsCreated";Type="Number"}, @{Name="OpenTasks";Type="Number"},
  @{Name="RemainingInbox";Type="Number"}, @{Name="RulesPending";Type="Number"},
  @{Name="NextRun";Type="Text"}, @{Name="Notes";Type="Note"}
)

New-ShalvaList "ShalvaBlocks" "Title" @(
  @{Name="EventId";Type="Note"}, @{Name="Start";Type="DateTime"}, @{Name="End";Type="DateTime"},
  @{Name="Tasks";Type="Note"}, @{Name="EventLink";Type="URL"}
)

New-ShalvaList "ShalvaSessions" "Subject" @(
  @{Name="ConversationId";Type="Text"}, @{Name="Request";Type="Note"},
  @{Name="Status";Type="Choice";Choices="in progress","ready","failed"},
  @{Name="DraftLink";Type="URL"}, @{Name="Documents";Type="Note"}, @{Name="Summary";Type="Note"}
)

Write-Host "Done. Next: apply the JSON formatting in ./formatting and build the dashboard page (BUILD-GUIDE)."
