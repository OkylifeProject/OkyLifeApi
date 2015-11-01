
<%@ page import="okylifeapi.SportActivity" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'sportActivity.label', default: 'SportActivity')}"/>
	<title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-sportActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
																	default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><g:link class="create" action="create"><g:message code="default.new.label"
															  args="[entityName]"/></g:link></li>
	</ul>
</div>

<div id="list-sportActivity" class="content scaffold-list" role="main">
	<h1><g:message code="default.list.label" args="[entityName]"/></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<table>
		<thead>
		<tr>

			<g:sortableColumn property="creationDate"
							  title="${message(code: 'sportActivity.creationDate.label', default: 'Creation Date')}"/>

			<g:sortableColumn property="description"
							  title="${message(code: 'sportActivity.description.label', default: 'Description')}"/>

			<g:sortableColumn property="name" title="${message(code: 'sportActivity.name.label', default: 'Name')}"/>

			<g:sortableColumn property="hydration"
							  title="${message(code: 'sportActivity.hydration.label', default: 'Hydration')}"/>

			<g:sortableColumn property="duration"
							  title="${message(code: 'sportActivity.duration.label', default: 'Duration')}"/>

			<g:sortableColumn property="rhythm"
							  title="${message(code: 'sportActivity.rhythm.label', default: 'Rhythm')}"/>

		</tr>
		</thead>
		<tbody>
		<g:each in="${sportActivityInstanceList}" status="i" var="sportActivityInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:link action="show"
							id="${sportActivityInstance.id}">${fieldValue(bean: sportActivityInstance, field: "creationDate")}</g:link></td>

				<td>${fieldValue(bean: sportActivityInstance, field: "description")}</td>

				<td>${fieldValue(bean: sportActivityInstance, field: "name")}</td>

				<td>${fieldValue(bean: sportActivityInstance, field: "hydration")}</td>

				<td>${fieldValue(bean: sportActivityInstance, field: "duration")}</td>

				<td>${fieldValue(bean: sportActivityInstance, field: "rhythm")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>

	<div class="pagination">
		<g:paginate total="${sportActivityInstanceCount ?: 0}"/>
	</div>
</div>
</body>
</html>
