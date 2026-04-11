Describe 'Set-TaskComplete' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    BeforeEach {
        Copy-Item ./EZtodo-posh.Tests/todo_example.txt ./local.txt -Force
    }

    AfterEach {
        Remove-Item ./local.txt -Force
    }

    It 'Marks a task as completed' {
        Set-TaskComplete ./local.txt 1
        $tasks = Get-Task ./local.txt
        $tasks[0].Task.Completed | Should -Be $true
    }

    It 'Will accept piped task numbers' {
        $completedTasks = @(1, 3, 5)
        $completedTasks | Set-TaskComplete ./local.txt

        $tasks = Get-Task ./local.txt
        $tasks[0].Task.Completed | Should -Be $true
        $tasks[2].Task.Completed | Should -Be $true
        $tasks[4].Task.Completed | Should -Be $true
    }
}

Describe 'Set-TaskPending' {

    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    BeforeEach {
        Copy-Item ./EZtodo-posh.Tests/todo_example.txt ./local.txt -Force
    }

    AfterEach {
        Remove-Item ./local.txt -Force
    }

    It 'Marks a task as pending' {
        Set-TaskPending ./local.txt 8
        $tasks = Get-Task ./local.txt
        $tasks[7].Task.Completed | Should -Be $false
    }

    It 'Will accept piped task numbers' {
        $pendingTasks = @(1, 3, 8)
        $pendingTasks | Set-TaskPending ./local.txt

        $tasks = Get-Task ./local.txt
        $tasks[0].Task.Completed | Should -Be $false
        $tasks[2].Task.Completed | Should -Be $false
        $tasks[7].Task.Completed | Should -Be $false
    }
}