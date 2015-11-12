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

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'brand', 'error')} required">
    <label for="brand">
        <g:message code="ingredient.brand.label" default="Brand"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="brand" required="" value="${ingredientInstance?.brand}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="ingredient.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="description" required="" value="${ingredientInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="ingredient.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${ingredientInstance?.name}"/>

</div>

