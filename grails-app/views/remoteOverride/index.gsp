
<%@ page import="com.bullsora.kidtimer.RemoteOverride" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'remoteOverride.label', default: 'RemoteOverride')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-remoteOverride" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-remoteOverride" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="minutes" title="${message(code: 'remoteOverride.minutes.label', default: 'Minutes')}" />
					
						<g:sortableColumn property="consumed" title="${message(code: 'remoteOverride.consumed.label', default: 'Consumed')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'remoteOverride.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'remoteOverride.type.label', default: 'Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${remoteOverrideInstanceList}" status="i" var="remoteOverrideInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${remoteOverrideInstance.id}">${fieldValue(bean: remoteOverrideInstance, field: "minutes")}</g:link></td>
					
						<td><g:formatBoolean boolean="${remoteOverrideInstance.consumed}" /></td>
					
						<td><g:formatDate date="${remoteOverrideInstance.dateCreated}" /></td>
					
						<td>${fieldValue(bean: remoteOverrideInstance, field: "type")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${remoteOverrideInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
