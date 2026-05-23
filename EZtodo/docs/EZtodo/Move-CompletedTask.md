---
document type: cmdlet
external help file: EZtodo_posh.dll-Help.xml
HelpUri: ''
Locale: en-US
Module Name: EZtodo
ms.date: 05/19/2026
PlatyPS schema version: 2024-05-01
title: Move-CompletedTask
---

# Move-CompletedTask

## SYNOPSIS

Move all completed tasks to another task file.

## SYNTAX

### __AllParameterSets

```
Move-CompletedTask [-SourcePath] <string> [-ArchivePath] <string> [-PreserveLineNumbers]
 [<CommonParameters>]
```

## DESCRIPTION

This cmdlet will find all completed tasks in the source file and move them to the destination file. This is typically used for archiving completed tasks to keep an active task list from becoming too large.

## EXAMPLES

### Example 1

```powershell
Move-CompletedTask ./todo.txt ./done.txt 
```

## PARAMETERS

### -ArchivePath

The destination task file to which completed tasks will be moved.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 2
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -PreserveLineNumbers

If set, the lines of the moved tasks will be left blank (rather than deleted) in the source file. This preserves the numbering of the tasks in the file before and after this operation.

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

The source task file.

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

## NOTES

## RELATED LINKS

