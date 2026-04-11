Describe 'Get-PriorityTask' {

    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    It 'Gets all the priority tasks from the example file' {
        $tasks = Get-PriorityTask ./EZtodo-posh.Tests/todo_example.txt
        $tasks.Count | Should -Be 4
    }

    It 'Gets tasks with the specified priority' {
        $tasks = Get-PriorityTask ./EZtodo-posh.Tests/todo_example.txt A
        $tasks.Count | Should -Be 2
    }
}
