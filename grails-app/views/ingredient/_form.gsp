<%@ page import="okylifeapi.Ingredient" %>



<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="ingredient.number.label" default="Number"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" value="${fieldValue(bean: ingredientInstance, field: 'number')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'fat', 'error')} required">
	<label for="fat">
		<g:message code="ingredient.fat.label" default="Fat"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fat" value="${fieldValue(bean: ingredientInstance, field: 'fat')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'calories', 'error')} required">
	<label for="calories">
		<g:message code="ingredient.calories.label" default="Calories"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="calories" value="${fieldValue(bean: ingredientInstance, field: 'calories')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'carbohydrates', 'error')} required">
	<label for="carbohydrates">
		<g:message code="ingredient.carbohydrates.label" default="Carbohydrates"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="carbohydrates" value="${fieldValue(bean: ingredientInstance, field: 'carbohydrates')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'proteins', 'error')} required">
	<label for="proteins">
		<g:message code="ingredient.proteins.label" default="Proteins"/>
		<span class="required-indicator">*</span>
	</label>
	<g:field name="proteins" value="${fieldValue(bean: ingredientInstance, field: 'proteins')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'rationType', 'error')} required">
	<label for="rationType">
		<g:message code="ingredient.rationType.label" default="Ration Type"/>
		<span class="required-indicator">*</span>
	</label>
	<g:select name="rationType" from="${ingredientInstance.constraints.rationType.inList}" required=""
			  value="${ingredientInstance?.rationType}" valueMessagePrefix="ingredient.rationType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="ingredient.description.label" default="Description"/>
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${ingredientInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'eatActivity', 'error')} required">
	<label for="eatActivity">
		<g:message code="ingredient.eatActivity.label" default="Eat Activity"/>
		<span class="required-indicator">*</span>
	</label>
	<g:select id="eatActivity" name="eatActivity.id" from="${okylifeapi.EatActivity.list()}" optionKey="id" required=""
			  value="${ingredientInstance?.eatActivity?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="ingredient.name.label" default="Name"/>
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${ingredientInstance?.name}"/>

</div>

