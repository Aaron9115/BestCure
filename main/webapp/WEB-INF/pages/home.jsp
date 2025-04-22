<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Best Cure - Home</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css" />
</head>
<body>
 <!----------------------------------navbar-------------------------------------------->
 <section id="header">
  <a href="#"><img src="images/logo.png" class="first" alt=""></a>
  <div>
    <ul class="navbar">
     <li class="search-bar">
       <input type="text" placeholder="Search products...">
       <button type="submit"><img src="images/search.png" alt="Search" class="search-icon"></button>
       </li>
      <li><a class="active" href="home.jsp">HOME</a></li>
      <li><a href="products.html">SHOP</a></li>
      <li><a href="cart.html">CART</a></li>
      <li><a href="about.html">ABOUT</a></li>
      <li><a href="contact.html">CONTACT</a></li>
      <li><a href="login.html">LOGIN</a></li>
      <li><a href="signup.html">SIGN UP</a></li>
     <li class="prof-li"><a href="profile.html">
       <img src="images/profile.png" class="profile-icon">
       </a>
     </li>
      
    </ul>
  </div>
  </section>
 <br><br><br>
 <!-----------------------------navbar-ends------------------------------->
  <!-- Hero Section -->
  <section class="hero">
    <div class="hero-text">
      <h2>Your Health, <span>Our First Priority</span></h2>
      <p>Discover trusted products for wellness, skincare, baby care, and medical essentials.</p>
      <a href="products.html" class="btn">Shop Now</a>

    </div>
    <div class="hero-img">
      <img src="images/hero-medicine.jpg.png" alt="Medicines">
    </div>
  </section>

  <!-- Search Section -->
  <section class="search-section">
    <h3>What are you looking for?</h3>
    <input type="text" id="searchInput" placeholder="Search for products..." />
  </section>

  <section class="services">
    <h3>Our Services</h3>
    <div class="hover-service-grid">
      <div class="hover-service-card">
        <img src="images/health.png" alt="Health Icon" />
        <h4>Wide range of Health products</h4>
        <p>Browse thousands of certified health and wellness items — from essential medicines to daily care products.</p>
      </div>
      <div class="hover-service-card">
        <img src="images/icon-quality.svg.png" alt="Quality Icon" />
        <h4>Trusted Quality, Guarantee</h4>
        <p>All our products come from verified brands and manufacturers, ensuring safety and effectiveness.</p>
      </div>
      <div class="hover-service-card">
        <img src="images/icon-shopping.svg.png" alt="Shopping Icon" />
        <h4>Seamless Shopping Experience</h4>
        <p>Order quickly and easily with a user-friendly interface, secure payments, and reliable delivery options.</p>
      </div>
      <div class="hover-service-card">
        <img src="images/care.png" alt="Care Icon" />
        <h4>Personalized Care and Support</h4>
        <p>Get expert help, product recommendations, and customer service every step of the way — your health is our mission.</p>
      </div>
    </div>
  </section>
  

  
  <!-- Products Grid -->
<section class="products">
  <h3>Popular Products</h3>
  <div class="product-grid" id="productList">
    <div class="product-card">
      <img src="images/paracetamol.jpg" />
      <p class="product-title">Paracetamol</p>
      <p class="product-price">Rs 25.00</p>
      <button class="add-cart-btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="images/vitamin-c.jpg" />
      <p class="product-title">Vitamin C Serum</p>
      <p class="product-price">Rs 1,300.00</p>
      <button class="add-cart-btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="images/baby-lotion.jpg" />
      <p class="product-title">Baby Lotion</p>
      <p class="product-price">Rs 350.00</p>
      <button class="add-cart-btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="images/bp-monitor.jpg" />
      <p class="product-title">BP Monitor</p>
      <p class="product-price">Rs 2,400.00</p>
      <button class="add-cart-btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="images/cerave.jpg" />
      <p class="product-title">CeraVe Sunscreen</p>
      <p class="product-price">Rs 1,800.00</p>
      <button class="add-cart-btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="images/diapers.jpg" />
      <p class="product-title">Diapers (M)</p>
      <p class="product-price">Rs 1,050.00</p>
      <button class="add-cart-btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="images/COSRX Snail Mucin.webp" />
      <p class="product-title">COSRX Snail Mucin</p>
      <p class="product-price">Rs 2,300.00</p>
      <button class="add-cart-btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="images/Digital Thermometer.jpg" />
      <p class="product-title">Digital Thermometer</p>
      <p class="product-price">Rs 300.00</p>
      <button class="add-cart-btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="images/Baby Wet Tissue.jpeg" />
      <p class="product-title">Baby Wet Tissue</p>
      <p class="product-price">Rs 500.00</p>
      <button class="add-cart-btn">Add to Cart</button>
    </div>
    <div class="product-card">
      <img src="images/Thyronorm 25mcg.jpg" />
      <p class="product-title">Thyronorm 25mcg</p>
      <p class="product-price">Rs 150.00</p>
      <button class="add-cart-btn">Add to Cart</button>
    </div>
  </div>
</section>

<!-- Message Section -->
  <section class="message-section">
    <img src="images/pharmacy-aisle.jpg.png" alt="Pharmacy">
    <div class="message-text">
      <h4>A Message from Best Cure</h4>
      <p>“At Best Cure, your well-being is at
        the heart of everything we do.From essential medicines and skincare
        to baby care and medical equipment,
        we are committed to delivering 
        high-quality products that support 
        your health and happiness.
        Whether you're caring for yourself,
        your loved ones, or your little ones,
        we’re here to make the journey easier,
        safer, and more comforting.
        Thank you for trusting Best Cure—
        where care meets convenience, 
        and quality is never compromised.</p>
    </div>
  </section>

  <!-- Newsletter -->
  <section class="newsletter">
    <h3>Be the first to explore health tips, skincare advice, and exclusive offers—bringing trusted wellness straight to your inbox.</h3>
  </section>

  <!---------------footer-section-starts------------------->
  <section class="footer" style="background-color: #E3E6F3; border-radius: 20px;">
    <div class="b-c">
      <div class="b">
        <a href="#" class="l"><img src="images/logo.png"></a>
        <p>BestCure is an online based pharmacy website which offers various medical products from almost every manufacturer.<br> We provide on time delivery and other various services. We have the collection of wide range of pharmacy products</p>
        <div class="social">
                     <a href="https://www.facebook.com/login.php/"><img src="../images/fb.png"></a>
                     <a href="https://www.instagram.com/?hl=en"><img src="../images/ig.png"></a>
                     <a href="https://www.linkedin.com/"><img src="../images/lkdn.png"></a>
                     <a href="https://twitter.com/Xeroxify?lang=en"><img src="../images/twt.png"></a>
                     <a href="https://www.youtube.com/"><img src="../images/yt.png"></a>
                    <a href='home-page.html'></a>
        </div>
      </div>
    </div>
    <h1 class="credit">CREATED BY<span> TEAM BestCure </span>|All Rights Reserved!!</h1><br>
    <div style="color: grey;" align="center">&copy;BestCure</div>

  </section>
  <!----------------------footer section ends------------------------->  
</body>
</html>
