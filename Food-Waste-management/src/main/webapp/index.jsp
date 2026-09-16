<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Donate</title>
  <link rel="stylesheet" href="css/Home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <header>
        <div class="logo">Food <b style="color: #06C167;">Donate</b></div>
        <div class="hamburger">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
        </div>
        <nav class="nav-bar">
            <ul>
                <li><a href="#home" class="active">Home</a></li>
                <li><a href="About.jsp" >About</a></li>
                <li><a href="Contact.jsp" >Contact</a></li>
                <li><a href="foodDonate.jsp" >Donate food</a></li>
                <li><a href="UserLogin.jsp" >Login</a></li>
                 <!-- <li ><a href="fooddonate.html"  >Donate</a></li> -->
            </ul>
        </nav>
    </header>
    <script>
        hamburger=document.querySelector(".hamburger");
        hamburger.onclick =function(){
            navBar=document.querySelector(".nav-bar");
            navBar.classList.toggle("active");
        }
    </script>
    
     <div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/R.jpeg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/help3.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="img/coverimage.jpeg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

    
     <div class="content">
       <!--    <h2>Love Food</h2>
        <h3>Hate Wasting</h3>-->
        <p style="font-size: 23px;">
            “Cutting food waste is a delicious way of saving money, helping to feed the world and protect the planet.” 
        </p>
       
    </div> 
    <div class="photo">
        <br>
        <p class="heading">Our Works</p>
        <br>
        <p style="font-size: 28px; text-align: center;">"Look what we can do together."</p>
       <br>
        <div class="wrapper">
          <div class="box"><img src="img/p1.jpeg" alt=""></div>
          <div class="box"><img src="img/p4.jpeg" alt=""></div>
          <div class="box"><img src="img/p3.jpeg" alt=""></div>
        </div>
         <p style="font-size: 19px;"> The basic concept of this project  Food Waste Management is to collect theexcess/leftover food from donors such as hotels, restaurants, marriage halls, etc and distribute to  the  needy people .
        </p> 
        <br>
        
    
     
        
    </div>
    <div class="deli" style="display: grid;" >
      <p class="heading">DOOR PICKUP</p>
      <br>
      <p  class="para">"Your donate will be immediately collected and sent to needy people "</p>
      <img src="img/delivery.gif" alt="" style="margin-left:auto; margin-right: auto;">

    </div>
    <div class="ser">
      <!-- <p class="heading">Our Services</p> -->
      
    </div>
    <footer class="footer">
        <div class="footer-left col-md-4 col-sm-6">
          <p class="about">
            <span> About us</span>The basic concept of this project  Food Waste Management is to collect the excess/leftover  food from donors such as hotels, restaurants, marriage halls , etc and distribute to  the  needy people .
     </p>
        
        </div> 
        <div class="footer-center col-md-4 col-sm-6">
          <div>
            <p><span> Contact</span> </p>
            
          </div>
          <div>
        
            <p> (+91) 55555-45454</p>
            
          </div>
          <div>
            <!-- <i class="fa fa-envelope" style="font-size: 17px;
            line-height: 38px; color:white;"></i> -->
            <p><a href="#"> Fooddonate123@gmail.com</a></p>
          </div>
          
          <div class="sociallist">
            <ul class="social">
            <li><a href="https://www.facebook.com/TheAkshayaPatraFoundation/"><img src="https://i.ibb.co/x7P24fL/facebook.png"></a></li>
            <li><a href="https://twitter.com/globalgiving"><img src="https://i.ibb.co/Wnxq2Nq/twitter.png"></a></li>
            <li><a href="https://www.instagram.com/charitism/"><img src="https://i.ibb.co/ySwtH4B/instagram.png"></a></li>
            <li><a href="https://web.whatsapp.com/"><i class="fa fa-whatsapp" style="font-size:50px;color: black;"></i></a></li>
           </ul>
          </div>
        </div>
        <div class="footer-right col-md-4 col-sm-6">
          <h2> Food<span> Donate</span></h2>
          <!-- <h2>Food donate</h2> -->
          <p class="menu">
            <a href="#"> Home</a> |
            <a href="About.jsp"> About</a> |
            <a href="foodDonate.jsp">Donate food </a> |
            <a href="Contact.jsp"> Contact</a>
          </p>
          <p class="name"> Food Donate & copy 2025</p>
        </div>
      </footer>
      
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>