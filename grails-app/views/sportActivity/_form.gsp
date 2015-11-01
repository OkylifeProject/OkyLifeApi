<%@ page import="okylifeapi.SportActivity" %>



<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="sportActivity.creationDate.label" default="Creation Date"/>
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day" value="${sportActivityInstance?.creationDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="sportActivity.description.label" default="Description"/>

	</label>
	<g:textField name="description" value="${sportActivityInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="sportActivity.name.label" default="Name"/>
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${sportActivityInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'locations', 'error')} ">
	<label for="locations">
		<g:message code="sportActivity.locations.label" default="Locations"/>

	</label>

	<ul class="one-to-many">
		<g:each in="${sportActivityInstance?.locations ?}" var="l">
			<li><g:link controller="location" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:link controller="location" action="create"
					params="['sportActivity.id': sportActivityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'location.label', default: 'Location')])}</g:link>
		</li>
	</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'hydration', 'error')} required">
	<label for="hydration">
		<g:message code="sportActivity.hydration.label" default="Hydration"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hydration" value="${fieldValue(bean: sportActivityInstance, field: 'hydration')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'duration', 'error')} required">
	<label for="duration">
		<g:message code="sportActivity.duration.label" default="Duration"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duration" value="${fieldValue(bean: sportActivityInstance, field: 'duration')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'rhythm', 'error')} required">
	<label for="rhythm">
		<g:message code="sportActivity.rhythm.label" default="Rhythm"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rhythm" value="${fieldValue(bean: sportActivityInstance, field: 'rhythm')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'velocity', 'error')} required">
	<label for="velocity">
		<g:message code="sportActivity.velocity.label" default="Velocity"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="velocity" value="${fieldValue(bean: sportActivityInstance, field: 'velocity')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'distance', 'error')} required">
	<label for="distance">
		<g:message code="sportActivity.distance.label" default="Distance"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="distance" value="${fieldValue(bean: sportActivityInstance, field: 'distance')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'targetDistance', 'error')} required">
	<label for="targetDistance">
		<g:message code="sportActivity.targetDistance.label" default="Target Distance"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="targetDistance" value="${fieldValue(bean: sportActivityInstance, field: 'targetDistance')}"
			 required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="sportActivity.type.label" default="Type"/>
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${sportActivityInstance.constraints.type.inList}" required=""
			  value="${sportActivityInstance?.type}" valueMessagePrefix="sportActivity.type"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportActivityInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="sportActivity.user.label" default="User"/>
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${okylifeapi.User.list()}" optionKey="id" required=""
			  value="${sportActivityInstance?.user?.id}" class="many-to-one"/>

</div>

