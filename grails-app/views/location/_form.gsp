<%@ page import="okylifeapi.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'activity', 'error')} required">
    <label for="activity">
        <g:message code="location.activity.label" default="Activity"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="activity" name="activity.id" from="${okylifeapi.Activity.list()}" optionKey="id" required=""
              value="${locationInstance?.activity?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'latitude', 'error')} required">
    <label for="latitude">
        <g:message code="location.latitude.label" default="Latitude"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="latitude" value="${fieldValue(bean: locationInstance, field: 'latitude')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'longitude', 'error')} required">
    <label for="longitude">
        <g:message code="location.longitude.label" default="Longitude"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="longitude" value="${fieldValue(bean: locationInstance, field: 'longitude')}" required=""/>

</div>

