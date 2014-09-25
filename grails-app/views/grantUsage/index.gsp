<%@ page import="com.bullsora.kidtimer.GrantUsage" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'grantUsage.label', default: 'GrantUsage')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-grantUsage" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message
                code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-grantUsage" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="minutes" title="${
                message(code: 'grantUsage.minutes.label', default: 'Minutes')}"/>

            <g:sortableColumn property="consumed" title="${
                message(code: 'grantUsage.consumed.label', default: 'Consumed')}"/>

            <g:sortableColumn property="consumed" title="${
                message(code: 'grantUsage.createdOn.label', default: 'Created on')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${grantUsageInstanceList}" status="i" var="grantUsageInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${grantUsageInstance.id}">${
                    fieldValue(bean: grantUsageInstance, field: "minutes")}</g:link></td>

                <td><g:formatBoolean boolean="${grantUsageInstance.consumed}"/></td>
                <td><g:formatDate date="${grantUsageInstance.dateCreated}"/></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${grantUsageInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
