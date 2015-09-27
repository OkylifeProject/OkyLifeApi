<%@ page import="okylifeapi.Note" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'note.label', default: 'Note')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-note" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-note" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list note">

        <g:if test="${noteInstance?.imagePath}">
            <li class="fieldcontain">
                <span id="imagePath-label" class="property-label"><g:message code="note.imagePath.label"
                                                                             default="Image Path"/></span>

                <span class="property-value" aria-labelledby="imagePath-label"><g:fieldValue bean="${noteInstance}"
                                                                                             field="imagePath"/></span>

            </li>
        </g:if>

        <g:if test="${noteInstance?.content}">
            <li class="fieldcontain">
                <span id="content-label" class="property-label"><g:message code="note.content.label"
                                                                           default="Content"/></span>

                <span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${noteInstance}"
                                                                                           field="content"/></span>

            </li>
        </g:if>

        <g:if test="${noteInstance?.publicationDate}">
            <li class="fieldcontain">
                <span id="publicationDate-label" class="property-label"><g:message code="note.publicationDate.label"
                                                                                   default="Publication Date"/></span>

                <span class="property-value" aria-labelledby="publicationDate-label"><g:formatDate
                        date="${noteInstance?.publicationDate}"/></span>

            </li>
        </g:if>

        <g:if test="${noteInstance?.owner}">
            <li class="fieldcontain">
                <span id="owner-label" class="property-label"><g:message code="note.owner.label"
                                                                         default="Owner"/></span>

                <span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show"
                                                                                   id="${noteInstance?.owner?.id}">${noteInstance?.owner?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: noteInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${noteInstance}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
