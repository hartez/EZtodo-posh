---
document type: cmdlet
external help file: EZtodo_posh.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: EZtodo
ms.date: 05/19/2026
PlatyPS schema version: 2024-05-01
title: Set-TaskPending
---

# Set-TaskPending

## SYNOPSIS

Marks a completed task as pending.

## SYNTAX

### __AllParameterSets

```
Set-TaskPending [-SourcePath] <string> [-Number] <int> [<CommonParameters>]
```

## DESCRIPTION

Marks a completed task as pending. Has no effect if the target task is not marked as complete. Any previous completed date for the task will be cleared.

This is the inverse of Set-TaskComplete, and is mostly useful when you accidentally mark a task complete before you intend to. 

## EXAMPLES

### Example 1

```powershell
 Set-TaskPending ./todo.txt 8
```

## PARAMETERS

### -Number

The line number of the completed task to mark as 'pending'.

```yaml
Type: System.Int32
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: true
  ValueFromPipeline: true
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -SourcePath

The source task list file.

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

### System.Int32

The line number of a completed task to mark as pending.

## OUTPUTS

## NOTES

## RELATED LINKS

