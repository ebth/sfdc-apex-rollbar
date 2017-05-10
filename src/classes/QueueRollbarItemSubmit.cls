public class QueueRollbarItemSubmit implements Queueable, Database.AllowsCallouts {

    private RollbarItem item;
    private String project;

    public QueueRollbarItemSubmit(RollbarItem item, String project) {
        this.item = item;
        this.project = project;
    }

    public void execute(QueueableContext qc) {
        Rollbar.submitItem(item, project);
    }
}