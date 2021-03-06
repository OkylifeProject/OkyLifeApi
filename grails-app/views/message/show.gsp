<%@ page import="okylifeapi.Message" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-message" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-message" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list message">

        <g:if test="${messageInstance?.subject}">
            <li class="fieldcontain">
                <span id="subject-label" class="property-label"><g:message code="message.subject.label"
                                                                           default="Subject"/></span>

                <span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${messageInstance}"
                                                                                           field="subject"/></span>

            </li>
        </g:if>

        <g:if test="${messageInstance?.content}">
            <li class="fieldcontain">
                <span id="content-label" class="property-label"><g:message code="message.content.label"
                                                                           default="Content"/></span>

                <span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${messageInstance}"
                                                                                           field="content"/></span>

            </li>
        </g:if>

        <g:if test="${messageInstance?.remitent}">
            <li class="fieldcontain">
                <span id="remitent-label" class="property-label"><g:message code="message.remitent.label"
                                                                            default="Remitent"/></span>

                <span class="property-value" aria-labelledby="remitent-label"><g:link controller="user" action="show"
                                                                                      id="${messageInstance?.remitent?.id}">${messageInstance?.remitent?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${messageInstance?.recipient}">
            <li class="fieldcontain">
                <span id="recipient-label" class="property-label"><g:message code="message.recipient.label"
                                                                             default="Recipient"/></span>

                <span class="property-value" aria-labelledby="recipient-label"><g:link controller="user" action="show"
                                                                                       id="${messageInstance?.recipient?.id}">${messageInstance?.recipient?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: messageInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${messageInstance}"><g:message code="default.button.edit.label"
                                                                                        default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
