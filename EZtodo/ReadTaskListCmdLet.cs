using System.Management.Automation;

namespace EZtodo
{
    public abstract class ReadTaskListCmdLet : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string SourcePath { get; set; }

        protected TaskList TaskList;

        protected override void BeginProcessing()
        {
            TaskList = new TaskList(SourcePath);
        }
    }
}
