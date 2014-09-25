<%@ page import="com.bullsora.kidtimer.RemoteOverride" %>



<div class="fieldcontain ${hasErrors(bean: remoteOverrideInstance, field: 'minutes', 'error')} required">
	<label for="minutes">
		<g:message code="remoteOverride.minutes.label" default="Minutes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minutes" type="number" value="${remoteOverrideInstance.minutes}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: remoteOverrideInstance, field: 'consumed', 'error')} ">
	<label for="consumed">
		<g:message code="remoteOverride.consumed.label" default="Consumed" />
		
	</label>
	<g:checkBox name="consumed" value="${remoteOverrideInstance?.consumed}" disabled="true"/>

</div>

<div class="fieldcontain ${hasErrors(bean: remoteOverrideInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="remoteOverride.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${com.bullsora.kidtimer.OverrideType?.values()}" keys="${com.bullsora.kidtimer.OverrideType.values()*.name()}" required="" value="${remoteOverrideInstance?.type?.name()}" />

</div>

