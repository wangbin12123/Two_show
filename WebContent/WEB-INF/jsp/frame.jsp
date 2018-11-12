<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<div class="right">
	<img class="wColck"
		src="${pageContext.request.contextPath }/images/bg/clock.jpg"
		alt="" />
	<div class="wFont">
		<h2>${userSession.username}</h2>
		<p>Welcome to use</p>
	</div>
</div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp"%>
