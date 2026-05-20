Write-Host "Converting markdown help files to MAML..."

Get-ChildItem .\EZtodo\docs\EZtodo\*.md 
| Select-String -Pattern "{{.*}}" 
| Select-Object @{n = 'Severity'; e = { 'Warning' } }, @{n = 'File'; e = { ".\EZtodo\docs\EZtodo\" + $_.Filename } }, @{n = 'Line'; e = { $_.LineNumber } }, @{n = 'Message'; e = { 'Unfilled template value' } }

$compiledHelp = Measure-PlatyPSMarkdown -Path .\EZtodo\docs\EZtodo\*.md 
| Where-Object FileType -match 'CommandHelp' 
| Import-MarkdownCommandHelp -Path { $_.FilePath } 

$compiledHelp 
| ForEach-Object { $title = $_.Title; $_.Diagnostics.Messages | Add-Member -Force -NotePropertyMembers @{'File' = ".\EZtodo\docs\EZtodo\$title.md" } -PassThru 
    | Select-Object Severity, File, Line, Message } 
| Where-Object { $_.Severity -match 'Error' -or $_.Severity -match 'Warning' }

$compiledHelp | Export-MamlCommandHelp -OutputFolder .\EZtodo\maml -Force

Move-Item .\EZtodo\maml\EZtodo\EZtodo_posh.dll-Help.xml .\EZtodo\en-us\EZtodo_posh.dll-Help.xml -Force
Remove-Item .\EZtodo\maml\ -Force -Recurse

