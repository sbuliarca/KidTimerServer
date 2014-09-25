package com.bullsora.kidtimer

import grails.transaction.Transactional

class OverrideController {

  @Transactional
  def consume() {
    List<BlockUsage> notConsumedBlocks = BlockUsage.findAllWhere(consumed: false)
    /*  mark consumes these new ones  */
    for (BlockUsage block : notConsumedBlocks) {
      block.consumed = true
      block.save()
    }

    List<GrantUsage> notConsumedGrants = GrantUsage.findAllWhere(consumed: false)
    /*  mark consumes these new ones  */
    for (GrantUsage grant : notConsumedGrants) {
      grant.consumed = true
      grant.save()
    }

    def aggregatedMap = [blocks: notConsumedBlocks, grants: notConsumedGrants]
    respond aggregatedMap
  }

}
