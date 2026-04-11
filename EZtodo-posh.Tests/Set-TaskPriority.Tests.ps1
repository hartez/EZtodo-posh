Describe 'Set-TaskPriority' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    BeforeEach {
        Copy-Item ./EZtodo-posh.Tests/todo_example.txt ./local.txt -Force
    }

    AfterEach {
        Remove-Item ./local.txt -Force
    }

    It 'Sets a priority for a task' {
        Set-TaskPriority ./local.txt 5 D
        $tasks = Get-Task ./local.txt
        $tasks[4].Task.Priority | Should -Be 'D'
    }

    It 'Updates an existing priority' {
        Set-TaskPriority ./local.txt 2 E
        $tasks = Get-Task ./local.txt
        $tasks[1].Task.Priority | Should -Be 'E'
    }
}

Describe 'Remove-TaskPriority' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    BeforeEach {
        Copy-Item ./EZtodo-posh.Tests/todo_example.txt ./local.txt -Force
    }

    AfterEach {
        Remove-Item ./local.txt -Force
    }

    It 'Removes a priority from a task' {
        Remove-TaskPriority ./local.txt 2 
        $tasks = Get-Task ./local.txt
        $tasks[1].Task.Priority | Should -Be $null
    }

    It 'Can accept piped task numbers' {
        $tasksToDeprioritize = @(1, 2, 3, 4, 5)

        $tasksToDeprioritize | Remove-TaskPriority ./local.txt 

        $tasks = Get-PriorityTask ./local.txt
        $tasks.Count | Should -Be 0
    }
}
