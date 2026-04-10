using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Set, "TaskPriority")] 
    public class SetTaskPriority : EditTaskListCmdLet
    {
        [Parameter(Mandatory = true, Position = 1)]
        public int Number { get; set; }

        [ValidateRange('A', 'Z')]
        [Parameter(Mandatory = true, Position = 2)]
        public char Priority { get; set; }

        protected override void ProcessRecord()
        {
            TaskList.SetItemPriority(Number, Priority);

            WriteVerbose($"{Number} set to priority {Priority}");
        }
    }
}
