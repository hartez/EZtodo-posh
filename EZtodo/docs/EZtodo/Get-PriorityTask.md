---
document type: cmdlet
external help file: EZtodo_posh.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: EZtodo
ms.date: 05/19/2026
PlatyPS schema version: 2024-05-01
title: Get-PriorityTask
---

# Get-PriorityTask

## SYNOPSIS

Lists all priority tasks in a task file.

## SYNTAX

### __AllParameterSets

```
Get-PriorityTask [-SourcePath] <string> [[-Priority] <char>] [<CommonParameters>]
```

## DESCRIPTION

Lists all tasks in a task file which have a priority set. If a priority value is specified, lists only tasks which match that priority. If no value is specified, lists all prioritized tasks in order of priority.

## EXAMPLES

### Example 1 - List all prioritized tasks

```powershell
Get-PriorityTask ./todo.txt
```

### Example 2 - List all tasks with priority 'B'

```powershell
Get-PriorityTask ./todo.txt B
```

## PARAMETERS

### -Priority

If set, the resulting list will only contain tasks matching this priority. Acceptable values are `A-Z`.

```yaml
Type: System.Nullable`1[System.Char]
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SourcePath

The source task list.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### EZtodo.NumberedTask

An object containing a task and its line number in the source task file.

## NOTES

## RELATED LINKS

