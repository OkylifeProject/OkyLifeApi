
<%@ page import="okylifeapi.Sport" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'sport.label', default: 'Sport')}"/>
	<title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-sport" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
															default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label"
															  args="[entityName]"/></g:link></li>
	</ul>
</div>

<div id="show-sport" class="content scaffold-show" role="main">
	<h1><g:message code="default.show.label" args="[entityName]"/></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<ol class="property-list sport">

		<g:if test="${sportInstance?.creationDate}">
			<li class="fieldcontain">
				<span id="creationDate-label" class="property-label"><g:message code="sport.creationDate.label"
																				default="Creation Date"/></span>

				<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate
						date="${sportInstance?.creationDate}"/></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.description}">
			<li class="fieldcontain">
				<span id="description-label" class="property-label"><g:message code="sport.description.label"
																			   default="Description"/></span>

				<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${sportInstance}"
																							   field="description"/></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.name}">
			<li class="fieldcontain">
				<span id="name-label" class="property-label"><g:message code="sport.name.label" default="Name"/></span>

				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${sportInstance}"
																						field="name"/></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.okiBar}">
			<li class="fieldcontain">
				<span id="okiBar-label" class="property-label"><g:message code="sport.okiBar.label"
																		  default="Oki Bar"/></span>

				<span class="property-value" aria-labelledby="okiBar-label"><g:link controller="okiBar" action="show"
																					id="${sportInstance?.okiBar?.id}">${sportInstance?.okiBar?.encodeAsHTML()}</g:link></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.startLocation}">
			<li class="fieldcontain">
				<span id="startLocation-label" class="property-label"><g:message code="sport.startLocation.label"
																				 default="Start Location"/></span>

				<span class="property-value" aria-labelledby="startLocation-label"><g:link controller="location"
																						   action="show"
																						   id="${sportInstance?.startLocation?.id}">${sportInstance?.startLocation?.encodeAsHTML()}</g:link></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.hydration}">
			<li class="fieldcontain">
				<span id="hydration-label" class="property-label"><g:message code="sport.hydration.label"
																			 default="Hydration"/></span>

				<span class="property-value" aria-labelledby="hydration-label"><g:fieldValue bean="${sportInstance}"
																							 field="hydration"/></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.duration}">
			<li class="fieldcontain">
				<span id="duration-label" class="property-label"><g:message code="sport.duration.label"
																			default="Duration"/></span>

				<span class="property-value" aria-labelledby="duration-label"><g:fieldValue bean="${sportInstance}"
																							field="duration"/></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.rhythm}">
			<li class="fieldcontain">
				<span id="rhythm-label" class="property-label"><g:message code="sport.rhythm.label"
																		  default="Rhythm"/></span>

				<span class="property-value" aria-labelledby="rhythm-label"><g:fieldValue bean="${sportInstance}"
																						  field="rhythm"/></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.velocity}">
			<li class="fieldcontain">
				<span id="velocity-label" class="property-label"><g:message code="sport.velocity.label"
																			default="Velocity"/></span>

				<span class="property-value" aria-labelledby="velocity-label"><g:fieldValue bean="${sportInstance}"
																							field="velocity"/></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.distance}">
			<li class="fieldcontain">
				<span id="distance-label" class="property-label"><g:message code="sport.distance.label"
																			default="Distance"/></span>

				<span class="property-value" aria-labelledby="distance-label"><g:fieldValue bean="${sportInstance}"
																							field="distance"/></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.targetDistance}">
			<li class="fieldcontain">
				<span id="targetDistance-label" class="property-label"><g:message code="sport.targetDistance.label"
																				  default="Target Distance"/></span>

				<span class="property-value" aria-labelledby="targetDistance-label"><g:fieldValue
						bean="${sportInstance}" field="targetDistance"/></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.type}">
			<li class="fieldcontain">
				<span id="type-label" class="property-label"><g:message code="sport.type.label" default="Type"/></span>

				<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${sportInstance}"
																						field="type"/></span>

			</li>
		</g:if>

		<g:if test="${sportInstance?.user}">
			<li class="fieldcontain">
				<span id="user-label" class="property-label"><g:message code="sport.user.label" default="User"/></span>

				<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show"
																				  id="${sportInstance?.user?.id}">${sportInstance?.user?.encodeAsHTML()}</g:link></span>

			</li>
		</g:if>

	</ol>
	<g:form url="[resource: sportInstance, action: 'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="edit" action="edit" resource="${sportInstance}"><g:message code="default.button.edit.label"
																					  default="Edit"/></g:link>
			<g:actionSubmit class="delete" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
		</fieldset>
	</g:form>
</div>
</body>
</html>
