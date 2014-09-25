<%@ page import="com.bullsora.kidtimer.GrantUsage" %>



<div class="fieldcontain ${
    hasErrors(bean: grantUsageInstance, field: 'minutes', 'error')} required">
    <label for="minutes">
        <g:message code="grantUsage.minutes.label" default="Minutes"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="minutes" type="number" value="${grantUsageInstance.minutes}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: grantUsageInstance, field: 'consumed', 'error')} ">
    <label for="consumed">
        <g:message code="grantUsage.consumed.label" default="Consumed"/>

    </label>
    <g:checkBox name="consumed" value="${grantUsageInstance?.consumed}" disabled="true"/>

</div>

