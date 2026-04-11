using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Set, "Task")]
    public class SetTask : EditTaskListCmdLet
    {
        [Parameter(Mandatory = true, Position = 1)]
        public int Number { get; set; }

        [Parameter(Mandatory = true, Position = 2)]
        public string Task { get; set; }

        [Parameter()]
        public SwitchParameter EnsureCreatedDate
        {
            get; set;
        }

        protected override void ProcessRecord()
        {
            var oldTask = TaskList.GetTask(Number);

            TaskList.ReplaceTask(Number, Task, EnsureCreatedDate);

            var newTask = TaskList.GetTask(Number);

            WriteVerbose(oldTask.Body);
            WriteVerbose("Replaced task with:");
            WriteVerbose(newTask.Body);
        }
    }
}
