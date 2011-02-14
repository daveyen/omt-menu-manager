<div id="header">
<p><a class="header-main" href="${resource(dir:'')}"><img
	src="${resource(dir:'images',file:'grails_logo.png')}"</a></p>
<p class="header-sub">Menu Manager</p>
</div>


<div class="nav"><span class="menuButton"><a class="home"
	href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></span>

<g:if test="${session?.admin}">
	<span class="menuButton"><a class="create"
		href="${createLink(uri: '/admin/user')}"><g:message
		code="default.user" /></a></span>
	</span>

	<span class="menuButton"><a class="create"
		href="${createLink(uri: '/admin/layouts')}"><g:message
		code="admin.layouts" /></a></span>
	</span>
	<span class="menuButton"><a class="create"
		href="${createLink(uri: '/layouts/panel')}"><g:message
		code="layouts.panel" /></a></span>
	</span>
	<span class="menuButton"><a class="create"
		href="${createLink(uri: '/layouts/mainMenu')}"><g:message
		code="layouts.mainMenu" /></a></span>
	</span>
	<span class="menuButton"><a class="create"
		href="${createLink(uri: '/mainMenu/menu')}"><g:message
		code="mainMenu.Menu" /></a></span>
	</span>
	<span class="menuButton"><a class="create"
		href="${createLink(uri: '/menu/subMenu')}"><g:message
		code="menu.subMenu" /></a></span>
	</span>
	<span class="menuButton"><a class="create"
		href="${createLink(uri: '/subMenu/item')}"><g:message
		code="subMenu.item" /></a></span>
	</span>

	<span class="menuButton"><a class="logout"
		href="${createLink(uri: '/admin/logout')}"> <g:message
		code="user.logout" /></a></span>
</g:if><g:else>
	<span class="menuButton"><a class="login" href="${createLink(uri: '/admin/login')}"> <g:message code="user.login" />
		</a></span>
</g:else>

</div>