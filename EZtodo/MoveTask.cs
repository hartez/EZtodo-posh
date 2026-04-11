using System.IO;
using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Move, "Task", SupportsShouldProcess = true)]
    public class MoveTask : EditTaskListCmdLet
    {
        [Parameter(Mandatory = true, Position = 1)]
        public int Number { get; set; }

        [Parameter(Mandatory = true, Position = 2)]
        public string DestinationPath { get; set; }

        [Parameter()]
        public SwitchParameter PreserveLineNumbers
        {
            get; set;
        }

        protected override void ProcessRecord()
        {
            if (!File.Exists(DestinationPath))
            {
                File.Create(DestinationPath).Close();
            }

            var destinationList = new TaskList(DestinationPath);
            var task = TaskList.GetTask(Number);

            if (ShouldProcess(verboseDescription: $"Moving task '{task.Body}' to {DestinationPath}",
                            verboseWarning: $"Move task '{task.Body}'?",
                            caption: "Move Task", out ShouldProcessReason reason))
            {
                destinationList.Add(task.ToString());
                destinationList.Save(DestinationPath);

                TaskList.RemoveTask(Number, PreserveLineNumbers);

                WriteVerbose(task.Body);
                WriteVerbose($"{Number} moved from {SourcePath} to {DestinationPath}.");
            }
            else
            {
                WriteVerbose($"No tasks were moved.");
            }
        }
    }
}
