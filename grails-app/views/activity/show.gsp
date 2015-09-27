<%@ page import="okylifeapi.Activity" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-activity" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list activity">

        <g:if test="${activityInstance?.creationDate}">
            <li class="fieldcontain">
                <span id="creationDate-label" class="property-label"><g:message code="activity.creationDate.label"
                                                                                default="Creation Date"/></span>

                <span class="property-value" aria-labelledby="creationDate-label"><g:formatDate
                        date="${activityInstance?.creationDate}"/></span>

            </li>
        </g:if>

        <g:if test="${activityInstance?.activityType}">
            <li class="fieldcontain">
                <span id="activityType-label" class="property-label"><g:message code="activity.activityType.label"
                                                                                default="Activity Type"/></span>

                <span class="property-value" aria-labelledby="activityType-label"><g:fieldValue
                        bean="${activityInstance}" field="activityType"/></span>

            </li>
        </g:if>

        <g:if test="${activityInstance?.okiBar}">
            <li class="fieldcontain">
                <span id="okiBar-label" class="property-label"><g:message code="activity.okiBar.label"
                                                                          default="Oki Bar"/></span>

                <span class="property-value" aria-labelledby="okiBar-label"><g:link controller="okiBar" action="show"
                                                                                    id="${activityInstance?.okiBar?.id}">${activityInstance?.okiBar?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${activityInstance?.owner}">
            <li class="fieldcontain">
                <span id="owner-label" class="property-label"><g:message code="activity.owner.label"
                                                                         default="Owner"/></span>

                <span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show"
                                                                                   id="${activityInstance?.owner?.id}">${activityInstance?.owner?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: activityInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${activityInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>