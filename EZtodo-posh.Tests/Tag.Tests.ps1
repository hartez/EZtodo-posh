Describe 'Get-Project' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    It 'Gets all the projects for all the tasks in the list' {
        $projects = Get-Project ./EZtodo-posh.Tests/todo_example.txt
        $projects.Count | Should -Be 4
    }
}

Describe 'Get-Context' {
    BeforeAll {
        Import-Module -Force ./EZtodo/bin/Debug/NET10.0/EZtodo.psd1 -Scope Local
    }

    It 'Gets all the contexts for all the tasks in the list' {
        $contexts = Get-Context ./EZtodo-posh.Tests/todo_example.txt
        $contexts.Count | Should -Be 5
    }
}


