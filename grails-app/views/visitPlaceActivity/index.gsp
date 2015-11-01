<%@ page import="okylifeapi.VisitPlaceActivity" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'visitPlaceActivity.label', default: 'VisitPlaceActivity')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-visitPlaceActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                         default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-visitPlaceActivity" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="creationDate"
                              title="${message(code: 'visitPlaceActivity.creationDate.label', default: 'Creation Date')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'visitPlaceActivity.description.label', default: 'Description')}"/>

            <g:sortableColumn property="name"
                              title="${message(code: 'visitPlaceActivity.name.label', default: 'Name')}"/>

            <th><g:message code="visitPlaceActivity.okiBar.label" default="Oki Bar"/></th>

            <g:sortableColumn property="distance"
                              title="${message(code: 'visitPlaceActivity.distance.label', default: 'Distance')}"/>

            <g:sortableColumn property="address"
                              title="${message(code: 'visitPlaceActivity.address.label', default: 'Address')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${visitPlaceActivityInstanceList}" status="i" var="visitPlaceActivityInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${visitPlaceActivityInstance.id}">${fieldValue(bean: visitPlaceActivityInstance, field: "creationDate")}</g:link></td>

                <td>${fieldValue(bean: visitPlaceActivityInstance, field: "description")}</td>

                <td>${fieldValue(bean: visitPlaceActivityInstance, field: "name")}</td>

                <td>${fieldValue(bean: visitPlaceActivityInstance, field: "okiBar")}</td>

                <td>${fieldValue(bean: visitPlaceActivityInstance, field: "distance")}</td>

                <td>${fieldValue(bean: visitPlaceActivityInstance, field: "address")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${visitPlaceActivityInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
