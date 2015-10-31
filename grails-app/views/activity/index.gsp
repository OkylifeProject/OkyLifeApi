
<%@ page import="okylifeapi.Activity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="creationDate" title="${message(code: 'activity.creationDate.label', default: 'Creation Date')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'activity.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'activity.name.label', default: 'Name')}" />
					
						<th><g:message code="activity.okiBar.label" default="Oki Bar" /></th>

						<th><g:message code="activity.user.label" default="User"/></th>

					</tr>
				</thead>
				<tbody>
				<g:each in="${activityInstanceList}" status="i" var="activityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityInstance.id}">${fieldValue(bean: activityInstance, field: "creationDate")}</g:link></td>
					
						<td>${fieldValue(bean: activityInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "okiBar")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
