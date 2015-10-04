<%@ page import="okylifeapi.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${userInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${userInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'sex', 'error')} required">
	<label for="sex">
		<g:message code="user.sex.label" default="Sex" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="sex" from="${userInstance.constraints.sex.inList}" required="" value="${userInstance?.sex}" valueMessagePrefix="user.sex"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'imagePath', 'error')} ">
	<label for="imagePath">
		<g:message code="user.imagePath.label" default="Image Path" />
		
	</label>
	<g:textField name="imagePath" value="${userInstance?.imagePath}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:field type="password" name="password" maxlength="100" pattern="${userInstance.constraints.password.matches}" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'age', 'error')} ">
	<label for="age">
		<g:message code="user.age.label" default="Age" />
		
	</label>
	<g:textField name="age" value="${userInstance?.age}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'registerType', 'error')} required">
	<label for="registerType">
		<g:message code="user.registerType.label" default="Register Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="registerType" from="${userInstance.constraints.registerType.inList}" required="" value="${userInstance?.registerType}" valueMessagePrefix="user.registerType"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'activities', 'error')} ">
	<label for="activities">
		<g:message code="user.activities.label" default="Activities" />
		
	</label>
	<g:select name="activities" from="${okylifeapi.Activity.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.activities*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'friends', 'error')} ">
	<label for="friends">
		<g:message code="user.friends.label" default="Friends" />
		
	</label>
	<g:select name="friends" from="${okylifeapi.User.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.friends*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'messages', 'error')} ">
	<label for="messages">
		<g:message code="user.messages.label" default="Messages" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.messages?}" var="m">
    <li><g:link controller="message" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="message" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'message.label', default: 'Message')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="user.notes.label" default="Notes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.notes?}" var="n">
    <li><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="note" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'note.label', default: 'Note')])}</g:link>
</li>
</ul>


</div>

