<%@ page import="com.bullsora.kidtimer.LogEntry" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114"
          href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>

<body>
<div id="grailsLogo" role="banner"><a href="http://grails.org"><asset:image src="grails_logo.png"
                                                                            alt="Grails"/></a></div>
<g:set var="lastLogEntry" value="${LogEntry.listOrderByDateCreated(max: 1, offset: 0, order: "desc")[0]}" />
<div class="content"><g:formatDate date="${lastLogEntry.dateCreated}"/>: ${lastLogEntry.message}</div>
<div class="nav" role="navigation">
    <ul>
        <li><g:link controller="remoteOverride" action="saveFromParams" method="GET" params="[type: 'DENY', minutes: 60]" >Block 60</g:link></li>
        <li><g:link controller="remoteOverride" action="saveFromParams" method="GET" params="[type: 'ALLOW', minutes: 15]" >Allow 15</g:link></li>
    </ul>
</div>

<g:layoutBody/>
<div class="footer" role="contentinfo"></div>

<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt"
                                                                   default="Loading&hellip;"/></div>
</body>
</html>
