
<%@ page import="okylifeapi.Ingredient" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}"/>
	<title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-ingredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
																 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label"
															  args="[entityName]"/></g:link></li>
	</ul>
</div>

<div id="list-ingredient" class="content scaffold-list" role="main">
	<h1><g:message code="default.list.label" args="[entityName]"/></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<table>
		<thead>
		<tr>

			<g:sortableColumn property="number" title="${message(code: 'ingredient.number.label', default: 'Number')}"/>

			<g:sortableColumn property="fat" title="${message(code: 'ingredient.fat.label', default: 'Fat')}"/>

			<g:sortableColumn property="calories"
							  title="${message(code: 'ingredient.calories.label', default: 'Calories')}"/>

			<g:sortableColumn property="carbohydrates"
							  title="${message(code: 'ingredient.carbohydrates.label', default: 'Carbohydrates')}"/>

			<g:sortableColumn property="proteins"
							  title="${message(code: 'ingredient.proteins.label', default: 'Proteins')}"/>

			<g:sortableColumn property="rationType"
							  title="${message(code: 'ingredient.rationType.label', default: 'Ration Type')}"/>

		</tr>
		</thead>
		<tbody>
		<g:each in="${ingredientInstanceList}" status="i" var="ingredientInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:link action="show"
							id="${ingredientInstance.id}">${fieldValue(bean: ingredientInstance, field: "number")}</g:link></td>

				<td>${fieldValue(bean: ingredientInstance, field: "fat")}</td>

				<td>${fieldValue(bean: ingredientInstance, field: "calories")}</td>

				<td>${fieldValue(bean: ingredientInstance, field: "carbohydrates")}</td>

				<td>${fieldValue(bean: ingredientInstance, field: "proteins")}</td>

				<td>${fieldValue(bean: ingredientInstance, field: "rationType")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>

	<div class="pagination">
		<g:paginate total="${ingredientInstanceCount ?: 0}"/>
	</div>
</div>
</body>
</html>
