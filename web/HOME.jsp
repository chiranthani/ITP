
<%-- 
    Document   : HOME
    Created on : Aug 25, 2018, 4:09:13 PM
    Author     : Hiruni Dep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

.button {
  display: inline-block;
  width:80px;
  padding: 4px 7px;
  font-size: 15px;
  cursor: pointer;
  text-align: center;	
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #0099ff;
  border: none;
  border-radius: 10px;
  box-shadow: 0 3px #666;
}

.button:hover {background-color: #00cccc}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
  .button4 {border-radius: 12px;}
  
  
  
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: black;
}

.topnav a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #2196F3;
  color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 6px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 600px) {
  .topnav .search-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
  
  
  
  
  </style>

<link rel="stylesheet" type="text/css" href="Homestyle.css">
<table border="0" style="width: 100%; margin-left: 5px; column-width: auto;">
  <tbody>
                <tr>
                    <td>
                        <div>
                            <img src="IMG/CaptureNew.PNG" width="480" height="150" > 
                        </div>
                    </td>
                    <td></td>
                    <td>
                        <div>
                            <a href="profile.jsp"> <img src="IMG/1.png" width="80px"></a>
                            <br>                            
				
                               <a href="login.jsp" class="button" >Login</a>
                       </div>
                    </td>
                </tr>
            </tbody>
        </table>
</header>

<body>
    
    
        
    
        <div class="topnav">
  <a class="active" href="#home">Home</a>
  <a href="#about">Gallery</a>
  <a href="#contact">About us</a>
  
  <div class="search-container">
      <form  action="coursesearch1" method="post">
      <input type="text" placeholder="search for courses" name="code">
      <button type="submit" >Search</button>
    </form>
  </div>
</div>
        
        
        
        
        
<article >
 <aside style="float:right;background-color:gray;">         
	        
<!-- Side bar -->

<h3>
<ul>

    
    <p  style="background-color: blue;"> 
    <h3  style=" font-family: verdana;">Latest Notices  </h3>
    
    <h3>  Apply Entry Test </h3>
    
     
    </p>

 <li><a href="EntryTestOnlineForm.jsp" class="button4"  style="color:red;">CLICK HERE</a></li><br><br><br><br>

 
</ul>
</h3>
</aside>

<aside class="h"  >

<div class="slideshow-container">

<div class="mySlides fade">
     <img src="IMG/Student1.jpg" style="width:100%">
</div>

<div class="mySlides fade">
  <img src="IMG/Student2.jpg" style="width:100%">
</div>

<div class="mySlides fade">
  <img src="IMG/Student3.jpg" style="width:100%">
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 5000); // Change image every 2 seconds
}
</script>
</aside>
</article>    
       
</div> 

<br>
<br>

 <footer class="socialMedia">
	<div style="float:left">
            MINDRICH College of Management Studies </br>
            Second Lane</br>
            Dehiwala </br>
            011 2 301904 
	</div>
        
       
	<div style="float:right">
            <a href="https://www.facebook.com/" style="text-decoration:none"> <img src="IMG/facebook-5-xxl.png" width="40px"> </a>
            <a href="https://www.instagram.com/" style="text-decoration:none"> <img src="IMG/instagram-5-xxl.png" width="40px"> </a>
            <a href="https://plus.google.com/" style="text-decoration:none"> <img src="IMG/google-plus-5-xxl.png" width="40px"> </a>
	</div>
    </footer>
</body>
</html>


