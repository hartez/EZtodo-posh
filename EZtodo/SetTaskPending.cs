using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Set, "TaskPending")]
    public class SetTaskPending : EditTaskListCmdLet
    {
        [Parameter(Mandatory = true, Position = 1, ValueFromPipeline = true)]
        public int Number { get; set; }

        protected override void ProcessRecord()
        {
            var task = TaskList.GetTask(Number);

            if (task.Completed)
            {
                TaskList.MarkPending(Number);    
                WriteVerbose($"{task.Body}");
                WriteVerbose($"{Number} mark as pending.");
            }
            else
            {
                WriteVerbose($"{Number} is already marked as pending.");
            }
        }
    }
}
