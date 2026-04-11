Describe 'Set-Task' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    BeforeEach {
        Copy-Item ./EZtodo-posh.Tests/todo_example.txt ./local.txt -Force
    }

    AfterEach {
        Remove-Item ./local.txt -Force
    }

    It 'Replaces a task in the list' {
        Set-Task ./local.txt 2 "This is the new task 2"
        $tasks = Get-Task ./local.txt
        $tasks[1].Task.Body | Should -Be "This is the new task 2"
    }
}

