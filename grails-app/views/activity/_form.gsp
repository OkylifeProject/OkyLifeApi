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

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'locations', 'error')} ">
	<label for="locations">
		<g:message code="activity.locations.label" default="Locations"/>
		
	</label>

	<ul class="one-to-many">
		<g:each in="${activityInstance?.locations ?}" var="l">
			<li><g:link controller="location" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:link controller="location" action="create"
					params="['activity.id': activityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'location.label', default: 'Location')])}</g:link>
		</li>
	</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="activity.user.label" default="User"/>
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${okylifeapi.User.list()}" optionKey="id" required=""
			  value="${activityInstance?.user?.id}" class="many-to-one"/>

</div>

