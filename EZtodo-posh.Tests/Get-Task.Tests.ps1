Describe 'Get-Task' {

    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    It 'Gets all the tasks from the example file' {
        $allTasks = Get-Task ./EZtodo-posh.Tests/todo_example.txt
        $allTasks.Count | Should -Be 8
    }

    It 'Can search for only tasks which match the search term' {
        $tasks = Get-Task ./EZtodo-posh.Tests/todo_example.txt "chapter"
        $tasks.Count | Should -Be 1
        $tasks[0].Task.Body | Should -Be "Outline chapter 5 +Novel @Computer"
    }

    It 'Can search for tasks which do not match the search term' {
        $tasks = Get-Task ./EZtodo-posh.Tests/todo_example.txt "-chapter"
        $tasks.Count | Should -Be 7
        $tasks[0].Task.Body | Should -Be "Call Mom @Phone +Family"
    }
}