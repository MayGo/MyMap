<html>
<head>
   <g:javascript library="jquery" plugin="jquery"/>
   <growler:resources/>
</head>

<body>
<h1>GROWLER TESTING</h1>

<a onclick="$.jGrowl('Hello world!');" href="javascript:void(0);">Sample 1</a>

<div id='success'>Old</div>

<g:remoteLink controller="foo" action="growl" update="success">Test 3</g:remoteLink>

</body>
</html>