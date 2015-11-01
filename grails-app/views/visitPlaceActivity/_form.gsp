<%@ page import="okylifeapi.VisitPlaceActivity" %>



<div class="fieldcontain ${hasErrors(bean: visitPlaceActivityInstance, field: 'creationDate', 'error')} required">
    <label for="creationDate">
        <g:message code="visitPlaceActivity.creationDate.label" default="Creation Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="creationDate" precision="day" value="${visitPlaceActivityInstance?.creationDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitPlaceActivityInstance, field: 'description', 'error')} ">
    <label for="description">
        <g:message code="visitPlaceActivity.description.label" default="Description"/>

    </label>
    <g:textField name="description" value="${visitPlaceActivityInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitPlaceActivityInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="visitPlaceActivity.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${visitPlaceActivityInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitPlaceActivityInstance, field: 'okiBar', 'error')} ">
    <label for="okiBar">
        <g:message code="visitPlaceActivity.okiBar.label" default="Oki Bar"/>

    </label>
    <g:select id="okiBar" name="okiBar.id" from="${okylifeapi.OkiBar.list()}" optionKey="id"
              value="${visitPlaceActivityInstance?.okiBar?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitPlaceActivityInstance, field: 'locations', 'error')} ">
    <label for="locations">
        <g:message code="visitPlaceActivity.locations.label" default="Locations"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${visitPlaceActivityInstance?.locations ?}" var="l">
            <li><g:link controller="location" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="location" action="create"
                    params="['visitPlaceActivity.id': visitPlaceActivityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'location.label', default: 'Location')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: visitPlaceActivityInstance, field: 'distance', 'error')} required">
    <label for="distance">
        <g:message code="visitPlaceActivity.distance.label" default="Distance"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="distance" value="${fieldValue(bean: visitPlaceActivityInstance, field: 'distance')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitPlaceActivityInstance, field: 'address', 'error')} required">
    <label for="address">
        <g:message code="visitPlaceActivity.address.label" default="Address"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="address" required="" value="${visitPlaceActivityInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitPlaceActivityInstance, field: 'type', 'error')} required">
    <label for="type">
        <g:message code="visitPlaceActivity.type.label" default="Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="type" required="" value="${visitPlaceActivityInstance?.type}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: visitPlaceActivityInstance, field: 'user', 'error')} required">
    <label for="user">
        <g:message code="visitPlaceActivity.user.label" default="User"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="user" name="user.id" from="${okylifeapi.User.list()}" optionKey="id" required=""
              value="${visitPlaceActivityInstance?.user?.id}" class="many-to-one"/>

</div>

