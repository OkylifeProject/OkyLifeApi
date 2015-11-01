
<%@ page import="okylifeapi.SportActivity" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'sportActivity.label', default: 'SportActivity')}"/>
	<title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-sportActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
																	default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label"
															  args="[entityName]"/></g:link></li>
	</ul>
</div>

<div id="show-sportActivity" class="content scaffold-show" role="main">
	<h1><g:message code="default.show.label" args="[entityName]"/></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<ol class="property-list sportActivity">

		<g:if test="${sportActivityInstance?.creationDate}">
			<li class="fieldcontain">
				<span id="creationDate-label" class="property-label"><g:message code="sportActivity.creationDate.label"
																				default="Creation Date"/></span>

				<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate
						date="${sportActivityInstance?.creationDate}"/></span>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.description}">
			<li class="fieldcontain">
				<span id="description-label" class="property-label"><g:message code="sportActivity.description.label"
																			   default="Description"/></span>

				<span class="property-value" aria-labelledby="description-label"><g:fieldValue
						bean="${sportActivityInstance}" field="description"/></span>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.name}">
			<li class="fieldcontain">
				<span id="name-label" class="property-label"><g:message code="sportActivity.name.label"
																		default="Name"/></span>

				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${sportActivityInstance}"
																						field="name"/></span>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.locations}">
			<li class="fieldcontain">
				<span id="locations-label" class="property-label"><g:message code="sportActivity.locations.label"
																			 default="Locations"/></span>

				<g:each in="${sportActivityInstance.locations}" var="l">
					<span class="property-value" aria-labelledby="locations-label"><g:link controller="location"
																						   action="show"
																						   id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
				</g:each>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.hydration}">
			<li class="fieldcontain">
				<span id="hydration-label" class="property-label"><g:message code="sportActivity.hydration.label"
																			 default="Hydration"/></span>

				<span class="property-value" aria-labelledby="hydration-label"><g:fieldValue
						bean="${sportActivityInstance}" field="hydration"/></span>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.duration}">
			<li class="fieldcontain">
				<span id="duration-label" class="property-label"><g:message code="sportActivity.duration.label"
																			default="Duration"/></span>

				<span class="property-value" aria-labelledby="duration-label"><g:fieldValue
						bean="${sportActivityInstance}" field="duration"/></span>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.rhythm}">
			<li class="fieldcontain">
				<span id="rhythm-label" class="property-label"><g:message code="sportActivity.rhythm.label"
																		  default="Rhythm"/></span>

				<span class="property-value" aria-labelledby="rhythm-label"><g:fieldValue
						bean="${sportActivityInstance}" field="rhythm"/></span>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.velocity}">
			<li class="fieldcontain">
				<span id="velocity-label" class="property-label"><g:message code="sportActivity.velocity.label"
																			default="Velocity"/></span>

				<span class="property-value" aria-labelledby="velocity-label"><g:fieldValue
						bean="${sportActivityInstance}" field="velocity"/></span>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.distance}">
			<li class="fieldcontain">
				<span id="distance-label" class="property-label"><g:message code="sportActivity.distance.label"
																			default="Distance"/></span>

				<span class="property-value" aria-labelledby="distance-label"><g:fieldValue
						bean="${sportActivityInstance}" field="distance"/></span>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.targetDistance}">
			<li class="fieldcontain">
				<span id="targetDistance-label" class="property-label"><g:message
						code="sportActivity.targetDistance.label" default="Target Distance"/></span>

				<span class="property-value" aria-labelledby="targetDistance-label"><g:fieldValue
						bean="${sportActivityInstance}" field="targetDistance"/></span>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.type}">
			<li class="fieldcontain">
				<span id="type-label" class="property-label"><g:message code="sportActivity.type.label"
																		default="Type"/></span>

				<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${sportActivityInstance}"
																						field="type"/></span>

			</li>
		</g:if>

		<g:if test="${sportActivityInstance?.user}">
			<li class="fieldcontain">
				<span id="user-label" class="property-label"><g:message code="sportActivity.user.label"
																		default="User"/></span>

				<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show"
																				  id="${sportActivityInstance?.user?.id}">${sportActivityInstance?.user?.encodeAsHTML()}</g:link></span>

			</li>
		</g:if>

	</ol>
	<g:form url="[resource: sportActivityInstance, action: 'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="edit" action="edit" resource="${sportActivityInstance}"><g:message
					code="default.button.edit.label" default="Edit"/></g:link>
			<g:actionSubmit class="delete" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
		</fieldset>
	</g:form>
</div>
</body>
</html>
