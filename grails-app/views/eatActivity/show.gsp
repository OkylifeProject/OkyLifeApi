
<%@ page import="okylifeapi.EatActivity" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'eatActivity.label', default: 'EatActivity')}"/>
	<title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-eatActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
																  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label"
															  args="[entityName]"/></g:link></li>
	</ul>
</div>

<div id="show-eatActivity" class="content scaffold-show" role="main">
	<h1><g:message code="default.show.label" args="[entityName]"/></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<ol class="property-list eatActivity">

		<g:if test="${eatActivityInstance?.creationDate}">
			<li class="fieldcontain">
				<span id="creationDate-label" class="property-label"><g:message code="eatActivity.creationDate.label"
																				default="Creation Date"/></span>

				<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate
						date="${eatActivityInstance?.creationDate}"/></span>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.description}">
			<li class="fieldcontain">
				<span id="description-label" class="property-label"><g:message code="eatActivity.description.label"
																			   default="Description"/></span>

				<span class="property-value" aria-labelledby="description-label"><g:fieldValue
						bean="${eatActivityInstance}" field="description"/></span>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.name}">
			<li class="fieldcontain">
				<span id="name-label" class="property-label"><g:message code="eatActivity.name.label"
																		default="Name"/></span>

				<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${eatActivityInstance}"
																						field="name"/></span>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.locations}">
			<li class="fieldcontain">
				<span id="locations-label" class="property-label"><g:message code="eatActivity.locations.label"
																			 default="Locations"/></span>

				<g:each in="${eatActivityInstance.locations}" var="l">
					<span class="property-value" aria-labelledby="locations-label"><g:link controller="location"
																						   action="show"
																						   id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
				</g:each>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.type}">
			<li class="fieldcontain">
				<span id="type-label" class="property-label"><g:message code="eatActivity.type.label"
																		default="Type"/></span>

				<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${eatActivityInstance}"
																						field="type"/></span>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.portionSize}">
			<li class="fieldcontain">
				<span id="portionSize-label" class="property-label"><g:message code="eatActivity.portionSize.label"
																			   default="Portion Size"/></span>

				<span class="property-value" aria-labelledby="portionSize-label"><g:fieldValue
						bean="${eatActivityInstance}" field="portionSize"/></span>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.totalCarbohydrates}">
			<li class="fieldcontain">
				<span id="totalCarbohydrates-label" class="property-label"><g:message
						code="eatActivity.totalCarbohydrates.label" default="Total Carbohydrates"/></span>

				<span class="property-value" aria-labelledby="totalCarbohydrates-label"><g:fieldValue
						bean="${eatActivityInstance}" field="totalCarbohydrates"/></span>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.totalPortions}">
			<li class="fieldcontain">
				<span id="totalPortions-label" class="property-label"><g:message code="eatActivity.totalPortions.label"
																				 default="Total Portions"/></span>

				<span class="property-value" aria-labelledby="totalPortions-label"><g:fieldValue
						bean="${eatActivityInstance}" field="totalPortions"/></span>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.totalFat}">
			<li class="fieldcontain">
				<span id="totalFat-label" class="property-label"><g:message code="eatActivity.totalFat.label"
																			default="Total Fat"/></span>

				<span class="property-value" aria-labelledby="totalFat-label"><g:fieldValue
						bean="${eatActivityInstance}" field="totalFat"/></span>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.totalProteins}">
			<li class="fieldcontain">
				<span id="totalProteins-label" class="property-label"><g:message code="eatActivity.totalProteins.label"
																				 default="Total Proteins"/></span>

				<span class="property-value" aria-labelledby="totalProteins-label"><g:fieldValue
						bean="${eatActivityInstance}" field="totalProteins"/></span>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.ingredients}">
			<li class="fieldcontain">
				<span id="ingredients-label" class="property-label"><g:message code="eatActivity.ingredients.label"
																			   default="Ingredients"/></span>

				<g:each in="${eatActivityInstance.ingredients}" var="i">
					<span class="property-value" aria-labelledby="ingredients-label"><g:link controller="ingredient"
																							 action="show"
																							 id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
				</g:each>

			</li>
		</g:if>

		<g:if test="${eatActivityInstance?.user}">
			<li class="fieldcontain">
				<span id="user-label" class="property-label"><g:message code="eatActivity.user.label"
																		default="User"/></span>

				<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show"
																				  id="${eatActivityInstance?.user?.id}">${eatActivityInstance?.user?.encodeAsHTML()}</g:link></span>

			</li>
		</g:if>

	</ol>
	<g:form url="[resource: eatActivityInstance, action: 'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="edit" action="edit" resource="${eatActivityInstance}"><g:message
					code="default.button.edit.label" default="Edit"/></g:link>
			<g:actionSubmit class="delete" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
		</fieldset>
	</g:form>
</div>
</body>
</html>
