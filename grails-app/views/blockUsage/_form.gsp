<%@ page import="com.bullsora.kidtimer.BlockUsage" %>



<div class="fieldcontain ${
    hasErrors(bean: blockUsageInstance, field: 'minutes', 'error')} required">
    <label for="minutes">
        <g:message code="blockUsage.minutes.label" default="Minutes"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="minutes" type="number" value="${blockUsageInstance.minutes}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: blockUsageInstance, field: 'consumed', 'error')} ">
    <label for="consumed">
        <g:message code="blockUsage.consumed.label" default="Consumed"/>

    </label>
    <g:checkBox name="consumed" value="${blockUsageInstance?.consumed}" disabled="true"/>

</div>

