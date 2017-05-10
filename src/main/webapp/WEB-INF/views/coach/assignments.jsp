<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include.jsp"%>
<%@ page session="false"%>
<div id="assignment" class="portlet light ">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject bold uppercase font-dark">Assignment
				List </span>
		</div>
		<div class="actions">
			<jsp:useBean id="now" class="java.util.Date" />
			Date Time :
			<fmt:formatDate value="${now}" pattern="dd-MM-yyyy HH:mm:ss a z" />
			<button id="export" class="btn btn-circlebtn-icon-only  btn-default">Export
			</button>
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="#" data-original-title="" title=""></a>
		</div>
	</div>
	<div class="portlet-body">
<!-- 		<div class="table-toolbar">
			<div class="row">
				<div class="col-md-6"></div>
			</div>
		</div>
		<br> <br>

		<div class="row">
			<div class="col-md-8"></div>
		</div>
		<br> <br> -->
		<div id="table_wrapper">
			<table class="table table-striped table-hover table-bordered"
				id="sample_editable_1">
				<thead>
					<tr>
						<th>No</th>
						<th>Coach</th>
						<th>StudentID</th>
						<th>Full Name</th>
						<th>Entry</th>
						<th>Email</th>
						<th>Date Assigned</th>
						<th>Date Finished</th>
						<th>Try</th>
						<th>Status</th>
						<th class="noExl">Report</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${assignments}" var="assignment"
						varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${assignment.coachId.firstName}</td>
							<td>${assignment.studentId.studentId}</td>
							<td>${assignment.studentId.firstName}
								${assignment.studentId.lastName}</td>
							<td>${assignment.studentId.entry}</td>
							<td>${assignment.studentId.email}</td>
							<td>${assignment.start_date}</td>
							<td>${assignment.end_date}</td>
							<td>${assignment.count}</td>
							<td><c:choose>

									<c:when
										test="${assignment.started == true and assignment.finished==true}">
										<span class="label label-primary">F</span>
									</c:when>
									<c:when
										test="${assignment.started == true and assignment.finished==false}">
										<span class="label label-warning">S</span>
									</c:when>
									<c:when
										test="${assignment.started == false and assignment.finished==false}">
										<span class="label label-info">A</span>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose></td>
							<td class="noExl">
								<c:choose>

									<c:when
										test="${assignment.started == true and assignment.finished==true}">


										<a href="<spring:url value="/coach/result/${assignment.id}" />">result</a> | <a
											href="<spring:url value="/coach/resultDetail/${assignment.id}" />">detail</a>
                                      | <a href="<spring:url value="/coach/resultDetail/${assignment.id}" />">Feedback</a>

									</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
</div>
