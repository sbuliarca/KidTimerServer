<%@ page import="com.bullsora.kidtimer.GrantUsage" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'grantUsage.label', default: 'GrantUsage')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-grantUsage" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message
                code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                           args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-grantUsage" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list grantUsage">

        <g:if test="${grantUsageInstance?.minutes}">
            <li class="fieldcontain">
                <span id="minutes-label" class="property-label"><g:message
                        code="grantUsage.minutes.label" default="Minutes"/></span>

                <span class="property-value" aria-labelledby="minutes-label"><g:fieldValue
                        bean="${grantUsageInstance}" field="minutes"/></span>

            </li>
        </g:if>

        <li class="fieldcontain">
            <span id="consumed-label" class="property-label"><g:message
                    code="grantUsage.consumed.label" default="Consumed"/></span>

            <span class="property-value" aria-labelledby="consumed-label"><g:formatBoolean
                    boolean="${grantUsageInstance?.consumed}"/></span>

        </li>

    </ol>
    <g:form url="[resource: grantUsageInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${grantUsageInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete" value="${
                message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${
                                message(code: 'default.button.delete.confirm.message',
                                        default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
