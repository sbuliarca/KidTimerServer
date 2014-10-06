package kidtimerserver

import com.bullsora.kidtimer.LogEntry

class CleanupJob {
    static triggers = {
      cron name: 'midnightCleanup', cronExpression: "0 0 0 * * ?"
    }

    def execute() {

      Date threshold = new Date() - 2

      List<LogEntry> toDelete = LogEntry.findAllByDateCreatedLessThan(threshold)
      LogEntry.deleteAll(toDelete)
    }
}
