<%@ page import="okylifeapi.VisitPlaceActivity" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'visitPlaceActivity.label', default: 'VisitPlaceActivity')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-visitPlaceActivity" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                         default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-visitPlaceActivity" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list visitPlaceActivity">

        <g:if test="${visitPlaceActivityInstance?.creationDate}">
            <li class="fieldcontain">
                <span id="creationDate-label" class="property-label"><g:message
                        code="visitPlaceActivity.creationDate.label" default="Creation Date"/></span>

                <span class="property-value" aria-labelledby="creationDate-label"><g:formatDate
                        date="${visitPlaceActivityInstance?.creationDate}"/></span>

            </li>
        </g:if>

        <g:if test="${visitPlaceActivityInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message
                        code="visitPlaceActivity.description.label" default="Description"/></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                        bean="${visitPlaceActivityInstance}" field="description"/></span>

            </li>
        </g:if>

        <g:if test="${visitPlaceActivityInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="visitPlaceActivity.name.label"
                                                                        default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue
                        bean="${visitPlaceActivityInstance}" field="name"/></span>

            </li>
        </g:if>

        <g:if test="${visitPlaceActivityInstance?.okiBar}">
            <li class="fieldcontain">
                <span id="okiBar-label" class="property-label"><g:message code="visitPlaceActivity.okiBar.label"
                                                                          default="Oki Bar"/></span>

                <span class="property-value" aria-labelledby="okiBar-label"><g:link controller="okiBar" action="show"
                                                                                    id="${visitPlaceActivityInstance?.okiBar?.id}">${visitPlaceActivityInstance?.okiBar?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${visitPlaceActivityInstance?.locations}">
            <li class="fieldcontain">
                <span id="locations-label" class="property-label"><g:message code="visitPlaceActivity.locations.label"
                                                                             default="Locations"/></span>

                <g:each in="${visitPlaceActivityInstance.locations}" var="l">
                    <span class="property-value" aria-labelledby="locations-label"><g:link controller="location"
                                                                                           action="show"
                                                                                           id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${visitPlaceActivityInstance?.distance}">
            <li class="fieldcontain">
                <span id="distance-label" class="property-label"><g:message code="visitPlaceActivity.distance.label"
                                                                            default="Distance"/></span>

                <span class="property-value" aria-labelledby="distance-label"><g:fieldValue
                        bean="${visitPlaceActivityInstance}" field="distance"/></span>

            </li>
        </g:if>

        <g:if test="${visitPlaceActivityInstance?.address}">
            <li class="fieldcontain">
                <span id="address-label" class="property-label"><g:message code="visitPlaceActivity.address.label"
                                                                           default="Address"/></span>

                <span class="property-value" aria-labelledby="address-label"><g:fieldValue
                        bean="${visitPlaceActivityInstance}" field="address"/></span>

            </li>
        </g:if>

        <g:if test="${visitPlaceActivityInstance?.type}">
            <li class="fieldcontain">
                <span id="type-label" class="property-label"><g:message code="visitPlaceActivity.type.label"
                                                                        default="Type"/></span>

                <span class="property-value" aria-labelledby="type-label"><g:fieldValue
                        bean="${visitPlaceActivityInstance}" field="type"/></span>

            </li>
        </g:if>

        <g:if test="${visitPlaceActivityInstance?.user}">
            <li class="fieldcontain">
                <span id="user-label" class="property-label"><g:message code="visitPlaceActivity.user.label"
                                                                        default="User"/></span>

                <span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show"
                                                                                  id="${visitPlaceActivityInstance?.user?.id}">${visitPlaceActivityInstance?.user?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: visitPlaceActivityInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${visitPlaceActivityInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
