<#macro admin_left page_tab>
<div class="list-group">
  <#if sec.allGranted("admin:index")>
    <a href="/admin/index" class="list-group-item <#if page_tab == "index">active</#if>">仪表盘</a>
  </#if>
  <#if sec.allGranted("section:list")>
    <a href="/admin/section/list" class="list-group-item <#if page_tab == "section">active</#if>">版块管理</a> 
  </#if> 
  <#if sec.allGranted("reply:list")>
    <a href="/admin/reply/list" class="list-group-item <#if page_tab == "reply">active</#if>">回复管理</a>
  </#if>
  <#if sec.allGranted("user:list")>
    <a href="/admin/user/list" class="list-group-item <#if page_tab == "user">active</#if>">用户管理</a>
  </#if>
  <#if sec.allGranted("role:list")>
    <a href="/admin/role/list" class="list-group-item <#if page_tab == "role">active</#if>">角色管理</a>
  </#if>
  <#if sec.allGranted("permission:list")>
    <a href="/admin/permission/list" class="list-group-item <#if page_tab == "permission">active</#if>">权限管理</a>
  </#if>
  <#if sec.allGranted("index:all") || sec.allGranted("index:deleteAll")>
    <a href="/admin/indexed" class="list-group-item <#if page_tab == "indexed">active</#if>">索引管理</a>
  </#if>
</div>
</#macro>