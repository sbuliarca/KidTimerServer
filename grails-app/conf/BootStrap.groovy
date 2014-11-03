import com.bullsora.kidtimer.LogEntry

class BootStrap {

  def init = { servletContext ->
    new LogEntry(message: "for testing purposes").save()
  }

  def destroy = {
  }
}
