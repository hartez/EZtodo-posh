---
document type: cmdlet
external help file: EZtodo_posh.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: EZtodo
ms.date: 05/19/2026
PlatyPS schema version: 2024-05-01
title: Get-Project
---

# Get-Project

## SYNOPSIS

List all of the projects in the task file.

## SYNTAX

### __AllParameterSets

```
Get-Project [-SourcePath] <string> [<CommonParameters>]
```

## DESCRIPTION

Lists all the projects in all of the tasks in the task file. The list is ordered alphabetically, and all projects are prefixed with "+".

## EXAMPLES

### Example 1

```powershell
Get-Project ./todo.txt
```

## PARAMETERS

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

### System.String

A string representing a project.

## NOTES

## RELATED LINKS

