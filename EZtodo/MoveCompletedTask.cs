using System.IO;
using System.Linq;
using System.Management.Automation;

namespace EZtodo
{
    [Cmdlet(VerbsCommon.Move, "CompletedTask")]
    public class MoveCompletedTask : EditTaskListCmdLet
    {
        [Parameter(Mandatory = true, Position = 2)]
        public string ArchivePath { get; set; }

        [Parameter()]
        public SwitchParameter PreserveLineNumbers
        {
            get; set;
        }

        protected override void ProcessRecord()
        {
            if (!File.Exists(ArchivePath))
            {
                File.Create(ArchivePath).Close();
            }

            var toMove = TaskList.ListCompleted()
                .OrderByDescending(nt => nt.Number).ToList();

            var archiveList = new TaskList(ArchivePath);

            foreach (var numberedTask in toMove)
            {
                TaskList.RemoveTask(numberedTask.Number, PreserveLineNumbers);
                archiveList.Add(numberedTask.Task);

                WriteVerbose(numberedTask.Task.ToString());
            }

            archiveList.Save(ArchivePath);

            WriteVerbose($"{SourcePath} archived.");
        }
    }
}
