<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="security" uri="http://www.springframework.org/security/tags" %>
<%
String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path%>/js/course/course_plan_list.js"></script>
	<form id="list_search">
		<div class="seach_div">
			<div><label>课程名称:</label><input name="courseName" type="text"/></div>
			<div><label>讲师名称:</label><input name="teacherName" type="text"/></div>
			<div class="psb" style="float:right;"><a id="searchBtn" class="easyui-linkbutton searchBtn">查询</a><a id="resetBtn" class="easyui-linkbutton searchBtn">重置</a></div>
		</div>
	</form>
	<table id="courseTable"></table>
	<div id="detail" style="display: none;">
		<fieldset style="width: 350px; float:left; display: inline;">
			<legend>基本信息</legend>
		                课程名称: <label id="courseName"></label> <br/>
		                讲师名称: <label id="teacherName"></label> <br/>
		                课程开始日期: <label id="startDate"></label> <br/>
		                课程结束日期: <label id="endDate"></label> <br/>
		                状态: <label id="state"></label> <br/>
  		</fieldset>
	</div>
	<security:authorize access="hasPermission(null, \'security.operation.course_plan_add\')">
		<input type="hidden" id="contract_tpl_add"/>
	</security:authorize>
	
	<script type="text/javascript">
		function operateData(val,row,index){
			var returnStr = '';
			//详细
			returnStr+='<security:authorize access="hasPermission(null, \'security.operation.course_plan_detail\')"><a onClick=showDetail("'+row.id+'")>详细</a></security:authorize>';
			//修改
			returnStr+='<security:authorize access="hasPermission(null, \'security.operation.course_plan_modify\')"><a href="'+path+'/course.course_plan_add.html?id='+row.id+'">修改</a></security:authorize>';
			//删除
			returnStr+='<security:authorize access="hasPermission(null, \'security.operation.course_plan_delete\')"><a onclick=removeContract("'+row.id+'")>删除</a></security:authorize>';
			return returnStr;
		}
	</script>
