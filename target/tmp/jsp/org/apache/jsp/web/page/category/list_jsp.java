/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: jetty/9.3.7.v20160115
 * Generated at: 2019-07-18 03:17:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.web.page.category;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/web/header.jsp", Long.valueOf(1562066721334L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");

    String app = request.getContextPath();
    app += "/web";
    String path = app + "/common";

      out.write("\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\r\n");
      out.write("<meta name=\"renderer\" content=\"webkit\">\r\n");
      out.write("<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">\r\n");
      out.write("<meta name=\"apple-mobile-web-app-capable\" content=\"yes\">\r\n");
      out.write("<meta name=\"format-detection\" content=\"telephone=no\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n");
      out.write("\r\n");
      out.write("<link rel=\"icon\" href=\"");
      out.print(path);
      out.write("/img/logo.ico\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(path);
      out.write("/layui/css/layui.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(path);
      out.write("/layui/layui.all.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"");
      out.print(path);
      out.write("/js/common.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\t<title>商品分类维护</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div class=\"layui-collapse\">\r\n");
      out.write("  <div class=\"layui-colla-item\">\r\n");
      out.write("    <h2 class=\"layui-colla-title\">商品分类信息-查询条件</h2>\r\n");
      out.write("    <div class=\"layui-colla-content layui-show\">\r\n");
      out.write("\t<fieldset class=\"layui-elem-field layui-field-title\" style=\"margin-top: 0px; padding: 5px\">\r\n");
      out.write("\t\t<legend>商品分类信息-查询条件</legend>\r\n");
      out.write("\t\t<form class=\"layui-form\">\r\n");
      out.write("\t\t\t<div class=\"layui-form-item\">\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\" style=\"width: 100px\">商品分类编号</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"code\" placeholder=\"请输入分类编号\" autocomplete=\"off\" class=\"layui-input\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<label class=\"layui-form-label\" style=\"width: 100px\">商品分类名称</label>\r\n");
      out.write("\t\t\t\t<div class=\"layui-input-inline\">\r\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"name\" placeholder=\"请输入分类名称\" autocomplete=\"off\" class=\"layui-input\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"pageIndex\" value=\"1\" />\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"pageLimit\" value=\"10\" />\r\n");
      out.write("\t\t\t\t<span> \r\n");
      out.write("\t\t\t\t<input type=\"button\" class=\"layui-btn\" lay-submit lay-filter=\"search\" value=\"查询\" /> \r\n");
      out.write("\t\t\t\t<input type=\"reset\" class=\"layui-btn\" value=\"重置\" /> \r\n");
      out.write("\t\t\t\t<input type=\"button\" class=\"layui-btn\" value=\"添加\" onclick=\"openAdd()\" />\r\n");
      out.write("\t\t\t\t</span>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</fieldset>\r\n");
      out.write("\t</div></div></div>\r\n");
      out.write("\t<div class=\"layui-form\">\r\n");
      out.write("\t\t<table class=\"layui-table\">\r\n");
      out.write("\t\t\t<colgroup>\r\n");
      out.write("\t\t\t\t<col width=\"10%\"><col width=\"20%\"><col width=\"20%\">\r\n");
      out.write("\t\t\t\t<col width=\"20%\"><col width=\"30%\"><col>\r\n");
      out.write("\t\t\t</colgroup>\r\n");
      out.write("\t\t\t<thead>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>序号</th><th>商品分类编号</th><th>商品分类名称</th><th>描述</th>\r\n");
      out.write("\t\t\t\t\t<th>操作</th>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</thead>\r\n");
      out.write("\t\t\t<tbody id=\"category_tbody\"></tbody>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<div id=\"pageInfoUser\" \r\n");
      out.write("\t\tstyle=\"text-align: right;padding-right: 30px\"></div>\r\n");
      out.write("\t</div>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("form.on('submit(search)', function(data) {\r\n");
      out.write("\tconsole.log(data.field);\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\turl :'/store/category/list.do',\r\n");
      out.write("\t\tdata : data.field,\r\n");
      out.write("\t\tdataType : 'json',\r\n");
      out.write("\t\ttype : 'post',\r\n");
      out.write("\t\tsuccess : function(data){\r\n");
      out.write("\t\t\t console.log(data);\r\n");
      out.write("\t\t\tvar curr = $(\"input[name='pageIndex']\").val();\r\n");
      out.write("\t\t    var limit = $(\"input[name='pageLimit']\").val();\r\n");
      out.write("\t\t    console.log(limit);\r\n");
      out.write("\t\t    laypage.render({\r\n");
      out.write("\t\t\t\telem : 'pageInfoUser',// id\r\n");
      out.write("\t\t\t\tcount : data.count,// 数据总数\r\n");
      out.write("\t\t\t\tcurr : curr,// 当前页\r\n");
      out.write("\t\t\t\tlimit : limit,// 每页显示的条数\r\n");
      out.write("\t\t\t\tlimits : [ 5 ,10, 20 ],// 每页条数的选择项\r\n");
      out.write("\t\t\t\tlayout : [ 'count', 'prev', 'page', 'next', 'limit', 'refresh',\r\n");
      out.write("\t\t\t\t\t\t'skip' ],\r\n");
      out.write("\t\t\t\tjump : function(obj, first){\r\n");
      out.write("\t\t\t    \t console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。\r\n");
      out.write("\t\t\t    \t  console.log(obj.limit); //得到每页显示的条数\r\n");
      out.write("\t\t\t        $(\"input[name='pageIndex']\").val(obj.curr);\r\n");
      out.write("\t\t\t        console.log($(\"input[name='pageIndex']\").val());\r\n");
      out.write("\t\t\t        $(\"input[name='pageLimit']\").val(obj.limit);\r\n");
      out.write("\t\t\t        if(!first){refresh();}\r\n");
      out.write("\t\t\t        }\r\n");
      out.write("\t\t    });\r\n");
      out.write("   var html = \"\" ;//加载表格中数据\r\n");
      out.write("    $.each(data.list,function(i, dom) {\r\n");
      out.write("    \tvar code = dom.code?dom.code:'';\r\n");
      out.write("        var name = dom.name?dom.name:'';\r\n");
      out.write("        var des = dom.des?dom.des:'';\r\n");
      out.write("        var parentCode = dom.parentCode?dom.parentCode:'';\r\n");
      out.write("        var d={i:(i+1),code:code,name:name,des:des,parentCode:parentCode};\r\n");
      out.write("        html += getlaytpl('#tradd',d);\r\n");
      out.write("    });\r\n");
      out.write("    $(\"#category_tbody\").html(html);\r\n");
      out.write("\t\t}\r\n");
      out.write("\t})\r\n");
      out.write("});\r\n");
      out.write("refresh()\r\n");
      out.write("function refresh(){\r\n");
      out.write("    $(\"input[value='查询']\").click();\r\n");
      out.write("}\r\n");
      out.write("function openAdd(){\r\n");
      out.write("\topenLayer('/store/web/page/category/add.jsp',refresh)\r\n");
      out.write("}\r\n");
      out.write("function openUpd(code){\r\n");
      out.write("\topenLayer('/store/web/page/category/upd.jsp?code='+code,refresh)\r\n");
      out.write("}\r\n");
      out.write("function del(code){\r\n");
      out.write("\topenConfirm(function(index){\r\n");
      out.write("\t\tajax('/store/category/delete.do', {code:code}, 'text', function(data){\r\n");
      out.write("\t        if (data !=null) {\r\n");
      out.write("\t            layer.msg('删除成功');\r\n");
      out.write("\t            $(\"input[name='pageIndex']\").val(1);\r\n");
      out.write("\t            refresh();\r\n");
      out.write("\t        } else {\r\n");
      out.write("\t            layer.msg('删除失败');\r\n");
      out.write("\t        } \r\n");
      out.write("\t    })\r\n");
      out.write("\t})\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("<script id=\"tradd\" type=\"text/html\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td>{{ d.i }}</td><td>{{ d.code}}</td><td>{{ d.name }}</td><td>{{ d.des }}</td>\r\n");
      out.write("<td>\r\n");
      out.write("    <input type='button' value='修改' class='layui-btn' \r\n");
      out.write("           onclick='openUpd(\"{{ d.code }}\")'/>&nbsp;\r\n");
      out.write("    <a href=\"javascript:del('{{ d.code }}')\" \r\n");
      out.write("       class=\"layui-btn layui-btn-xs layui-btn-danger\">\r\n");
      out.write("        <i class=\"layui-icon layui-icon-delete\"></i>\r\n");
      out.write("    </a>&nbsp;\r\n");
      out.write("</td>\r\n");
      out.write("</tr>\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
