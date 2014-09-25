import com.bullsora.kidtimer.BlockUsage
import com.bullsora.kidtimer.GrantUsage

class BootStrap {

  def init = { servletContext ->
    new BlockUsage(minutes: 15).save()
    new GrantUsage(minutes: 12).save()

  }

  def destroy = {
  }
}
