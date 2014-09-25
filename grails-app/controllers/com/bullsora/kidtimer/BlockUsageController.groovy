package com.bullsora.kidtimer

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class BlockUsageController {

//    static responseFormats = ['html','json', 'xml']

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond BlockUsage.list(params), model: [blockUsageInstanceCount: BlockUsage.count()]
  }

  def show(BlockUsage blockUsageInstance) {
    respond blockUsageInstance
  }

  def create() {
    respond new BlockUsage(params)
  }

  @Transactional
  def save(BlockUsage blockUsageInstance) {
    if (blockUsageInstance == null) {
      notFound()
      return
    }

    if (blockUsageInstance.hasErrors()) {
      respond blockUsageInstance.errors, view: 'create'
      return
    }

    blockUsageInstance.save flush: true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.created.message',
                                args: [message(code: 'blockUsage.label',
                                               default: 'BlockUsage'), blockUsageInstance.id])
        redirect blockUsageInstance
      }
      '*' { respond blockUsageInstance, [status: CREATED] }
    }
  }

  def edit(BlockUsage blockUsageInstance) {
    respond blockUsageInstance
  }

  @Transactional
  def update(BlockUsage blockUsageInstance) {
    if (blockUsageInstance == null) {
      notFound()
      return
    }

    if (blockUsageInstance.hasErrors()) {
      respond blockUsageInstance.errors, view: 'edit'
      return
    }

    blockUsageInstance.save flush: true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.updated.message',
                                args: [message(code: 'BlockUsage.label',
                                               default: 'BlockUsage'), blockUsageInstance.id])
        redirect blockUsageInstance
      }
      '*' { respond blockUsageInstance, [status: OK] }
    }
  }

  @Transactional
  def delete(BlockUsage blockUsageInstance) {

    if (blockUsageInstance == null) {
      notFound()
      return
    }

    blockUsageInstance.delete flush: true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.deleted.message',
                                args: [message(code: 'BlockUsage.label',
                                               default: 'BlockUsage'), blockUsageInstance.id])
        redirect action: "index", method: "GET"
      }
      '*' { render status: NO_CONTENT }
    }
  }

  protected void notFound() {
    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.not.found.message',
                                args: [message(code: 'blockUsage.label',
                                               default: 'BlockUsage'), params.id])
        redirect action: "index", method: "GET"
      }
      '*' { render status: NOT_FOUND }
    }
  }
}
