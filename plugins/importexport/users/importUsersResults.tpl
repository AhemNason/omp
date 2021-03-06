{**
 * importUsersResults.tpl
 *
 * Copyright (c) 2003-2013 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show the results of importing users.
 *}
{strip}
{assign var="pageTitle" value="plugins.importexport.users.import.importUsers"}
{include file="common/header.tpl"}
{/strip}

{translate key="plugins.importexport.users.import.usersWereImported"}:
<table width="100%" class="pkp_listing">
	<tr>
		<td colspan="4" class="headseparator">&nbsp;</td>
	</tr>
	<tr class="heading" valign="bottom">
		<td width="15%">{translate key="user.username"}</td>
		<td width="25%">{translate key="user.name"}</td>
		<td width="30%">{translate key="user.email"}</td>
		<td width="30%" align="right">{translate key="common.action"}</td>
	</tr>
	<tr>
		<td colspan="4" class="headseparator">&nbsp;</td>
	</tr>
	{foreach name=importedUsers from=$importedUsers item=user}
	<tr valign="top">
		<td><a href="{url page="management" op="userProfile" path=$user->getId()}">{$user->getUsername()|escape}</a></td>
		<td>{$user->getFullName()|escape}</td>
		<td>{$user->getEmail()|escape}</td>
		<td align="right" class="nowrap">
			<a href="{url page="login" op="signInAsUser" path=$user->getId()}" class="action">{translate key="manager.people.signInAs"}</a>
		</td>
	</tr>
	<tr>
		<td colspan="4" class="{if $smarty.foreach.importedUsers.last}end{/if}separator">&nbsp;</td>
	</tr>
	{foreachelse}
	<tr>
		<td colspan="4" class="nodata">{translate key="manager.people.noneEnrolled"}</td>
	</tr>
	<tr>
		<td colspan="4" class="endseparator">&nbsp;</td>
	</tr>
{/foreach}
</table>

{if $isError}
<p class="pkp_form">
	<span class="pkp_form_error">{translate key="plugins.importexport.users.import.errorsOccurred"}:</span>
	<ul class="pkp_form_error_list">
	{foreach key=field item=message from=$errors}
		<li>{$message}</li>
	{/foreach}
	</ul>
</p>
{/if}

{include file="common/footer.tpl"}
