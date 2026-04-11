Describe 'Add-Task' {

    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    BeforeEach {
        Copy-Item ./EZtodo-posh.Tests/todo_example.txt ./local.txt -Force
    }

    AfterEach {
        Remove-Item ./local.txt -Force
    }

    It 'Adds a new task to the end of the list' {
        Add-Task ./local.txt "This is a new task"
        $tasks = Get-Task ./local.txt
        $tasks.Count | Should -Be 9
        $tasks[8].Number | Should -Be 9
        $tasks[8].Task.Body | Should -Be "This is a new task"
    }

    It 'Will add a missing created date if the flag is set' {
        Add-Task ./local.txt "This is a new task" -EnsureCreatedDate
        $tasks = Get-Task ./local.txt
        $tasks.Count | Should -Be 9

        $newTask = $tasks[8]

        $newTask.Number | Should -Be 9
        $newTask.Task.Body | Should -Be "This is a new task"
        $newTask.Task.CreatedDate | Should -Not -BeNullOrEmpty
    }

    It 'Will accept piped task strings' {

        $newTasks = @('Task 1', 'Task 2', 'Task 3,', 'Task 4')

        $newTasks | Add-Task ./local.txt

        $tasks = Get-Task ./local.txt
        $tasks.Count | Should -Be 12
    }
}
