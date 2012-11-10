<%@ page import="com.pkgplan.dream.Server" %>



<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'hostname', 'error')} required">
	<label for="hostname">
		<g:message code="server.hostname.label" default="Hostname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hostname" required="" value="${serverInstance?.hostname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'ipAddr', 'error')} required">
	<label for="ipAddr">
		<g:message code="server.ipAddr.label" default="Ip Addr" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ipAddr" pattern="${serverInstance.constraints.ipAddr.matches}" required="" value="${serverInstance?.ipAddr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'capacity', 'error')} required">
	<label for="capacity">
		<g:message code="server.capacity.label" default="Capacity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="capacity" type="number" min="1" value="${serverInstance.capacity}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="server.users.label" default="Users" />
		
	</label>
	<g:select name="users" from="${com.pkgplan.auth.User.list()}" multiple="multiple" optionKey="id" size="5" value="${serverInstance?.users*.id}" class="many-to-many"/>
</div>

