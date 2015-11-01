<%@ page import="okylifeapi.Sport" %>



<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="sport.creationDate.label" default="Creation Date"/>
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day" value="${sportInstance?.creationDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="sport.description.label" default="Description"/>
		
	</label>
	<g:textField name="description" value="${sportInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="sport.name.label" default="Name"/>
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${sportInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'okiBar', 'error')} ">
	<label for="okiBar">
		<g:message code="sport.okiBar.label" default="Oki Bar"/>
		
	</label>
	<g:select id="okiBar" name="okiBar.id" from="${okylifeapi.OkiBar.list()}" optionKey="id"
			  value="${sportInstance?.okiBar?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'locations', 'error')} ">
	<label for="locations">
		<g:message code="sport.locations.label" default="Locations"/>
		
	</label>

	<ul class="one-to-many">
		<g:each in="${sportInstance?.locations ?}" var="l">
			<li><g:link controller="location" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:link controller="location" action="create"
					params="['sport.id': sportInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'location.label', default: 'Location')])}</g:link>
		</li>
	</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'hydration', 'error')} required">
	<label for="hydration">
		<g:message code="sport.hydration.label" default="Hydration"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hydration" value="${fieldValue(bean: sportInstance, field: 'hydration')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'duration', 'error')} required">
	<label for="duration">
		<g:message code="sport.duration.label" default="Duration"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="duration" value="${fieldValue(bean: sportInstance, field: 'duration')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'rhythm', 'error')} required">
	<label for="rhythm">
		<g:message code="sport.rhythm.label" default="Rhythm"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rhythm" value="${fieldValue(bean: sportInstance, field: 'rhythm')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'velocity', 'error')} required">
	<label for="velocity">
		<g:message code="sport.velocity.label" default="Velocity"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="velocity" value="${fieldValue(bean: sportInstance, field: 'velocity')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'distance', 'error')} required">
	<label for="distance">
		<g:message code="sport.distance.label" default="Distance"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="distance" value="${fieldValue(bean: sportInstance, field: 'distance')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'targetDistance', 'error')} required">
	<label for="targetDistance">
		<g:message code="sport.targetDistance.label" default="Target Distance"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="targetDistance" value="${fieldValue(bean: sportInstance, field: 'targetDistance')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="sport.type.label" default="Type"/>
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${sportInstance.constraints.type.inList}" required="" value="${sportInstance?.type}"
			  valueMessagePrefix="sport.type"/>

</div>

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="sport.user.label" default="User"/>
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${okylifeapi.User.list()}" optionKey="id" required=""
			  value="${sportInstance?.user?.id}" class="many-to-one"/>

</div>

