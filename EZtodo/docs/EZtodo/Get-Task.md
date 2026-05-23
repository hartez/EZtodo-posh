---
document type: cmdlet
external help file: EZtodo_posh.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: EZtodo
ms.date: 05/19/2026
PlatyPS schema version: 2024-05-01
title: Get-Task
---

# Get-Task

## SYNOPSIS

Gets the tasks from the specified task file.

## SYNTAX

### __AllParameterSets

```
Get-Task [-SourcePath] <string> [[-SearchTerm] <string>] [<CommonParameters>]
```

## ALIASES

## DESCRIPTION

Gets the tasks from the specified task file. Tasks can be filtered by a search term.

## EXAMPLES

### Example 1 - List all of the tasks in a task file

```powershell
Get-Task .\todo.txt
```

```Output
01 (A) Call Mom @Phone +Family
02 (A) Schedule annual checkup +Health
03 (B) Outline chapter 5 +Novel @Computer
04 (C) Add cover sheets @Office +TPSReports
05 Plan backyard herb garden @Home
06 Pick up milk @GroceryStore
07 Research self-publishing services +Novel @Computer
08 x Download Todo.txt mobile app @Phone
09 Bring in the garbage cans
10 Bring in the garbage cans
```

### Example 2 - List tasks matching a string 

```powershell
Get-Task .\todo.txt "computer"
```

```Output
3 (B) Outline chapter 5 +Novel @Computer
7 Research self-publishing services +Novel @Computer
```

String matching is case-insensitive.

## PARAMETERS

### -SearchTerm

Text to search for. Only tasks which contain the search term text will be returned.

```yaml
Type: System.String
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

The task list file. 

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

Object including the Task and the file line number of the Task.

## NOTES

## RELATED LINKS


