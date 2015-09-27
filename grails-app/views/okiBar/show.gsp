
<%@ page import="okylifeapi.OkiBar" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'okiBar.label', default: 'OkiBar')}"/>
	<title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-okiBar" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
															 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label"
															  args="[entityName]"/></g:link></li>
	</ul>
</div>

<div id="show-okiBar" class="content scaffold-show" role="main">
	<h1><g:message code="default.show.label" args="[entityName]"/></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<ol class="property-list okiBar">

		<g:if test="${okiBarInstance?.calories}">
			<li class="fieldcontain">
				<span id="calories-label" class="property-label"><g:message code="okiBar.calories.label"
																			default="Calories"/></span>

				<span class="property-value" aria-labelledby="calories-label"><g:fieldValue bean="${okiBarInstance}"
																							field="calories"/></span>

			</li>
		</g:if>

		<g:if test="${okiBarInstance?.steps}">
			<li class="fieldcontain">
				<span id="steps-label" class="property-label"><g:message code="okiBar.steps.label"
																		 default="Steps"/></span>

				<span class="property-value" aria-labelledby="steps-label"><g:fieldValue bean="${okiBarInstance}"
																						 field="steps"/></span>

			</li>
		</g:if>

		<g:if test="${okiBarInstance?.speed}">
			<li class="fieldcontain">
				<span id="speed-label" class="property-label"><g:message code="okiBar.speed.label"
																		 default="Speed"/></span>

				<span class="property-value" aria-labelledby="speed-label"><g:fieldValue bean="${okiBarInstance}"
																						 field="speed"/></span>

			</li>
		</g:if>

		<g:if test="${okiBarInstance?.hydration}">
			<li class="fieldcontain">
				<span id="hydration-label" class="property-label"><g:message code="okiBar.hydration.label"
																			 default="Hydration"/></span>

				<span class="property-value" aria-labelledby="hydration-label"><g:fieldValue bean="${okiBarInstance}"
																							 field="hydration"/></span>

			</li>
		</g:if>

		<g:if test="${okiBarInstance?.duration}">
			<li class="fieldcontain">
				<span id="duration-label" class="property-label"><g:message code="okiBar.duration.label"
																			default="Duration"/></span>

				<span class="property-value" aria-labelledby="duration-label"><g:fieldValue bean="${okiBarInstance}"
																							field="duration"/></span>

			</li>
		</g:if>

		<g:if test="${okiBarInstance?.rythm}">
			<li class="fieldcontain">
				<span id="rythm-label" class="property-label"><g:message code="okiBar.rythm.label"
																		 default="Rythm"/></span>

				<span class="property-value" aria-labelledby="rythm-label"><g:fieldValue bean="${okiBarInstance}"
																						 field="rythm"/></span>

			</li>
		</g:if>

		<g:if test="${okiBarInstance?.cardiacFrequency}">
			<li class="fieldcontain">
				<span id="cardiacFrequency-label" class="property-label"><g:message code="okiBar.cardiacFrequency.label"
																					default="Cardiac Frequency"/></span>

				<span class="property-value" aria-labelledby="cardiacFrequency-label"><g:fieldValue
						bean="${okiBarInstance}" field="cardiacFrequency"/></span>

			</li>
		</g:if>

		<g:if test="${okiBarInstance?.cadence}">
			<li class="fieldcontain">
				<span id="cadence-label" class="property-label"><g:message code="okiBar.cadence.label"
																		   default="Cadence"/></span>

				<span class="property-value" aria-labelledby="cadence-label"><g:fieldValue bean="${okiBarInstance}"
																						   field="cadence"/></span>

			</li>
		</g:if>

		<g:if test="${okiBarInstance?.objetiveDistance}">
			<li class="fieldcontain">
				<span id="objetiveDistance-label" class="property-label"><g:message code="okiBar.objetiveDistance.label"
																					default="Objetive Distance"/></span>

				<span class="property-value" aria-labelledby="objetiveDistance-label"><g:fieldValue
						bean="${okiBarInstance}" field="objetiveDistance"/></span>

			</li>
		</g:if>

		<g:if test="${okiBarInstance?.associatedActivity}">
			<li class="fieldcontain">
				<span id="associatedActivity-label" class="property-label"><g:message
						code="okiBar.associatedActivity.label" default="Associated Activity"/></span>

				<span class="property-value" aria-labelledby="associatedActivity-label"><g:link controller="activity"
																								action="show"
																								id="${okiBarInstance?.associatedActivity?.id}">${okiBarInstance?.associatedActivity?.encodeAsHTML()}</g:link></span>

			</li>
		</g:if>

	</ol>
	<g:form url="[resource: okiBarInstance, action: 'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="edit" action="edit" resource="${okiBarInstance}"><g:message code="default.button.edit.label"
																					   default="Edit"/></g:link>
			<g:actionSubmit class="delete" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
		</fieldset>
	</g:form>
</div>
</body>
</html>
