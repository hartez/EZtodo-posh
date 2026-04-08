BeforeAll {
    Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1
}

Describe 'Get-Task' {
    It 'Just trying this out' {
        $allTasks = Get-Task ./EZtodo-posh.Tests/testtodo.txt
        $allTasks.Count | Should -Be 1
    }
}