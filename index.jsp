<!doctype html>
<html lang="en">
<head>
<link rel="stylesheet" href="animation.css">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Note Taker : Home page</title>
<%@include file="all_js_css.jsp"%>
<style>
body
{
  background: url(home-bg.jpg);
  background-repeat: no-repeat;
  background-size: auto;
}
</style>
</head>
<body>
<header class="masthead" style="background-image: url('home-bg.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                        </div>
                    </div>
                </div>
            </div>
        </header>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
<script src="js/animation.js"></script>

<h1 class="text-uppercase text-center" style = "color: black">Start taking your notes</h1> 

			<div class="container text-center">
				<a href="add_notes.jsp" class="btn text-center" style = "color: black">Start here</a>

			
			</div>

		</div>

	</div>




</body>
</html>
