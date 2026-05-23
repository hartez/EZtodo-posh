---
document type: cmdlet
external help file: EZtodo_posh.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: EZtodo
ms.date: 05/19/2026
PlatyPS schema version: 2024-05-01
title: Remove-TaskPriority
---

# Remove-TaskPriority

## SYNOPSIS

Clears the priority setting from a task.

## SYNTAX

### __AllParameterSets

```
Remove-TaskPriority [-SourcePath] <string> [-Number] <int> [<CommonParameters>]
```

## DESCRIPTION

Clears the priority setting from the specified task. Has no effect if the task has no priority set.

## EXAMPLES

### Example 1 - Clear the priority value from a task

```powershell
Remove-TaskPriority ./todo.txt 2 
```

## PARAMETERS

### -Number

The line number of the target task.

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

### System.Int32

The line number of a task to clear the priority from.

## OUTPUTS

## NOTES

## RELATED LINKS

