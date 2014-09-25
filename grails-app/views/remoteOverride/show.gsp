
<%@ page import="com.bullsora.kidtimer.RemoteOverride" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'remoteOverride.label', default: 'RemoteOverride')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-remoteOverride" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-remoteOverride" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list remoteOverride">
			
				<g:if test="${remoteOverrideInstance?.minutes}">
				<li class="fieldcontain">
					<span id="minutes-label" class="property-label"><g:message code="remoteOverride.minutes.label" default="Minutes" /></span>
					
						<span class="property-value" aria-labelledby="minutes-label"><g:fieldValue bean="${remoteOverrideInstance}" field="minutes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${remoteOverrideInstance?.consumed}">
				<li class="fieldcontain">
					<span id="consumed-label" class="property-label"><g:message code="remoteOverride.consumed.label" default="Consumed" /></span>
					
						<span class="property-value" aria-labelledby="consumed-label"><g:formatBoolean boolean="${remoteOverrideInstance?.consumed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${remoteOverrideInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="remoteOverride.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${remoteOverrideInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${remoteOverrideInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="remoteOverride.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${remoteOverrideInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:remoteOverrideInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${remoteOverrideInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
