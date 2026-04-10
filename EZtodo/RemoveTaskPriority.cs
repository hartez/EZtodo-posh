using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Remove, "TaskPriority")]
    public class RemoveTaskPriority : EditTaskListCmdLet
    {
        [Parameter(Mandatory = true, Position = 1, ValueFromPipeline = true)]
        public int Number { get; set; }

        protected override void ProcessRecord()
        {
            TaskList.ClearItemPriority(Number);

            var task = TaskList.GetTask(Number);
            WriteVerbose(task.Body);
			WriteVerbose($"{Number} deprioritized.");
        }
    }
}
