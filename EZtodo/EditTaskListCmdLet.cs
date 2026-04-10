namespace EZtodo
{
    public abstract class EditTaskListCmdLet : ReadTaskListCmdLet
    {
        protected override void EndProcessing()
        {
            TaskList.Save(SourcePath);
        }
    }
}
