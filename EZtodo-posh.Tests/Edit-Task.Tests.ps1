Describe 'Edit-Task' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    BeforeEach {
        Copy-Item ./EZtodo-posh.Tests/todo_example.txt ./local.txt -Force
    }

    AfterEach {
        Remove-Item ./local.txt -Force
    }

    It 'Adds text to the end of a task' {
        Edit-Task ./local.txt 6 -Append " (two gallons)" 

        $tasks = Get-Task ./local.txt 
        $tasks[5].Task.Body | Should -Be "Pick up milk @GroceryStore (two gallons)"
    }

    It 'Adds text to the beginning of a task' {
        Edit-Task ./local.txt 2 -Prepend "Call to " 
        $tasks = Get-Task ./local.txt 
        $tasks[1].Task.Body | Should -Be "Call to Schedule annual checkup +Health"
    }

    It 'Replaces text in a task' {
        Edit-Task ./local.txt 2 -Replace "annual" -ReplaceWith "biannual" 
        $tasks = Get-Task ./local.txt 
        $tasks[1].Task.Body | Should -Be "Schedule biannual checkup +Health"
    }
}
