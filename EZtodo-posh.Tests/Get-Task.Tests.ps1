Describe 'Get-Task' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1
    }

    It 'Gets all the tasks from the example file' {
        $allTasks = Get-Task ./EZtodo-posh.Tests/todo_example.txt
        $allTasks.Count | Should -Be 8
    }

    It 'Can search for only tasks which match the searcm term'{
        $tasks = Get-Task ./EZtodo-posh.Tests/todo_example.txt "chapter"
        $tasks.Count | Should -Be 1
        $tasks[0].Task.Body | Should -Be "Outline chapter 5 +Novel @Computer"
    }

     It 'Can search for tasks which do not match the searcm term'{
        $tasks = Get-Task ./EZtodo-posh.Tests/todo_example.txt "-chapter"
        $tasks.Count | Should -Be 7
        $tasks[0].Task.Body | Should -Be "Call Mom @Phone +Family"
    }
}

Describe 'Get-PriorityTask' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1
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

Describe 'Get-Project' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1
    }

    It 'Gets all the projects for all the tasks in the list' {
        $projects = Get-Project ./EZtodo-posh.Tests/todo_example.txt
        $projects.Count | Should -Be 4
    }
}

Describe 'Get-Context' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1
    }

    It 'Gets all the contexts for all the tasks in the list' {
        $contexts = Get-Context ./EZtodo-posh.Tests/todo_example.txt
        $contexts.Count | Should -Be 5
    }
}

Describe 'Add-Task' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1
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
}