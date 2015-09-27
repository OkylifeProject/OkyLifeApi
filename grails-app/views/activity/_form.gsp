<%@ page import="okylifeapi.Activity" %>



<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'creationDate', 'error')} required">
    <label for="creationDate">
        <g:message code="activity.creationDate.label" default="Creation Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="creationDate" precision="day" value="${activityInstance?.creationDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'activityType', 'error')} required">
    <label for="activityType">
        <g:message code="activity.activityType.label" default="Activity Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="activityType" required="" value="${activityInstance?.activityType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'okiBar', 'error')} required">
    <label for="okiBar">
        <g:message code="activity.okiBar.label" default="Oki Bar"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="okiBar" name="okiBar.id" from="${okylifeapi.OkiBar.list()}" optionKey="id" required=""
              value="${activityInstance?.okiBar?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'owner', 'error')} required">
    <label for="owner">
        <g:message code="activity.owner.label" default="Owner"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="owner" name="owner.id" from="${okylifeapi.User.list()}" optionKey="id" required=""
              value="${activityInstance?.owner?.id}" class="many-to-one"/>

</div>

