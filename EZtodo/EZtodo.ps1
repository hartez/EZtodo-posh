<# 
.Synopsis
	TODO.TXT Command Line Interface 2.0 for PowerShell

.Description
	The Invoke-TaskCommand function is an entry point for running functions to manipulate a todo.txt file 
	using the same command syntax as todo.sh. This module exports an alias of 'todo' for Invoke-TaskCommand
	to retain the same command structure as todo.sh. 

.Example
	todo list 
	
	List all of the todo items in your todo file. 

.Example
	todo listall 
	
	List all of the items in the todo and done files.

.Example
	todo add "THING I NEED TO DO +project @context"
	
	Adds "THING I NEED TO DO" to your todo.txt file on its own line, 
	assigning it to a project and context. 

.Example 
	todo append 34 "TEXT TO APPEND"

	Adds "TEXT TO APPEND" to the end of the task on line 34.

.Example 
	todo archive 
	
	Moves all done tasks from todo.txt to done.txt.
	
.Example 
	todo del 34 

	Deletes the task on line 34 in todo.txt.

.Example 

	todo del 34 "foo"
	
	Deletes the text "foo" from line 34 in todo.txt
	
.Example 

	todo move 34 .\otherfile.txt
	
	Moves item 34 to otherfile.txt
#>
function todo {
    param()
	
    if (!$configLocation) {
        $configLocation = ($PSScriptRoot + '\todo_cfg.ps1')
    }
	
    LoadConfiguration $configLocation
	
    if ($TODOTXT_VERBOSE) {
        $VerbosePreference = 'Continue'
    }

    $cmd = $args[0]

    if (!$cmd -or $cmd -eq "list" -or $cmd -eq "ls") {
        $todoArgs = @{SourcePath = $TODO_FILE; SearchTerm = JoinArgs $args[1..$args.Length] }
        Get-Task @todoArgs
        return
    }

    if ($cmd -eq "listall" -or $cmd -eq "lsa") {
        $todoArgs = @{SourcePath = $TODO_FILE; SearchTerm = JoinArgs $args[1..$args.Length] }
        $doneArgs = @{SourcePath = $DONE_FILE; SearchTerm = JoinArgs $args[1..$args.Length] }
        Get-Task @todoArgs
        Get-Task @doneArgs
        return
    }

    if ($cmd -eq "listfile" -or $cmd -eq "lf") {
        $todoArgs = @{SourcePath = $args[1]; SearchTerm = JoinArgs $args[2..$args.Length] }
        Get-Task @todoArgs
        return
    }

    if ($cmd -eq "add" -or $cmd -eq "a") {
        $task = JoinArgs $args[1..$args.Length]
        $todoArgs = @{SourcePath = $TODO_FILE; Task = $task; EnsureCreatedDate = $TODOTXT_DATE_ON_ADD }
        Add-Task @todoArgs
        return
    }

    if ($cmd -eq "addm") {
        $todoArgs = @{SourcePath = $TODO_FILE; EnsureCreatedDate = $TODOTXT_DATE_ON_ADD }
        $split = $args[$args.Length - 1].Split([environment]::newline, [StringSplitOptions]'RemoveEmptyEntries')
        $split | Add-Task @todoArgs 
        return
    }
    
    if ($cmd -eq "rm" -or $cmd -eq "del") {
        $todoArgs = @{SourcePath = $TODO_FILE; Confirm = -not $TODOTXT_FORCE; Number = $args[1] }
        Remove-Task @todoArgs
        return
    }
    
    if ($cmd -eq "listproj" -or $cmd -eq "lsprj" ) {
        Get-Project $TODO_FILE
        return
    }
    
    if ($cmd -eq "listcon" -or $cmd -eq "lsc" ) {
        Get-Context $TODO_FILE
        return
    }
    
    if ($cmd -eq "listpri" -or $cmd -eq "lsp") {

        if ($args.Length -gt 1) {
            $todoArgs = @{SourcePath = $TODO_FILE; Priority = JoinArgs $args[1..$args.Length] }
            Get-PriorityTask @todoArgs
        }
        else {
            # No priority to search for, just list them all
            Get-PriorityTask $TODO_FILE
        }
        
        return
    }	
    
    if ($cmd -eq "replace") {
        Set-Task $args[1] ([String]::Join(" ", $args[2..$args.Length]))
    }
    elseif ($cmd -eq "prepend" -or $cmd -eq "prep") {
        Edit-Task $args[1] $false ([String]::Join(" ", $args[2..$args.Length]))
    }
    elseif ($cmd -eq "append" -or $cmd -eq "app") {
        Edit-Task $args[1] $true ([String]::Join(" ", $args[2..$args.Length]))
    }
    elseif ($cmd -eq "do") {
        Set-TaskComplete $args[1..$args.Length]
    }
    elseif ($cmd -eq "markpending") {
        Set-TaskPending $args[1..$args.Length]
    }
    elseif ($cmd -eq "archive") {
        Sync-TaskArchive
    }
    elseif ($cmd -eq "pri" -or $cmd -eq "p") {
        Set-TaskPriority $args[1] $args[2]
    }
    elseif ($cmd -eq "depri" -or $cmd -eq "dp") {
        Remove-TaskPriority $args[1..$args.Length]
    }
    elseif ($cmd -eq "move" -or $cmd -eq "mv") {
        if ($args[3]) {
            Move-Task $args[1] $args[2] $args[3]
        }
        else {
            Move-Task $args[1] $args[2] 
        }
    }
    elseif ($cmd -eq "help") {
        Get-Help Todo
    }
}

function JoinArgs([object[]] $arguments) {
    $result = $arguments[0..$arguments.Length] | Join-String -Separator ' ' 
    $result
}

function LoadConfiguration() {
    param([string] $path)

    ## Set up the defaults
    $script:TODOTXT_VERBOSE = $TRUE
    $script:TODOTXT_FORCE = $FALSE
    $script:TODOTXT_AUTO_ARCHIVE = $FALSE
    $script:TODOTXT_PRESERVE_LINE_NUMBERS = $FALSE
    $script:TODOTXT_DATE_ON_ADD = $TRUE
	
    $script:PRI_A = 'Yellow'
    $script:PRI_B = 'Green'
    $script:PRI_C = 'Cyan'
    $script:PRI_X = 'White'
	
    ## Override the defaults with the configuration file
    if (Test-Path $path) {
        .$path			
    }
}

