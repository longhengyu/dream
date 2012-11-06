<%@ page import="com.pkgplan.dream.Server" %>



<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'activeUserNum', 'error')} required">
	<label for="activeUserNum">
		<g:message code="server.activeUserNum.label" default="Active User Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="activeUserNum" type="number" value="${serverInstance.activeUserNum}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'capacity', 'error')} required">
	<label for="capacity">
		<g:message code="server.capacity.label" default="Capacity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="capacity" type="number" value="${serverInstance.capacity}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'hostname', 'error')} ">
	<label for="hostname">
		<g:message code="server.hostname.label" default="Hostname" />
		
	</label>
	<g:textField name="hostname" value="${serverInstance?.hostname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'ipAddr', 'error')} ">
	<label for="ipAddr">
		<g:message code="server.ipAddr.label" default="Ip Addr" />
		
	</label>
	<g:textField name="ipAddr" value="${serverInstance?.ipAddr}"/>
</div>

