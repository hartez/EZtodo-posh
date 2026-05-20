using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Add, "Task")]
    public class AddTask : ReadTaskListCmdLet
    {
        [Parameter(Mandatory = true, Position = 1, ValueFromPipeline = true)]
        public string Task { get; set; }

        [Parameter()]
        public SwitchParameter EnsureCreatedDate
        {
            get; set;
        }

        protected override void ProcessRecord()
        {
            var newTask = TaskList.Create(Task, EnsureCreatedDate);

            WriteVerbose(newTask.Task.ToString());
            WriteVerbose($"{newTask.Number} added.");
        }

        protected override void EndProcessing()
        {
            TaskList.Save(SourcePath);
        }
    }

}
