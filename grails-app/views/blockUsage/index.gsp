<%@ page import="com.bullsora.kidtimer.BlockUsage" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'blockUsage.label', default: 'BlockUsage')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-blockUsage" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message
                code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-blockUsage" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="minutes" title="${
                message(code: 'blockUsage.minutes.label', default: 'Minutes')}"/>

            <g:sortableColumn property="consumed" title="${
                message(code: 'blockUsage.consumed.label', default: 'Consumed')}"/>

            <g:sortableColumn property="dateCreated" title="${
                message(code: 'blockUsage.createdOn.label', default: 'Created on')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${blockUsageInstanceList}" status="i" var="blockUsageInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${blockUsageInstance.id}">${
                    fieldValue(bean: blockUsageInstance, field: "minutes")}</g:link></td>

                <td><g:formatBoolean boolean="${blockUsageInstance.consumed}"/></td>
                <td><g:formatDate date="${blockUsageInstance.dateCreated}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${blockUsageInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
