<%@ page import="okylifeapi.Note" %>



<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'imagePath', 'error')} ">
    <label for="imagePath">
        <g:message code="note.imagePath.label" default="Image Path"/>

    </label>
    <g:textField name="imagePath" value="${noteInstance?.imagePath}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'content', 'error')} required">
    <label for="content">
        <g:message code="note.content.label" default="Content"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="content" required="" value="${noteInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'publicationDate', 'error')} required">
    <label for="publicationDate">
        <g:message code="note.publicationDate.label" default="Publication Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="publicationDate" precision="day" value="${noteInstance?.publicationDate}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'owner', 'error')} required">
    <label for="owner">
        <g:message code="note.owner.label" default="Owner"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="owner" name="owner.id" from="${okylifeapi.User.list()}" optionKey="id" required=""
              value="${noteInstance?.owner?.id}" class="many-to-one"/>

</div>

