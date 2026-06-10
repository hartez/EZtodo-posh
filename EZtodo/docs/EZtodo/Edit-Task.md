---
document type: cmdlet
external help file: EZtodo_posh.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: EZtodo
ms.date: 05/19/2026
PlatyPS schema version: 2024-05-01
title: Edit-Task
---

# Edit-Task

## SYNOPSIS

Modifies the body text of a task. 

## SYNTAX

### Append

```
Edit-Task [-SourcePath] <string> [-Number] <int> [-Append] <string> [<CommonParameters>]
```

### Prepend

```
Edit-Task [-SourcePath] <string> [-Number] <int> [-Prepend] <string> [<CommonParameters>]
```

### Replace

```
Edit-Task [-SourcePath] <string> [-Number] <int> [-Replace] <string> [-ReplaceWith] <string>
 [<CommonParameters>]
```

## DESCRIPTION

Modifies the body text of a task by appending, prepending, or replacing text. If replace is specified, all instances of the search text are replaced.

Only the body text of the task is modified; this command does not affect priorties, created dates, or completed dates. This command does not affect task completion.

## EXAMPLES

### Example 1 - Append text to a task

```powershell
Edit-Task ./todo.txt 6 -Append " (two gallons)" 
```

### Example 2 - Add text to the beginning of a task

```powershell
Edit-Task ./todo.txt 2 -Prepend "Call to "
```

### Example 3 - Replace text in a task

```powershell
Edit-Task ./todo.txt 2 -Replace "annual" -ReplaceWith "biannual" 
```

## PARAMETERS

### -Append

Appends the specified text to the end of the task.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Append
  Position: 2
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Number

The line number of the task to modify.

```yaml
Type: System.Int32
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Append
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Prepend
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Replace
  Position: 1
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Prepend

Prepends the specified text to the beginning of the task.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Prepend
  Position: 2
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -Replace

The text in the task to replace.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Replace
  Position: 2
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -ReplaceWith

The replacement text.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: Replace
  Position: 3
  IsRequired: true
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
- Name: Append
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Prepend
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
- Name: Replace
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

## NOTES

## RELATED LINKS
