using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Set, "TaskComplete")]
    public class SetTaskComplete : EditTaskListCmdLet
    {
        [Parameter(Mandatory = true, Position = 1, ValueFromPipeline = true)]
        public int Number { get; set; }

        protected override void ProcessRecord()
        {
            var task = TaskList.GetTask(Number);

            if (!task.Completed)
            {
                TaskList.MarkCompleted(Number);
                WriteVerbose($"{task.Body}");
                WriteVerbose($"{Number} marked as done.");
            }
            else
            {
                WriteVerbose($"{Number} is already marked as done.");
            }
        }
    }
}
