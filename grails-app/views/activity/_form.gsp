<%@ page import="okylifeapi.Activity" %>



<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="activity.creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${activityInstance?.creationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="activity.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${activityInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="activity.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${activityInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'okiBar', 'error')} ">
	<label for="okiBar">
		<g:message code="activity.okiBar.label" default="Oki Bar" />
		
	</label>
	<g:select id="okiBar" name="okiBar.id" from="${okylifeapi.OkiBar.list()}" optionKey="id" value="${activityInstance?.okiBar?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'startLocation', 'error')} ">
	<label for="startLocation">
		<g:message code="activity.startLocation.label" default="Start Location" />
		
	</label>
	<g:select id="startLocation" name="startLocation.id" from="${classes.Location.list()}" optionKey="id" value="${activityInstance?.startLocation?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

