using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Remove, "Task", SupportsShouldProcess = true)]
    public class RemoveTask : EditTaskListCmdLet
    {
        [Parameter(Mandatory = true, Position = 1)]
        public int Number { get; set; }

        [Parameter()]
        public SwitchParameter PreserveLineNumbers
        {
            get; set;
        }

        protected override void ProcessRecord()
        {
            var oldTask = TaskList.GetTask(Number);

            if (ShouldProcess(verboseDescription: $"Deleting task '{oldTask.Body}'",
                verboseWarning: $"Delete task '{oldTask.Body}'?", 
                caption: "Delete Task", out ShouldProcessReason reason))
            {

                TaskList.RemoveTask(Number, PreserveLineNumbers);

                WriteVerbose($"{Number} {oldTask}");
                WriteVerbose($"{Number} deleted.");
            }
            else
            {
                WriteVerbose($"No tasks were deleted.");
            }
        }
    }
}
