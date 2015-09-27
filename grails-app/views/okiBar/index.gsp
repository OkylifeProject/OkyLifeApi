<%@ page import="okylifeapi.OkiBar" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'okiBar.label', default: 'OkiBar')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-okiBar" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-okiBar" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="calories"
                              title="${message(code: 'okiBar.calories.label', default: 'Calories')}"/>

            <g:sortableColumn property="steps" title="${message(code: 'okiBar.steps.label', default: 'Steps')}"/>

            <g:sortableColumn property="speed" title="${message(code: 'okiBar.speed.label', default: 'Speed')}"/>

            <g:sortableColumn property="hydration"
                              title="${message(code: 'okiBar.hydration.label', default: 'Hydration')}"/>

            <g:sortableColumn property="duration"
                              title="${message(code: 'okiBar.duration.label', default: 'Duration')}"/>

            <g:sortableColumn property="rythm" title="${message(code: 'okiBar.rythm.label', default: 'Rythm')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${okiBarInstanceList}" status="i" var="okiBarInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${okiBarInstance.id}">${fieldValue(bean: okiBarInstance, field: "calories")}</g:link></td>

                <td>${fieldValue(bean: okiBarInstance, field: "steps")}</td>

                <td>${fieldValue(bean: okiBarInstance, field: "speed")}</td>

                <td>${fieldValue(bean: okiBarInstance, field: "hydration")}</td>

                <td>${fieldValue(bean: okiBarInstance, field: "duration")}</td>

                <td>${fieldValue(bean: okiBarInstance, field: "rythm")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${okiBarInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
