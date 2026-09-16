<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>About</title>
    <link rel="stylesheet" href="css/Home.css">
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
                <li><a href="index.jsp" >Home</a></li>
                <li><a href="#About" class="active" >About</a></li>
                <li><a href="Contact.jsp" >Contact</a></li>
                <li><a href="foodDonate.jsp" >Donate food</a></li>
                <li><a href="UserLogin.jsp" >Login</a></li>
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
    <style>
       
        
        .coverc{
          width: 100%;
          height: 400px;
          background:url('img/about3.jpg')no-repeat;
    background-size: cover;
    display: grid;
    place-items:center;
    padding-top: 8rem;
 
        } 
        .title{
          font-size: 38px;
          text-align: center;
          align-items: center; 
        }
       
        .para p{
            font-size: 23px;
            margin-left: 20px;
            margin-right: 20px;
        }
          @media (max-width: 767px) {
            .para p{
               font-size: 16px;
               /* margin-left: 10px; */
              }
            #pptslide{
                height: 200px;
                width: 300px;

            }
            #map{
              height: 200px;
                width: 300px;


            }
            #overview{
              height: 200px;
                width: 300px;
            }
            
        .title{
          font-size: 28px;
          margin: 10px;
          text-align: center;
          align-items: center; 
        }
       

          }
     
    </style>
    <br>
    <br>
    <!-- <section class="coverc">
        
    
   </section> -->
    <p class="title">"Welcome to <u> Food Donate</u> "</p>
    <br>
    <br>
    <br>
        <p class="heading">About us</p>
        <!-- <p  style=" font-size:30px ; text-align: center;" > ABOUT <span>US</span> </p> -->
      
        <!-- <br> -->
      <div class="para">
        <!-- <p>"Welcome to Food Donate, India's largest and most trusted donating platform that connects donors to verified nonprofits. FoodDonate helps you become a ray of hope for people in need. Choose a cause that is close to your heart and join hands with millions of donors like you who aim to make this world a better place."</p> -->
      
        <p>We are a team of passionate individuals committed to addressing the issue of food waste in India. Our goal is to create a system that connects food donors with charities and NGOs, while also reducing the environmental impact of food waste.</p>
      </div>
      <br>
 
      
    
      <br>
      


 <div class="map"  style="  text-align: center; padding-bottom: 50px;" >
<p  style=" font-size:30px ;" > Location:  </p>
 <div class="ratio ratio-16x9">
  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3377.0718719024003!2d88.42445437491075!3d22.576170679489202!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a02751a9d9c9e85%3A0x7fe665c781b10383!2sTechno%20Main%20Salt%20Lake!5e1!3m2!1sen!2sin!4v1736850728229!5m2!1sen!2sin" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
  </div>
 </div> 
     
    


      <p class="heading"> Our Story</p>
     <div class="para">
       <p>Our journey began with a realization that food waste is a significant problem in India. According to a report by the United Nations, India is the world's second-largest food producer, yet it also has one of the highest rates of food waste. This waste has a significant impact on the environment, as well as on food security in the country.</p>
     </div>
    <!-- <div class="overview"  style="  text-align: center; padding-bottom: 50px;" >
      <iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=1400 height=800 src="https://edrawcloudpublicus.s3.amazonaws.com/viewer/self/3094230/share/2023-3-2/1677763924/main.svg" id="overview"></iframe>
     </div> 
      -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
     
</body>
</html>