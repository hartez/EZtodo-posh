Write-Host "Converting markdown help files to MAML..."

# Scan for generated "{{fill this out}}" stuff from PlatyPS and emit a warning 
# This'll give us an easy list of all the places we need to fill out help content
Get-ChildItem .\EZtodo\docs\EZtodo\*.md 
| Select-String -Pattern "{{.*}}" 
| Select-Object @{n = 'Severity'; e = { 'Warning' } }, @{n = 'File'; e = { $_.Path } }, @{n = 'Line'; e = { $_.LineNumber } }, @{n = 'Message'; e = { 'Unfilled template value' } }

# Grab the markdown help files and process them so we can see if there are any errors
$compiledHelp = Measure-PlatyPSMarkdown -Path .\EZtodo\docs\EZtodo\*.md 
| Where-Object FileType -match 'CommandHelp' 
| Import-MarkdownCommandHelp -Path { $_.FilePath } 

# Emit errors to the console so we can have VSCode pick them up
# Normally I'd also want warnings, but PlatyPS considers leaving out omittable documentation sections as warnable,
# so unless we want to put dummy text in all the Notes and Related Links sections, we're stuck with just errors.
$compiledHelp 
| ForEach-Object { $_.Diagnostics.Messages | Add-Member -Force -NotePropertyMembers @{'File' = $_.Diagnostics.FileName } -PassThru 
    | Select-Object Severity, File, Line, Message } 
| Where-Object { $_.Severity -match 'Error' } 

# Export to MAML
$compiledHelp | Export-MamlCommandHelp -OutputFolder .\EZtodo\maml -Force -Encoding utf8

# Put this in the correct place for deployment
Move-Item .\EZtodo\maml\EZtodo\EZtodo_posh.dll-Help.xml .\EZtodo\en-us\EZtodo_posh.dll-Help.xml -Force

# Clean up
Remove-Item .\EZtodo\maml\ -Force -Recurse

