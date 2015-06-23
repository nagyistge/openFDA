<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="false"%>
<html>
<head>
  <title>Washington Software - OpenFDA</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="author" content="Jay Ginete">
  <title>AgencyNYC - Responsive Landing Page</title>

  <!-- CSS -->
  <link href="<c:url value="/resources/foundation/css/normalize.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/slick/style.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/animate.min.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/font-awesome.min.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/lib/hovericon/css/component.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/foundation.css" />" rel="stylesheet">

  <link href="<c:url value="/resources/foundation/css/style.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/foundation/css/style-responsive.css" />" rel="stylesheet">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
  <![endif]-->

</head>

<body class="tooltips" id="top">
<div class="wrapper">
  <!--
  ===========================================
  BEGIN HEADER SECTION
  ===========================================
  -->
  <div id="header-landing" data-magellan-destination="home">
    <div class="fixed sticky">
      <nav id="nav-menu" class="top-bar" data-topbar role="navigation" data-magellan-expedition="fixed">
        <ul class="title-area">
          <li class="name">
            <h1><a href="index.jsp"> WSI </a></h1>
          </li>
          <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
        </ul>

        <section id="top-main-nav" class="top-bar-section menus">
          <ul class="left scroll-nav">
            <li data-magellan-arrival="login"><a href="login">Login</a></li>
          </ul>
          <ul class="right scroll-nav">
            <li data-magellan-arrival="home" class="active"><a href="#top">Home</a></li>
            <li data-magellan-arrival="services"><a href="#services">Services</a></li>
            <li data-magellan-arrival="portfolio"><a href="#portfolio">Portfolio</a></li>
            <li data-magellan-arrival="team"><a href="#team">Team</a></li>
            <li data-magellan-arrival="contact"><a href="#contact">Contact</a></li>
          </ul>
        </section>
      </nav>
    </div>

    <!-- HEADER SECTION CONTENT -->
    <div class="awesome-slogan">
      <!--                     <h2>Your <span>Awesome</span> Text <span>Goes Here</span></h2> -->

      <!--                     <h4>This theme is <span>inspired</span> by my visit to the  <span>City of New York</span></h4> -->
      <h4>FOLLOW US</h4>
      <div class="clear"></div>
      <div class="social-icons">
        <a href="#fakelink" data-toggle="tooltip" title="Facebook"><img src="<c:url value="/resources/foundation/img/social-icons/facebook.png" />" alt="Facebook icon"></a>
        <%--                         <a href="#fakelink" data-toggle="tooltip" title="Github"><img src="<c:url value="/theme/img/social-icons/github.png" />" alt="Github icon"></a> --%>
        <%--                         <a href="#fakelink" data-toggle="tooltip" title="Google+"><img src="<c:url value="/theme/img/social-icons/gplus.png" />" alt="Gplus icon"></a> --%>
        <a href="#fakelink" data-toggle="tooltip" title="Liked In"><img src="<c:url value="/resources/foundation/img/social-icons/likedin.png" />" alt="Linkedin icon"></a>
        <%--                         <a href="#fakelink" data-toggle="tooltip" title="Tumblr"><img src="<c:url value="/theme/img/social-icons/tumblr.png" />" alt="Tumblr icon"></a> --%>
        <a href="#fakelink" data-toggle="tooltip" title="Twitter"><img src="<c:url value="/resources/foundation/img/social-icons/twitter.png" />" alt="Twitter icon"></a>
        <%--                         <a href="#fakelink" data-toggle="tooltip" title="Vimeo"><img src="<c:url value="/theme/img/social-icons/vimeo.png" />" alt="Vimeo icon"></a> --%>
        <%--                         <a href="#fakelink" data-toggle="tooltip" title="Youtube"><img src="<c:url value="/theme/img/social-icons/youtube.png" />" alt="Youtube icon"></a> --%>
      </div>
      <div class="clear"><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /></div>
    </div>
  </div>
  <!--
  ===========================================
  END HEADER SECTION
  ===========================================
  -->

  <!-- SEECTION THEME COLOR -->
  <div class="section-theme-landing"></div>
  <!-- END SECTION THEME COLOR -->

  <!--
  ===========================================
  BEGIN SERVICES SECTION
  ===========================================
  -->
  <div class="section-page-landing section-grey" id="services" data-magellan-destination="services">
    <div class="inner-section row">
      <div class="container small-12 medium-12 large-12 column">
        <h2 class="text-center">Our Services</h2>

        <!-- BEGIN SERVICES DESCRIPTION -->
        <h4 class="text-center">
          Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh
          euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
          minim veniam, quis nostrud exerci tation.
        </h4>

        <div class="hi-icon-effect-1 hi-icon-effect-1a row">
          <div class="large-3 column">
            <div class="the-box-landing the-box-transparent text-center">
              <h4>WEB DESIGN</h4>
              <a href="#fakelink" class="hi-icon hi-icon-screen">Web Design</a>
            </div>
          </div>
          <div class="large-3 column">
            <div class="the-box-landing the-box-transparent text-center">
              <h4>UI DESIGN</h4>
              <a href="#fakelink" class="hi-icon hi-icon-images">UI Design</a>
            </div>
          </div>
          <div class="large-3 column">
            <div class="the-box-landing the-box-transparent text-center">
              <h4>MOBILE APPS</h4>
              <a href="#fakelink" class="hi-icon hi-icon-mobile">Mobile Apps</a>
            </div>
          </div>
          <div class="large-3 column">
            <div class="the-box-landing the-box-transparent text-center">
              <h4>WEB HOSTING</h4>
              <a href="#fakelink" class="hi-icon hi-icon-archive">Web Hosting</a>
            </div>
          </div>
        </div>

        <hr />

        <h2 class="text-center">What They Say About Us?</h2>

        <!-- BEGIN TESTIMONIAL CAROUSEL -->
        <div id="carousel-testimonial" class="carousel-landing carousel carousel-testimonial">
          <div class="testimonial-icon">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-comments-o fa-stack-1x fa-inverse"></i>
                                </span>
          </div>

          <!-- Wrapper for slides -->
          <div class="carousel-inner">
            <div class="testimonial-inner">
              <h5>&#34;
                Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi
                &#34;</h5>
              <h4 class="testimonial-name">Jessica Rice - San Francisco, USA</h4>
              <div class="testimonial-avatar">
                <img src="<c:url value="/resources/" />" class="img-circle" alt="Avatar">
              </div>
            </div>foundation/img/avatar/avatar.jpg


            <div class="testimonial-inner">
              <h5>&#34;
                Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi
                &#34;</h5>
              <h4 class="testimonial-name">Sam Bason - Tokyo, Japan</h4>
              <div class="testimonial-avatar">
                <img src="<c:url value="/resources/foundation/img/avatar/avatar.jpg" />" class="img-circle" alt="Avatar">
              </div>
            </div>


            <div class="testimonial-inner">
              <h5>&#34;
                Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi
                &#34;</h5>
              <h4 class="testimonial-name">Sara Curtis - London, UK</h4>
              <div class="testimonial-avatar">
                <img src="<c:url value="/resources/foundation/img/avatar/avatar.jpg" />" class="img-circle" alt="Avatar">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--
  ===========================================
  END SERVICES SECTION
  ===========================================
  -->

  <!--
  ===========================================
  BEGIN PORTFOLIO SECTION
  ===========================================
  -->
  <div class="section-page-landing" id="portfolio" data-magellan-destination="portfolio">
    <div class="inner-section">
      <div id="Modals">
        <div class="reveal-modal" id="myModal" data-reveal>
          <div class="modal-content">
            <div class="modal-header">
              <a class="close-reveal-modal">&#215;</a>
              <h4 class="modal-title" id="myModalLabel">Project name</h4>
            </div>
            <div class="modal-body">
              <ul class="small-block-grid-2">
                <li><img src="<c:url value="/resources/foundation/img/image_small/image_wide001.jpg" />" class="img-responsive" alt="Image portfolio"></li>
                <li>
                  <p class="text-justify">
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                    ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
                    tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                  </p>
                  <p>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt
                    ut laoreet dolore magna aliquam erat volutpat.
                  </p>
                  <button class="btn btn-default btn-teplok btn-block">Open Project page</button>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <div class="container row">
        <h2 class="text-center">Our Work</h2>
        <div class="portfolio-landing">
          <ul class="button-group filter-options even-6">
            <li><a class="button active" data-group="all">All</a></li>
            <li><a class="button" data-group="web_design">Web Design</a></li>
            <li><a class="button" data-group="ui_design">UI Design</a></li>
            <li><a class="button" data-group="open_source">Open source</a></li>
            <li><a class="button" data-group="frameworks">Frameworks</a></li>
            <li><a class="button" data-group="community">Community</a></li>
          </ul>

          <!-- BEGIN PORTFOLIO GRID CONTENT -->
          <ul id="portfolio-grid" class="small-block-grid-2 medium-block-grid-2 large-block-grid-4">
            <li class="picture-item" data-groups='["ui_design"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a href="#" data-reveal-id="myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small001.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item" data-groups='["ui_design"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small002.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item" data-groups='["open_source"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small003.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item " data-groups='["frameworks"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small004.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item" data-groups='["web_design"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small005.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item" data-groups='["open_source"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small006.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item" data-groups='["open_source"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small007.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item" data-groups='["community"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small008.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item" data-groups='["web_design"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small009.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item" data-groups='["frameworks"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small010.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item"  data-groups='["community"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small011.jpg" />" alt="Image portfolio">
            </li>
            <li class="picture-item" data-groups='["open_source"]'>
              <div class="overlay">
                <h4>Project Name</h4>
                <p>Short descriptions</p>
                <p>
                  <a data-toggle="modal" data-target="#myModal"><i class="fa fa-share"></i></a>
                  <a href="#fakelink"><i class="fa fa-link"></i></a>
                </p>
              </div>
              <img src="<c:url value="/resources/foundation/img/image_small/image_small012.jpg" />" alt="Image portfolio">
            </li>
            <li class="shuffle__sizer"></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!--
  ===========================================
  END PORTFOLIO SECTION
  ===========================================
  -->

  <!--
  ===========================================
  BEGIN TEAM SECTION
  ===========================================
  -->
  <div class="section-page-landing section-light-grey" id="team" data-magellan-destination="team">
    <div class="inner-section">
      <div class="container">
        <h2 class="text-center">Meet Our Team</h2>
        <div class="row">
          <ul class="small-block-grid-2 medium-block-grid-3 large-block-grid-4">
            <li>
              <div class="the-box-landing text-center the-team-landing full">
                <div class="ava-wrap">
                  <div class="see-detail"></div>
                  <div class="button-link">
                    <a href="#fakelink"><i class="fa fa-facebook"></i></a>
                    <a href="#fakelink"><i class="fa fa-twitter"></i></a>
                    <a href="#fakelink"><i class="fa fa-google-plus"></i></a>
                  </div>
                  <img src="<c:url value="/resources/foundation/img/avatar/avatar.jpg" />" alt="Image team">
                </div>
                <div class="des">
                  <h3>Randy Gibson</h3>
                  <h5>Art Director</h5>
                </div>
              </div>
            </li>
            <li>
              <div class="the-box-landing text-center the-team-landing full">
                <div class="ava-wrap">
                  <div class="see-detail"></div>
                  <div class="button-link">
                    <a href="#fakelink"><i class="fa fa-facebook"></i></a>
                    <a href="#fakelink"><i class="fa fa-twitter"></i></a>
                    <a href="#fakelink"><i class="fa fa-google-plus"></i></a>
                  </div>
                  <img src="<c:url value="/resources/foundation/img/avatar/avatar.jpg" />" alt="Image team">
                </div>
                <div class="des">
                  <h3>Sara Conner</h3>
                  <h5>Human Resource</h5>
                </div>
              </div>
            </li>
            <li>
              <div class="the-box-landing text-center the-team-landing full">
                <div class="ava-wrap">
                  <div class="see-detail"></div>
                  <div class="button-link">
                    <a href="#fakelink"><i class="fa fa-facebook"></i></a>
                    <a href="#fakelink"><i class="fa fa-twitter"></i></a>
                    <a href="#fakelink"><i class="fa fa-google-plus"></i></a>
                  </div>
                  <img src="<c:url value="/resources/foundation/img/avatar/avatar.jpg" />" alt="Image team">
                </div>
                <div class="des">
                  <h3>Ben Franklin</h3>
                  <h5>Developer</h5>
                </div>
              </div>
            </li>
            <li>
              <div class="the-box-landing text-center the-team-landing full">
                <div class="ava-wrap">
                  <div class="see-detail"></div>
                  <div class="button-link">
                    <a href="#fakelink"><i class="fa fa-facebook"></i></a>
                    <a href="#fakelink"><i class="fa fa-twitter"></i></a>
                    <a href="#fakelink"><i class="fa fa-google-plus"></i></a>
                  </div>
                  <img src="<c:url value="/resources/foundation/img/avatar/avatar.jpg" />" alt="Image team">
                </div>
                <div class="des">
                  <h3>John Smith</h3>
                  <h5>Founder & CEO</h5>
                </div>
              </div>
            </li>
            <li>
              <div class="the-box-landing text-center the-team-landing full">
                <div class="ava-wrap">
                  <div class="see-detail"></div>
                  <div class="button-link">
                    <a href="#fakelink"><i class="fa fa-facebook"></i></a>
                    <a href="#fakelink"><i class="fa fa-twitter"></i></a>
                    <a href="#fakelink"><i class="fa fa-google-plus"></i></a>
                  </div>
                  <img src="<c:url value="/resources/foundation/img/avatar/avatar.jpg" />" alt="Image team">
                </div>
                <div class="des">
                  <h3>Jane Smith</h3>
                  <h5>Marketing</h5>
                </div>
              </div>
            </li>
            <li>
              <div class="the-box-landing text-center the-team-landing full">
                <div class="ava-wrap">
                  <div class="see-detail"></div>
                  <div class="button-link">
                    <a href="#fakelink"><i class="fa fa-facebook"></i></a>
                    <a href="#fakelink"><i class="fa fa-twitter"></i></a>
                    <a href="#fakelink"><i class="fa fa-google-plus"></i></a>
                  </div>
                  <img src="<c:url value="/resources/foundation/img/avatar/avatar.jpg" />" alt="Image team">
                </div>
                <div class="des">
                  <h3>Steve Jones</h3>
                  <h5>Developer</h5>
                </div>
              </div>
            </li>
          </ul>

          <div class="col-md-9 col-sm-6">
            <div class="the-box-landing full text-center the-box-transparent">
              <h2>We're hiring, join with us...</h2>
              <h4>
                Mirum est notare quam littera gothica, quam nunc putamus parum
                claram, anteposuerit litterarum formas humanitatis per seacula
                quarta decima et quinta decima.
              </h4>
              <button class="btn btn-default btn-teplok btn-lg btn-distance"><i class="fa fa-cloud-upload"></i> Submit your application</button>
              <p class="text-danger">*note : all in one zipped file</p>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
  <!--
  ===========================================
  END TEAM SECTION
  ===========================================
  -->

  <!--
  ===========================================
  BEGIN CLIENT SECTION
  ===========================================
  -->
  <div class="section-page-landing section-grey" id="client">
    <div class="inner-section">
      <div class="container text-center">
        <h2 class="text-center">Our Clients</h2>
        <div class="clients row">
          <ul class="small-block-grid-6">
            <li>
              <a href="#fakelink"><img src="" alt="Image client"></a>
            </li>
            <li>
              <a href="#fakelink"><img src="" alt="Image client"></a>
            </li>
            <li>
              <a href="#fakelink"><img src="" alt="Image client"></a>
            </li>
            <li>
              <a href="#fakelink"><img src="" alt="Image client"></a>
            </li>
            <li>
              <a href="#fakelink"><img src="" alt="Image client"></a>
            </li>
            <li>
              <a href="#fakelink"><img src="" alt="Image client"></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!--
  ===========================================
  END CLIENT SECTION
  ===========================================
  -->

  <!--
  ===========================================
  BEGIN QUOTE OF THE DAY SECTION
  ===========================================
  -->
  <div class="section-page-landing section-transparent" id="quote">
    <div class="section-overlay">
      <div class="inner-section">
        <div class="container text-center">
          <div class="quote">
            <h1>&#34;If you can't make it good at least make it look good&#34;</h1>
            <h3>- Bill Gates</h3>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--
  ===========================================
  END QUOTE OF THE DAY SECTION
  ===========================================
  -->

  <!--
  ===========================================
  BEGIN CONTACT SECTION
  ===========================================
  -->
  <div class="section-page-landing" id="contact" data-magellan-destination="contact">
    <div class="inner-section">
      <div class="row">
        <h2 class="text-center">Get in Touch</h2>
        <div class="small-12 medium-9 large-9 column">
          <div class="panel">
            <form role="form" class="contact-form" id="ContactForm" method="post">
              <div class="row">
                <div class="large-6 column">
                  <div class="row">
                    <div class="large-12 column">
                      <label>Your Name
                        <input type="text" placeholder="Your name" />
                      </label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="large-12 column">
                      <div>Your E-mail
                        <div class="row collapse prefix-radius">
                          <div class="small-2 columns">
                            <span class="prefix"><i class="fa fa-envelope"></i></span>
                          </div>
                          <div class="small-10 columns">
                            <input type="text" placeholder="Enter Email">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="small-12 medium-12 large-12 column">
                      <label>Subject
                        <select>
                          <option value="na" selected="">Choose One:</option>
                          <option value="service">General Customer Service</option>
                          <option value="suggestions">Suggestions</option>
                          <option value="product">Product Support</option>
                        </select>
                      </label>
                    </div>
                  </div>
                </div>

                <div class="large-6 column">
                  <label>Your Message
                    <textarea placeholder="Write here your message" rows="8"></textarea>
                  </label>
                </div>
              </div>
              <div class="row">
                <div class="large-12 column">
                  <input type="submit" class="pull-right tiny button"/>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="small-12 medium-3 large-3 columns">
          <div><i class="fa fa-globe"></i> Our office</div>
          <hr/>
          <address>
            <strong>Washington Software Inc.</strong><br>
            20410 Century Blvd., Suite 220<br>
            Germantown, MD 20874<br>
            <abbr title="Phone">
              P:</abbr>
            (301) 208-1800
          </address>
        </div>
      </div>
    </div>
  </div>
  <!--
  ===========================================
  END CONTACT SECTION
  ===========================================
  -->


  <!--
  ===========================================
  BEGIN FOOTER SECTION
  ===========================================
  -->
  <footer>
    <div class="container">
      <div class="row text-center">
        <div class="small-12 medium-4 large-6 columns">
          <h5>ABOUT US</h5>
          <p>
            Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat,
            vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio
            dignissim qui blandit praesent luptatum zzril.
            <br />
            <a href="#fakelink">Read more</a>
          </p>
        </div>
        <div class="small-12 medium-4 large-3 columns">
          <h5>MENUS</h5>
          <ul>
            <li><a href="#fakelink">FAQ</a></li>
            <li><a href="#fakelink">Portfolio</a></li>
            <li><a href="#fakelink">White papers</a></li>
            <li><a href="#fakelink">Our Blog</a></li>
          </ul>
        </div>
        <div class="small-12 medium-4 large-3 columns">
          <h5>SUBSCRIBE</h5>
          <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat,</p>
          <form role="form" method="POST" class="form-subscribe">
            <div class="row collapse">
              <div class="small-10 columns">
                <input type="text" placeholder="Email Address">
              </div>
              <div class="small-2 columns">
                <a href="#" class="button postfix"><i class="fa fa-chevron-right"></i></a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>

    <div class="footer">
      <div class="container">
        &copy; 2014 <a href="#fakelink">Company Name</a><br />
        <a href="#fakelink">AgencyNYC - Responsive Landing Template</a> design by <a href="#" target="_blank">killer.tilapia</a> in Cagayan de Oro City, <abbr title="Philippines">PH</abbr>
      </div>
    </div>
  </footer>
  <!--
  ===========================================
  END FOOTER SECTION
  ===========================================
  -->


  <div id="back-top">
    <a href="#top"><i class="fa fa-chevron-up"></i></a>
  </div>


</div>

<!-- Foundation Requirements -->
<script src="<c:url value="/resources/foundation/js/vendor/jquery.js" />"></script>
<script src="<c:url value="/resources/foundation/js/vendor/modernizr.js" />"></script>
<script src="<c:url value="/resources/foundation/js/vendor/fastclick.js" />"></script>
<script src="<c:url value="/resources/foundation/js/vendor/jquery.cookie.js" />"></script>
<script src="<c:url value="/resources/foundation/js/vendor/placeholder.js" />"></script>
<script src="<c:url value="/resources/foundation/js/foundation.min.js" />"></script>

<!-- Landing Page Requirements -->
<script src="<c:url value="/resources/foundation/lib/jquery.throttle-debounce.js" />"></script>
<script src="<c:url value="/resources/foundation/lib/jquery.smooth-scroll.min.js" />"></script>
<script src="<c:url value="/resources/foundation/lib/parallax/jquery.parallax-1.1.3.js" />"></script>
<script src="<c:url value="/resources/foundation/lib/parallax/TweenMax.min.js" />"></script>
<script src="<c:url value="/resources/foundation/lib/parallax/jquery.superscrollorama.js" />"></script>
<script src="<c:url value="/resources/foundation/lib/jquery.backstretch.min.js" />"></script>
<script src="<c:url value="/resources/foundation/lib/jquery-scrollspy.js" />"></script>
<script src="<c:url value="/resources/foundation/lib/jquery.shuffle.js" />"></script>
<script src="<c:url value="/resources/foundation/lib/slick.min.js" />"></script>

<script src="<c:url value="/resources/foundation/js/agency-nyc.js" />"></script>

<script>
  $(document).foundation();

  //             $.backstretch([
  //                 "<c:url value='/resources/foundation/img/image001.jpg' />",
  //                 "<c:url value='/resources/foundation/img/image002.jpg' />",
  //                 "<c:url value='/resources/foundation/img/image003.jpg' />",
  //                 "<c:url value='/resources/foundation/img/image004.jpg' />"
  //             ], {
  //                 fade: 750,
  //                 duration: 6000
  //             });
  $.backstretch([
    "<c:url value='' />"
  ], {
    fade: 750,
    duration: 6000
  });
</script>
</body>
</html>
