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

Gets the tasks from the specified task list file, filtered by the specified search term.

## SYNTAX

### __AllParameterSets

```
Get-Task [-SourcePath] <string> [[-SearchTerm] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

{{ Fill in the Description }}

## EXAMPLES

### Example 1

```powershell
Get-Task .\todo.txt
```

```Output
1 (A) Call Mom @Phone +Family
2 (A) Schedule annual checkup +Health
3 (B) Outline chapter 5 +Novel @Computer
4 (C) Add cover sheets @Office +TPSReports
5 Plan backyard herb garden @Home
6 Pick up milk @GroceryStore
7 Research self-publishing services +Novel @Computer
8 x Download Todo.txt mobile app @Phone
```

### Example 2

```powershell
Get-Task .\todo.txt "computer"
```

```Output
3 (B) Outline chapter 5 +Novel @Computer
7 Research self-publishing services +Novel @Computer
```

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

{{ Fill in the Notes }}

## RELATED LINKS

{{ Fill in the related links here }}



