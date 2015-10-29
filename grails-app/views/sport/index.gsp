<%@ page import="okylifeapi.Sport" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'sport.label', default: 'Sport')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-sport" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-sport" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="creationDate"
                              title="${message(code: 'sport.creationDate.label', default: 'Creation Date')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'sport.description.label', default: 'Description')}"/>

            <g:sortableColumn property="name" title="${message(code: 'sport.name.label', default: 'Name')}"/>

            <th><g:message code="sport.okiBar.label" default="Oki Bar"/></th>

            <th><g:message code="sport.startLocation.label" default="Start Location"/></th>

            <g:sortableColumn property="hydration"
                              title="${message(code: 'sport.hydration.label', default: 'Hydration')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${sportInstanceList}" status="i" var="sportInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${sportInstance.id}">${fieldValue(bean: sportInstance, field: "creationDate")}</g:link></td>

                <td>${fieldValue(bean: sportInstance, field: "description")}</td>

                <td>${fieldValue(bean: sportInstance, field: "name")}</td>

                <td>${fieldValue(bean: sportInstance, field: "okiBar")}</td>

                <td>${fieldValue(bean: sportInstance, field: "startLocation")}</td>

                <td>${fieldValue(bean: sportInstance, field: "hydration")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${sportInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
