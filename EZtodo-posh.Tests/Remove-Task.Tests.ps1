Describe 'Remove-Task' {

    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    BeforeEach {
        Copy-Item ./EZtodo-posh.Tests/todo_example.txt ./local.txt -Force
    }

    AfterEach {
        Remove-Item ./local.txt -Force
    }

    It 'Removes a task from the list' {
        Remove-Task ./local.txt 3 
        $tasks = Get-Task ./local.txt
        $tasks.Count | Should -Be 7
        $tasks[2].Task.Body | Should -Be "Add cover sheets @Office +TPSReports"
    }

    It 'Leaves a blank line if PreserverLineNumbers is set' {
        Remove-Task ./local.txt 1 -PreserveLineNumbers
        Get-Content ./local.txt | Where-Object { $_.Length -eq 0 } | Measure-Object | Select-Object -ExpandProperty Count | Should -Be 1
    }
}