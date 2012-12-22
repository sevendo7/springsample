<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<c:url value="/resources" var="resource" />
<html>


<head>
<meta charset="utf-8">
<title>random project</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->

<link href="${resource}/css/bootstrap-responsive.css" rel="stylesheet">
<link href="${resource}/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link href="${resource}/css/bootstrap.css" rel="stylesheet">
<link href="${resource}/css/bootstrap.min.css" rel="stylesheet">
<link href="${resource}/css/docs.css" rel="stylesheet">
<link href="${resource}/css/prettify.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script src="<c:url value=" dwr/engine.js "/>"></script>
<script src="<c:url value=" dwr/util.js "/>"></script>
<script src="<c:url value=" dwr/interface/DwrService.js "/>"></script>
<script type="text/javascript">
	$(function() {
		dwr.engine.setActiveReverseAjax(true);
		$("#messageForm").submit(function() {

			DwrService.sendMessage($("#nick").val(), $("#messageInput").val());

			$("#messageInput").val("");
			return false;
		});
	});

	function showMessage(from, message, date, id) {
		var id = id;
		var actualDiv = "<div class=\"alert alert-block alert-info fade in\"><button type=\"button\" id=\""+id+"\" class=\"close\" data-dismiss=\"alert\">x</button><h4 class=\"alert-heading\">"
				+ from + "</h4><p>" + message + "</p><p>" + date + "</p></div>";
		$("#messagesDiv").append(actualDiv);
		$("#" + id).hide().fadeIn("slow");
	}
</script>



<script src="${resource}/js/bootstrap-transition.js"></script>
<script src="${resource}/js/bootstrap-alert.js"></script>
<script src="${resource}/js/bootstrap-modal.js"></script>
<script src="${resource}/js/bootstrap-dropdown.js"></script>
<script src="${resource}/js/bootstrap-scrollspy.js"></script>
<script src="${resource}/js/bootstrap-tab.js"></script>
<script src="${resource}/js/bootstrap-tooltip.js"></script>
<script src="${resource}/js/bootstrap-popover.js"></script>
<script src="${resource}/js/bootstrap-button.js"></script>
<script src="${resource}/js/bootstrap-collapse.js"></script>
<script src="${resource}/js/bootstrap-carousel.js"></script>
<script src="${resource}/js/bootstrap-typeahead.js"></script>


</head>


<body data-spy="scroll" data-target=".bs-docs-sidebar"
	data-twttr-rendered="true">
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" href="#">RA</a>
				<div class="nav-collapse collapse"></div>
			</div>
		</div>
	</div>
	<header class="jumbotron subhead" id="overview">
		<div class="container">
			<h1>Reverse Ajax</h1>

		</div>
	</header>
	<div class="container">
		<div class="row" style="padding-top: 20px !important;">

			<div class="hero-unit">
				<form id="messageForm" class="form-horizontal" action="/">
					<div class="control-group">
						<label class="control-label" for="inputEmail">Nickname: </label>
						<div class="controls">
							<input id="nick" type="text" placeholder="Nickname">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputEmail">Message: </label>
						<div class="controls">
							<input id="messageInput" type="text" placeholder="Message">
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn">Send</button>
						</div>
					</div>
				</form>
			</div>


		</div>
		<div class="row" id="messagesDiv">
			<c:forEach var="message" items="${messages}">

				<div class="alert alert-block alert-info fade in" id="${message.id}">
					<button type="button"  class="close" data-dismiss="alert">x</button>
					<h4 class="alert-heading">${message.messageFromPerson}</h4>
					<p>${message.messageText}</p>
					<p>${message.messageDate}</p>
				</div>

			</c:forEach>



		</div>

	</div>


	<footer class="footer"> </footer>

</body>


</html>