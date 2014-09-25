package com.bullsora.kidtimer

class RemoteOverride {

  int minutes = 10

  OverrideType type

  boolean consumed

  Date dateCreated

  static constraints = {
    minutes blank: false
  }

}
