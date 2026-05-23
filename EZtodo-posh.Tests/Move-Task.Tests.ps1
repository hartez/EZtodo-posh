Describe 'Move-Task' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    BeforeEach {
        Copy-Item ./EZtodo-posh.Tests/todo_example.txt ./local.txt -Force
    }

    AfterEach {
        Remove-Item ./local.txt -Force
        Remove-Item ./newtaskfile.txt -Force
    }

    It 'Moves a task to a new file' {
        Move-Task ./local.txt 2 ./newtaskfile.txt 
        $tasks = Get-Task ./local.txt
        $tasks.Count | Should -Be 7

        $newTasks = Get-Task ./newtaskfile.txt
        $newTasks.Count | Should -Be 1
    }
}

Describe 'Move-CompletedTask' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    BeforeEach {
        Copy-Item ./EZtodo-posh.Tests/todo_example.txt ./local.txt -Force
    }

    AfterEach {
        Remove-Item ./local.txt -Force
        Remove-Item ./archivefile.txt -Force
    }

    It 'Moves all completed tasks to the archive file' {
        Set-TaskComplete ./local.txt 3
        Set-TaskComplete ./local.txt 6

        Move-CompletedTask ./local.txt ./archivefile.txt 
        $tasks = Get-Task ./local.txt
        $tasks.Count | Should -Be 5

        $archivedTasks = Get-Task ./archivefile.txt
        $archivedTasks.Count | Should -Be 3
    }
}