package com.bullsora.kidtimer

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class GrantUsageController {

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond GrantUsage.list(params), model: [grantUsageInstanceCount: GrantUsage.count()]
  }

  def show(GrantUsage grantUsageInstance) {
    respond grantUsageInstance
  }

  def create() {
    respond new GrantUsage(params)
  }

  @Transactional
  def save(GrantUsage grantUsageInstance) {
    if (grantUsageInstance == null) {
      notFound()
      return
    }

    if (grantUsageInstance.hasErrors()) {
      respond grantUsageInstance.errors, view: 'create'
      return
    }

    grantUsageInstance.save flush: true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.created.message',
                                args: [message(code: 'grantUsage.label',
                                               default: 'GrantUsage'), grantUsageInstance.id])
        redirect grantUsageInstance
      }
      '*' { respond grantUsageInstance, [status: CREATED] }
    }
  }

  def edit(GrantUsage grantUsageInstance) {
    respond grantUsageInstance
  }

  @Transactional
  def update(GrantUsage grantUsageInstance) {
    if (grantUsageInstance == null) {
      notFound()
      return
    }

    if (grantUsageInstance.hasErrors()) {
      respond grantUsageInstance.errors, view: 'edit'
      return
    }

    grantUsageInstance.save flush: true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.updated.message',
                                args: [message(code: 'GrantUsage.label',
                                               default: 'GrantUsage'), grantUsageInstance.id])
        redirect grantUsageInstance
      }
      '*' { respond grantUsageInstance, [status: OK] }
    }
  }

  @Transactional
  def delete(GrantUsage grantUsageInstance) {

    if (grantUsageInstance == null) {
      notFound()
      return
    }

    grantUsageInstance.delete flush: true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.deleted.message',
                                args: [message(code: 'GrantUsage.label',
                                               default: 'GrantUsage'), grantUsageInstance.id])
        redirect action: "index", method: "GET"
      }
      '*' { render status: NO_CONTENT }
    }
  }

  protected void notFound() {
    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.not.found.message',
                                args: [message(code: 'grantUsage.label',
                                               default: 'GrantUsage'), params.id])
        redirect action: "index", method: "GET"
      }
      '*' { render status: NOT_FOUND }
    }
  }
}
