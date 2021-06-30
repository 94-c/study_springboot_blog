<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include  file = "../layout/header.jsp" %>

<div class="container">
	<div class="form-group float-right">
		<button class="btn btn-secondary" onclick="history.back()">Home</button>
		<c:if test="${board.user.id == principal.user.id}">
			<a href = "/board/${board.id}/updateForm" class="btn btn-warning">Modify</a>
			<button id="btn-delete" class="btn btn-danger">Delete</button>
		</c:if>
	</div>
		<div>
			No : <span id="id"><i>${board.id}&nbsp; </i></span>
			Id : <span><i>${board.user.username} </i></span>
		</div>
		<br/>

		<div class="form-group">
			<h3>${board.title}</h3>
		</div>
		<hr />
		<div class="form-group">
			<div>${board.content}</div>
		</div>
		<hr />


	<div class="card">
		<form>
			<input type="hidden" id="userId" value="${principal.user.id}">
			<input type="hidden" id="boardId" value="${board.id}"/>
			<div class="card-body">
				<textarea id="reply-content" class="form-control" rows="1"></textarea>
			</div>
			<div class="card-footer">
				<button type="button" id="btn-reply-save" class="btn btn-primary">submit</button>
			</div>
		</form>
	</div>
	<br/>
	<div class="card">
		<div class="card-header">list of comments</div>
		<ul id="reply--box" class="list-group">
			<c:forEach var="reply" items="${board.replys}">
				<li id="reply--1" class="list-group-item d-flex justify-content-between">
					<div>${reply.content}</div>
					<div class="d-flex ">
						<div class="font-italic">Id : ${reply.user.username} &nbsp;</div>
						<button class="badge">Delete</button>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>

<script src="/js/board.js"></script>
<%@ include  file = "../layout/footer.jsp" %>

