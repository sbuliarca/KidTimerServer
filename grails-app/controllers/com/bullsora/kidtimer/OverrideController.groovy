package com.bullsora.kidtimer

import grails.transaction.Transactional

class OverrideController {

  @Transactional
  def consume() {
    List<RemoteOverride> notConsumedOverrides = RemoteOverride.
        findAllByConsumed(false, [sort: "dateCreated", order: "desc"])
    /*  mark consumed these new ones  */
    for (RemoteOverride override : notConsumedOverrides) {
      override.consumed = true
      override.save()
    }

    respond notConsumedOverrides[0]
  }

}
