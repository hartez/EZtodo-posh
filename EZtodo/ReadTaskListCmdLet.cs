using System.IO;
using System.Management.Automation;

namespace EZtodo
{
    public abstract class ReadTaskListCmdLet : PSCmdlet
    {
        [Parameter(Mandatory = true, Position = 0)]
        public string SourcePath
        {
            get => sourcePath;
            set
            {
                sourcePath = Path.IsPathRooted(value)
                    ? value
                    : Path.Combine(SessionState.Path.CurrentFileSystemLocation.Path, value);
            }
        }

        protected TaskList TaskList;
        private string sourcePath;

        protected override void BeginProcessing()
        {
            TaskList = new TaskList(SourcePath);
        }
    }
}
