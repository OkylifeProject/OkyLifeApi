<%@ page import="okylifeapi.EatActivity" %>



<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="eatActivity.creationDate.label" default="Creation Date"/>
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day" value="${eatActivityInstance?.creationDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="eatActivity.description.label" default="Description"/>

	</label>
	<g:textField name="description" value="${eatActivityInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="eatActivity.name.label" default="Name"/>
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${eatActivityInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'locations', 'error')} ">
	<label for="locations">
		<g:message code="eatActivity.locations.label" default="Locations"/>

	</label>

	<ul class="one-to-many">
		<g:each in="${eatActivityInstance?.locations ?}" var="l">
			<li><g:link controller="location" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:link controller="location" action="create"
					params="['eatActivity.id': eatActivityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'location.label', default: 'Location')])}</g:link>
		</li>
	</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="eatActivity.type.label" default="Type"/>
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${eatActivityInstance.constraints.type.inList}" required=""
			  value="${eatActivityInstance?.type}" valueMessagePrefix="eatActivity.type"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'portionSize', 'error')} required">
	<label for="portionSize">
		<g:message code="eatActivity.portionSize.label" default="Portion Size"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="portionSize" value="${fieldValue(bean: eatActivityInstance, field: 'portionSize')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'totalCarbohydrates', 'error')} required">
	<label for="totalCarbohydrates">
		<g:message code="eatActivity.totalCarbohydrates.label" default="Total Carbohydrates"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalCarbohydrates" value="${fieldValue(bean: eatActivityInstance, field: 'totalCarbohydrates')}"
			 required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'totalPortions', 'error')} required">
	<label for="totalPortions">
		<g:message code="eatActivity.totalPortions.label" default="Total Portions"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalPortions" value="${fieldValue(bean: eatActivityInstance, field: 'totalPortions')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'totalFat', 'error')} required">
	<label for="totalFat">
		<g:message code="eatActivity.totalFat.label" default="Total Fat"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalFat" value="${fieldValue(bean: eatActivityInstance, field: 'totalFat')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'totalProteins', 'error')} required">
	<label for="totalProteins">
		<g:message code="eatActivity.totalProteins.label" default="Total Proteins"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalProteins" value="${fieldValue(bean: eatActivityInstance, field: 'totalProteins')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'ingredients', 'error')} ">
	<label for="ingredients">
		<g:message code="eatActivity.ingredients.label" default="Ingredients"/>

	</label>

	<ul class="one-to-many">
		<g:each in="${eatActivityInstance?.ingredients ?}" var="i">
			<li><g:link controller="ingredient" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:link controller="ingredient" action="create"
					params="['eatActivity.id': eatActivityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ingredient.label', default: 'Ingredient')])}</g:link>
		</li>
	</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: eatActivityInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="eatActivity.user.label" default="User"/>
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${okylifeapi.User.list()}" optionKey="id" required=""
			  value="${eatActivityInstance?.user?.id}" class="many-to-one"/>

</div>

