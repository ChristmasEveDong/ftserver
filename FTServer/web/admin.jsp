<%@page import="FTServer.IndexAPI"%>
<%@page import="FTServer.IndexPage"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false" %>
<%
    response.setHeader("Cache-Control", "non-cache, no-store, must-revalidate");
%> 

<%
    String url = request.getParameter("url");
    if (url != null) {
        if (url.startsWith("http:") || url.startsWith("https:")) {
            url = IndexAPI.indexText(url, false, null);
        } else {
            url = null;
        }
    }
    if (url == null) {
        url = "http://www.iboxdb.com";
    }
%>

<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>Administrator</title>

        <link rel="stylesheet" type="text/css" href="css/semantic.min.css"> 

        <style>
            body {
                margin-top: 10px;
                margin-left: 10px;
                font-weight:lighter;
                overflow-x: hidden;
            }
            .stext{

            }
            .rt{
                color: red;
            }
            .gt{
                color: green;
            }
            .gtt{
                color: #4092cc;
            }
        </style> 
        <script>
            function highlight(loadedDivId) {

            }
            function sendlog(url, txt) {

            }
        </script>
    </head>
    <body > 
        <div class="ui left aligned grid">
            <div class="column"  style="max-width: 600px;"> 
                <h3>input HTTP or HTTPS  ://URL</h3>
                <form class="ui large form"  action="admin.jsp" onsubmit="formsubmit()">
                    <div class="ui label input">

                        <div class="ui action input">
                            <a href="./"><i class="teal add outline icon" style="font-size:42px"></i> </a>
                            <input name="url"  value="<%=url%>" required onfocus="formfocus()" />
                            <input id="btnsearch" type="submit"  class="ui teal right button" value=" ADD PAGE " /> 
                        </div>
                    </div>
                </form> 
                <script>
                    function formsubmit() {
                        document.getElementById('btnsearch').disabled = "disabled";
                    }
                    function formfocus() {
                        document.getElementById('btnsearch').disabled = undefined;
                    }
                </script>
            </div>
        </div>

        <div class="ui grid">
            <div class="ten wide column" style="max-width: 600px;" id="maindiv">
                <jsp:include page="spart.jsp" >
                    <jsp:param name="q" value="<%= url%>"></jsp:param>
                </jsp:include>

            </div>
            <div class="six wide column" style="max-width: 200px;">



            </div>
        </div>

    </body>
</html>
