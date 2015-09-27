<%@ page import="okylifeapi.Note" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'note.label', default: 'Note')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-note" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-note" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="imagePath"
                              title="${message(code: 'note.imagePath.label', default: 'Image Path')}"/>

            <g:sortableColumn property="content" title="${message(code: 'note.content.label', default: 'Content')}"/>

            <g:sortableColumn property="publicationDate"
                              title="${message(code: 'note.publicationDate.label', default: 'Publication Date')}"/>

            <th><g:message code="note.owner.label" default="Owner"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${noteInstanceList}" status="i" var="noteInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${noteInstance.id}">${fieldValue(bean: noteInstance, field: "imagePath")}</g:link></td>

                <td>${fieldValue(bean: noteInstance, field: "content")}</td>

                <td><g:formatDate date="${noteInstance.publicationDate}"/></td>

                <td>${fieldValue(bean: noteInstance, field: "owner")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${noteInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
