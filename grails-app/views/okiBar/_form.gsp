<%@ page import="okylifeapi.OkiBar" %>



<div class="fieldcontain ${hasErrors(bean: okiBarInstance, field: 'calories', 'error')} required">
    <label for="calories">
        <g:message code="okiBar.calories.label" default="Calories"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="calories" value="${fieldValue(bean: okiBarInstance, field: 'calories')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: okiBarInstance, field: 'steps', 'error')} required">
    <label for="steps">
        <g:message code="okiBar.steps.label" default="Steps"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="steps" value="${fieldValue(bean: okiBarInstance, field: 'steps')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: okiBarInstance, field: 'speed', 'error')} required">
    <label for="speed">
        <g:message code="okiBar.speed.label" default="Speed"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="speed" value="${fieldValue(bean: okiBarInstance, field: 'speed')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: okiBarInstance, field: 'hydration', 'error')} required">
    <label for="hydration">
        <g:message code="okiBar.hydration.label" default="Hydration"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="hydration" value="${fieldValue(bean: okiBarInstance, field: 'hydration')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: okiBarInstance, field: 'duration', 'error')} required">
    <label for="duration">
        <g:message code="okiBar.duration.label" default="Duration"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="duration" value="${fieldValue(bean: okiBarInstance, field: 'duration')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: okiBarInstance, field: 'rythm', 'error')} required">
    <label for="rythm">
        <g:message code="okiBar.rythm.label" default="Rythm"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="rythm" value="${fieldValue(bean: okiBarInstance, field: 'rythm')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: okiBarInstance, field: 'cardiacFrequency', 'error')} required">
    <label for="cardiacFrequency">
        <g:message code="okiBar.cardiacFrequency.label" default="Cardiac Frequency"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="cardiacFrequency" value="${fieldValue(bean: okiBarInstance, field: 'cardiacFrequency')}"
             required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: okiBarInstance, field: 'cadence', 'error')} required">
    <label for="cadence">
        <g:message code="okiBar.cadence.label" default="Cadence"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="cadence" value="${fieldValue(bean: okiBarInstance, field: 'cadence')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: okiBarInstance, field: 'objetiveDistance', 'error')} required">
    <label for="objetiveDistance">
        <g:message code="okiBar.objetiveDistance.label" default="Objetive Distance"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="objetiveDistance" value="${fieldValue(bean: okiBarInstance, field: 'objetiveDistance')}"
             required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: okiBarInstance, field: 'asociatedActivity', 'error')} required">
    <label for="asociatedActivity">
        <g:message code="okiBar.asociatedActivity.label" default="Asociated Activity"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="asociatedActivity" name="asociatedActivity.id" from="${okylifeapi.Activity.list()}" optionKey="id"
              required="" value="${okiBarInstance?.asociatedActivity?.id}" class="many-to-one"/>

</div>

