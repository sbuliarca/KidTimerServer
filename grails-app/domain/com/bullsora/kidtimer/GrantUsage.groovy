package com.bullsora.kidtimer

class GrantUsage {

  int minutes = 10

  boolean consumed

  Date dateCreated

  static constraints = {
    minutes blank: false
  }
}
