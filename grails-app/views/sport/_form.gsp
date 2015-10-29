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

<div class="fieldcontain ${hasErrors(bean: sportInstance, field: 'startLocation', 'error')} ">
	<label for="startLocation">
		<g:message code="sport.startLocation.label" default="Start Location"/>

	</label>
	<g:select id="startLocation" name="startLocation.id" from="${classes.Location.list()}" optionKey="id"
			  value="${sportInstance?.startLocation?.id}" class="many-to-one" noSelection="['null': '']"/>

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
	<g:textField name="type" required="" value="${sportInstance?.type}"/>

</div>

