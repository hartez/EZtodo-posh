---
document type: cmdlet
external help file: EZtodo_posh.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: EZtodo
ms.date: 05/19/2026
PlatyPS schema version: 2024-05-01
title: Add-Task
---

# Add-Task

## SYNOPSIS

Adds a new task to the task file.

## SYNTAX

### __AllParameterSets

```
Add-Task [-SourcePath] <string> [-Task] <string> [-EnsureCreatedDate] [<CommonParameters>]
```

## DESCRIPTION

Appends a new task to the end of the specified task file. The -EnsureCreatedDate flag will insert today's date as the created date of the task if one is not specified in the task text.

## EXAMPLES

### Example 1

Add-Task .\todo.txt "Bring in the garbage cans"

## PARAMETERS

### -EnsureCreatedDate

If set, today's date will be inserted as the created date of the task if it is not specified in the task text.

```yaml
Type: System.Management.Automation.SwitchParameter
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: Named
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

### -Task

The task string to add. 

```yaml
Type: System.String
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

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String

A string representing a todo.txt task.

## OUTPUTS

## NOTES

## RELATED LINKS

- [Task format rules](https://github.com/todotxt/todo.txt#todotxt-format-rules)

