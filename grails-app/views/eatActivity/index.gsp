<%@ page import="okylifeapi.EatActivity" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'eatActivity.label', default: 'EatActivity')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-eatActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-eatActivity" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="creationDate"
                              title="${message(code: 'eatActivity.creationDate.label', default: 'Creation Date')}"/>

            <g:sortableColumn property="description"
                              title="${message(code: 'eatActivity.description.label', default: 'Description')}"/>

            <g:sortableColumn property="name" title="${message(code: 'eatActivity.name.label', default: 'Name')}"/>

            <th><g:message code="eatActivity.okiBar.label" default="Oki Bar"/></th>

            <g:sortableColumn property="type" title="${message(code: 'eatActivity.type.label', default: 'Type')}"/>

            <g:sortableColumn property="portionSize"
                              title="${message(code: 'eatActivity.portionSize.label', default: 'Portion Size')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${eatActivityInstanceList}" status="i" var="eatActivityInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${eatActivityInstance.id}">${fieldValue(bean: eatActivityInstance, field: "creationDate")}</g:link></td>

                <td>${fieldValue(bean: eatActivityInstance, field: "description")}</td>

                <td>${fieldValue(bean: eatActivityInstance, field: "name")}</td>

                <td>${fieldValue(bean: eatActivityInstance, field: "okiBar")}</td>

                <td>${fieldValue(bean: eatActivityInstance, field: "type")}</td>

                <td>${fieldValue(bean: eatActivityInstance, field: "portionSize")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${eatActivityInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
