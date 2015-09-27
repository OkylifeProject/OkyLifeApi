<%@ page import="okylifeapi.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'subject', 'error')} required">
    <label for="subject">
        <g:message code="message.subject.label" default="Subject"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="subject" required="" value="${messageInstance?.subject}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'content', 'error')} required">
    <label for="content">
        <g:message code="message.content.label" default="Content"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="content" required="" value="${messageInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'remitent', 'error')} required">
    <label for="remitent">
        <g:message code="message.remitent.label" default="Remitent"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="remitent" name="remitent.id" from="${okylifeapi.User.list()}" optionKey="id" required=""
              value="${messageInstance?.remitent?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'recipient', 'error')} required">
    <label for="recipient">
        <g:message code="message.recipient.label" default="Recipient"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="recipient" name="recipient.id" from="${okylifeapi.User.list()}" optionKey="id" required=""
              value="${messageInstance?.recipient?.id}" class="many-to-one"/>

</div>

