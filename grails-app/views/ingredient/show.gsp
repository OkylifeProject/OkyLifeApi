<%@ page import="okylifeapi.Ingredient" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'ingredient.label', default: 'Ingredient')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-ingredient" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-ingredient" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list ingredient">

        <g:if test="${ingredientInstance?.number}">
            <li class="fieldcontain">
                <span id="number-label" class="property-label"><g:message code="ingredient.number.label"
                                                                          default="Number"/></span>

                <span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${ingredientInstance}"
                                                                                          field="number"/></span>

            </li>
        </g:if>

        <g:if test="${ingredientInstance?.fat}">
            <li class="fieldcontain">
                <span id="fat-label" class="property-label"><g:message code="ingredient.fat.label"
                                                                       default="Fat"/></span>

                <span class="property-value" aria-labelledby="fat-label"><g:fieldValue bean="${ingredientInstance}"
                                                                                       field="fat"/></span>

            </li>
        </g:if>

        <g:if test="${ingredientInstance?.carbohydrates}">
            <li class="fieldcontain">
                <span id="carbohydrates-label" class="property-label"><g:message code="ingredient.carbohydrates.label"
                                                                                 default="Carbohydrates"/></span>

                <span class="property-value" aria-labelledby="carbohydrates-label"><g:fieldValue
                        bean="${ingredientInstance}" field="carbohydrates"/></span>

            </li>
        </g:if>

        <g:if test="${ingredientInstance?.proteins}">
            <li class="fieldcontain">
                <span id="proteins-label" class="property-label"><g:message code="ingredient.proteins.label"
                                                                            default="Proteins"/></span>

                <span class="property-value" aria-labelledby="proteins-label"><g:fieldValue bean="${ingredientInstance}"
                                                                                            field="proteins"/></span>

            </li>
        </g:if>

        <g:if test="${ingredientInstance?.brand}">
            <li class="fieldcontain">
                <span id="brand-label" class="property-label"><g:message code="ingredient.brand.label"
                                                                         default="Brand"/></span>

                <span class="property-value" aria-labelledby="brand-label"><g:fieldValue bean="${ingredientInstance}"
                                                                                         field="brand"/></span>

            </li>
        </g:if>

        <g:if test="${ingredientInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="ingredient.description.label"
                                                                               default="Description"/></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue
                        bean="${ingredientInstance}" field="description"/></span>

            </li>
        </g:if>

        <g:if test="${ingredientInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="ingredient.name.label"
                                                                        default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${ingredientInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: ingredientInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${ingredientInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
