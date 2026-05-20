using System.IO;
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
            var path = Path.IsPathRooted(SourcePath)
                ? SourcePath
                : Path.Combine(SessionState.Path.CurrentFileSystemLocation.Path, SourcePath);

            TaskList = new TaskList(path);
        }
    }
}
