<%@ page import="com.bullsora.kidtimer.LogEntry" %>



<div class="fieldcontain ${hasErrors(bean: logEntryInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="logEntry.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="message" required="" value="${logEntryInstance?.message}"/>

</div>

