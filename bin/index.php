<!DOCTYPE html>

  <html lang="en">

	 <head>

      <!-- MADE BY: -->
      <!-- http://www.grifo.tv -->

      <title>GRIFO &mdash; Danilo Figueiredo, Creative Developer</title>

			<meta charset="utf-8">

      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <meta http-equiv="content-language" content="en" />
      
      <meta name="viewport" content="user-scalable=yes, width=device-width" />
      <meta name="apple-mobile-web-app-capable" content="yes">
      <meta name="apple-mobile-web-app-status-bar-style" content="black" />  

      <meta itemprop="image" content="http://www.grifo.tv/site.png">
      <meta property="og:image" content="http://www.grifo.tv/site.png" />
      <link rel="image_src" href="http://www.grifo.tv/site.png" />
      <link rel="shortcut icon" href="favicon.ico">
      <link rel="apple-touch-icon" href="apple.png">

      <meta itemprop="name" content="GRIFO">
      <meta itemprop="description" content="I’m Danilo Figueiredo a Creative Developer from Brazil, crafting interactive experiences for digital platforms. I’m based in London and currently work at Hi-ReS!">
      <meta name="description" content="I’m Danilo Figueiredo a Creative Developer from Brazil, crafting interactive experiences for digital platforms. I’m based in London and currently work at Hi-ReS!">
      <meta name="keywords" content="Danilo Figueiredo, Brazilian, Creative, Flash, Motion, Animation, Design, Designer, Development, Developer, Coder, Digital, Interactive, London, Sao Paulo, Glasgow, Hi-ReS!, Less Rain, Grafikonstruct, Curious Group" />
      <meta property="og:title" content="GRIFO" />
      <meta property="og:description" content="I’m Danilo Figueiredo a Creative Developer from Brazil, crafting interactive experiences for digital platforms. I’m based in London and currently work at Hi-ReS!" />

      <meta name="author" content="http://www.grifo.tv" />
      <meta name="copyright" content="grifo.tv" />
      <meta name="robots" content = "all" />
      <meta name="robots" content = "index, follow" />
      <meta name="revisit-after" content="30 days" />
      <meta name="audience" content="all" />

      <script>
      if ( document.location.href.indexOf( 'http://grifo.tv' ) == 0 ){
        document.location = document.location.href.replace( 'http://grifo.tv', 'http://www.grifo.tv' );
      }
      </script>

      <link rel="stylesheet" href="css/style.min.css">
  		
      <!-- GOOGLE ANALYTICS -->
      <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-10329072-1']);
        _gaq.push(['_trackPageview']);

        (function() {
          var ga = document.createElement('script');
          ga.type = 'text/javascript';
          ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0];
          s.parentNode.insertBefore(ga, s);
        })();

      </script>
    </head>
  	
    <body>
        <canvas id="draw" width="100%" height="100%" resize="true"></canvas>
    </body>


<!-- TEMPLATE: APP -->
			<script type="text/template" id="template_app">

      <!-- HEADER -->
      <div id="container-header">

        <div id="header">
        
          <a href="#/projects/"><img id="logo" src="images/logo.png" /></a>

          <div id="header-center">

            <div id="nav">

              <a id="menu-projects" href="#/projects/" class="menu">projects</a>
              <font class="menu-space">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
              <a id="menu-tags" href="#/tags/" class="menu">tags</a>
              <font class="menu-space">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
              <a id="menu-stream" href="#/stream/" class="menu">stream</a>
              <font class="menu-space">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
              <a id="menu-about" href="#/about/" class="menu">about</a>
            
            </div>
          
          </div>

          <div id="header-left">

            <a id="arrow-top" href="#">⇡</a>

          </div>

          <div id="header-right">

            <div class="share">
              <a id="share-twitter" href="#"><img src="images/share/twitter.png" /></a>
            </div>
            <div class="share">
              <a id="share-facebook" href="#"><img src="images/share/facebook.png" /></a>
            </div>

          </div>

        </div>

      </div>

      <!-- HEADER BG -->
      <div id="container-header-bg">

        <div id="header-bg">

          <div id="header-bar-bg"></div>
          <div id="header-bar"></div>

        </div>

      </div>

      <!-- BODY -->
			<div id="container-body">

          <div id="tags-page" class="new-row"></div>

  
          <div id="body-content" class="new-row content">

            <div id="projects-page"></div>
            <div id="project-page"></div>
            <div id="stream-page"></div>
            <div id="about-page"></div>

          </div>

          <!-- FOOTER -->
          <div class="new-row content">
            <br/><br/>
            <hr/>


            <div class="size1of3">
              <h3><%= footer1_title %></h3>
              <div class="new-row">
                <br/><%= footer1_copy %><br/>
                <div id="follow">

                  <div class="follow-icon" id="follow-twitter">
                    <a href="http://www.twitter.com/grifotv" target="_blank">
                      <img class="follow-icon-out" src="images/follow/twitter.png" />
                      <img class="follow-icon-over" src="images/follow/twitter-over.png" />
                    </a>
                  </div>

                  <div class="follow-icon" id="follow-github">
                    <a href="http://www.github.com/grifotv" target="_blank">
                    <img class="follow-icon-out" src="images/follow/github.png" />
                    <img class="follow-icon-over" src="images/follow/github-over.png" />
                    </a>
                  </div>

                  <div class="follow-icon" id="follow-linkedin">
                    <a href="http://www.linkedin.com/in/danilofigueiredo" target="_blank">
                    <img class="follow-icon-out" src="images/follow/linkedin.png" />
                    <img class="follow-icon-over" src="images/follow/linkedin-over.png" />
                    </a>
                  </div>

                  <div class="follow-icon" id="follow-flickr">
                    <a href="http://www.flickr.com/grifotv" target="_blank">
                    <img class="follow-icon-out" src="images/follow/flickr.png" />
                    <img class="follow-icon-over" src="images/follow/flickr-over.png" />
                    </a>
                  </div>

                  <div class="follow-icon" id="follow-vimeo">
                    <a href="http://www.vimeo.com/grifotv" target="_blank">
                    <img class="follow-icon-out" src="images/follow/vimeo.png" />
                    <img class="follow-icon-over" src="images/follow/vimeo-over.png" />
                    </a>
                  </div>

                  <div class="follow-icon" id="follow-youtube">
                    <a href="http://www.youtube.com/grifotvmobile" target="_blank">
                    <img class="follow-icon-out" src="images/follow/youtube.png" />
                    <img class="follow-icon-over" src="images/follow/youtube-over.png" />
                    </a>
                  </div>

                  <div class="follow-icon" id="follow-blog">
                    <a href="http://blog.grifo.tv" target="_blank">
                    <img class="follow-icon-out" src="images/follow/blog.png" />
                    <img class="follow-icon-over" src="images/follow/blog-over.png" />
                    </a>
                  </div>

                </div>

              </div>

            </div>

            <div class="size1of3">
              <h3><%= footer2_title %></h3>
              <div class="new-row"><br/><%= footer2_copy %></div>
            </div>

            <div class="size1of3">
              <h3><%= footer3_title %></h3>
              <div class="new-row"><br/><%= footer3_copy %></div>
            </div>

          </div>

          <!--
          <div id="container-gap" class="new-row">
          </div>
          -->

        </div>

			</script>





<!-- TEMPLATE: ABOUT PAGE -->
      <script type="text/template" id="template_overview">
       <div class="new-row">
          <div class="size1of3 profile-picture">
            <img src="<%= image %>" />
            <br/>
            <br/>
          </div>
          <div class="size2of3">
            <h3><%= label %></h3>
            <div class="new-row">
              <br/><br/>
              <p><h2><%= headline %></h2></p>
              <br/>
              <div class="copy">
              <%= copy %></div>
              <br/>
              <br/>
            </div>
          </div>
        </div>
      </script>


      <script type="text/template" id="template_experiences">
        <div id="columns" class="new-row">
          <div id="column-0" class="size1of2"></div>
          <div id="column-1" class="size1of2"></div>
        </div>
      </script>

      <script type="text/template" id="template_experience_group">
        <hr/>
        <h3><%= label %></h3>
        <div class="new-row">
          <br/>
          <div class="inner-left"></div>
          <div class="inner-right"></div>
        </div>
      </script>
      
      <script type="text/template" id="template_experience_group_gap">
        <div class="new-row"></div>
      </script>

      <script type="text/template" id="template_line_left">
        <p class="date"><%= label %></p>
      </script>

      <script type="text/template" id="template_line_right">
        <p><%= label %></p>
      </script>

      <script type="text/template" id="template_line_right_plus">
        <p><%= label %> <a href="<%= url %>" target="<%= window %>" class="plus">+</a></p>
      </script>

      <script type="text/template" id="template_line_gap">
        <br/>
      </script>
      

      <script type="text/template" id="template_brands">
       <div class="new-row">
          <div class="size1of1">
            <hr/>
            <h3><%= label %></h3>
            <div class="new-row">
              <br/>
              <div id="brands"></div>
            </div>
            <br/>
          </div>
        </div>
      </script>




<!-- TEMPLATE: STREAM PAGE -->
        <script type="text/template" id="template_page_stream">
          <div id="stream-grid" class="new-row">
            <div id="word-grid">
              <div class="size1of3 media-stream-item">
                <h3><%= label %></h3>
              </div>
            </div>
            <div id="media-grid"></div>
          </div>
        </script>











<!-- TEMPLATE: PROJECT PAGE -->
        <script type="text/template" id="template_page_project">

          <div class="new-row">
            <br/>
            <div class="size1of1">
              <div class="video-container"><%= video %></div>
              <br/><br/>
            </div>
          </div>


          <div class="new-row">
            <div class="size2of3">
              <h1><%= title %></h1>
              <h2><%= headline %></h2>
                <div class="new-row copy-project">
                  <br/>
                  <%= copy %>
                </div><br/><br/>
            </div>


            <div id="info-right" class="size1of3">

              <div class="new-row" style="text-align:right;">
                <a class="view-project" href="<%= url %>" target="_blank">VIEW PROJECT</a>
                <br/><br/>
              </div>

              <div class="new-row">
                <hr/>
                <h3>TAGS</h3>
                <div class="new-row">
                  <br/>
                  <div id="tags-container"></div>
                  <br/><br/>
                </div>
              </div>

            </div>
          </div>

          <div class="new-row size1of1">
            <br/>
            <div id="images-container"></div>
            <br/><br/>
          </div>

          <% if(showArrows){ %>
          <a href="<%= prevUrl %>" class="prev-project pagination">
            <div class="arrow animated">Previous</div>
          </a>

          <a href="<%= nextUrl %>" class="next-project pagination">
            <div class="arrow animated">Next</div>
          </a>
          <% } %>

        </script>
			

<!-- TEMPLATE: CREDIT & CREDIT GROUP -->
        <script type="text/template" id="template_credit_group">
          <hr/>
          <h3><%= label %></h3>
          <div class="new-row">
            <br/>
            <p class="date"></p>
              <br/><br/>
          </div>
        </script>

        <script type="text/template" id="template_credit">
          <%= label %> — 
        </script>


<!-- TEMPLATE: PROFILE -->
        <script type="text/template" id="template_profile">
          <a href='<%= url %>' target='<%= window %>'><%= label %></a>
        </script>


<!-- TEMPLATE: THUMBNAIL -->
  			<script type="text/template" id="template_thumbnail">
          <div class="grid-item-image"><img src="<%= image %>" alt="<%= title %>" /></div>
          <div class="grid-item-name"><%= title %></div>
          <div class="grid-item-tags"></div>
          <div class="grid-item-over"></div>
  			</script>


<!-- TEMPLATE: TAG & TAG GROUP -->
        <script type="text/template" id="template_tag_group">
          <h3><%= group %></h3>
          <br/><br/><br/>
        </script>

        <script type="text/template" id="template_tag">
          <a href="#/tags/<%= id %>" class="tag"><%= label %></a>
        </script>


<!-- TEMPLATE: BRAND & BRAND LINK -->
        <script type="text/template" id="template_brand">
          <img src='<%= image %>' alt='<%= label %>' />
        </script>

        <script type="text/template" id="template_brand_link">
          <a href='<%= url %>' target='<%= window %>' ><img src='<%= image %>' alt='<%= label %>' /></a>
        </script>


<!-- TEMPLATE: PROJECT IMAGE -->
        <script type="text/template" id="template_project_image">
          <img class="project-image" src="<%= image %>" />
        </script>


<!-- TEMPLATE: TWITTER -->
        <script type="text/template" id="template_twitter">
            <h5><%= label %><br/></h5>
            ⇢ <%= date %>, from <a href="<%= url %>" target="_blank">Twitter</a>
        </script>


<!-- TEMPLATE: GITHUB -->
        <script type="text/template" id="template_github">
            <h4><%= label %><br/></h4><br/>
            ⇢ <%= date %>, from <a href="<%= url %>" target="_blank">Github</a>
        </script>


<!-- TEMPLATE: BLOG -->
        <script type="text/template" id="template_blog">
            <h5><a href="<%= url %>" target="_blank"><%= title %></a><br/></h5>
            <p class="copy"><%= description %></p>
            ⇢ <%= date %>, from <a href="<%= url %>" target="_blank">Blog</a>
        </script>


<!-- TEMPLATE: YOUTUBE -->
        <script type="text/template" id="template_youtube_portrait">
            <div style="width:306px;height:408px;margin-left:-119px;">
              <a href="<%= url %>" target="_blank"><img src="<%= image %>" height="100%"/></a>
            </div>
            <p>⇢ <%= date %>, from <a href="<%= url %>" target="_blank">Youtube</a></p>
        </script>

        <script type="text/template" id="template_youtube_landscape">
            <div style="width:306px;height:229px;">
              <a href="<%= url %>" target="_blank"><img src="<%= image %>" width="100%" /></a>
            </div>
            <p>⇢ <%= date %>, from <a href="<%= url %>" target="_blank">Youtube</a></p>
        </script>


<!-- TEMPLATE: FLICKR -->
        <script type="text/template" id="template_flickr_portrait">
            <div class="flickr-stream-item"><a href="<%= url %>" target="_blank"><img src="<%= image %>" style="width: 100%;" /></a></div>
            <p>⇢ <%= date %>, from <a href="<%= url %>" target="_blank">Flickr</a></p>
        </script>

        <script type="text/template" id="template_flickr_landscape">
            <div class="flickr-stream-item"><a href="<%= url %>" target="_blank"><img src="<%= image %>" style="height: 100%;" /></a></div>
            <p>⇢ <%= date %>, from <a href="<%= url %>" target="_blank">Flickr</a></p>
        </script>


<!-- LIBS JS -->
        <script src="js/lib/jquery.min.js"></script>
        <script src="js/lib/underscore.min.js"></script>
        <script src="js/lib/backbone.min.js"></script>
        <script src="js/lib/jquery.isotope.min.js"></script>
        <script src="js/lib/jquery-ui-1.8.6.custom.min.js"></script>
<!--        <script src="js/lib/modernizr-2.5.3.js"></script>-->

<!-- BG JS -->
        <script src="js/lib/paper.min.js" type="text/javascript" id="paperJs"></script>
        <script src="js/bg.min.js" type="text/paperscript" canvas="draw" id="bgJs"></script>
          

<!-- APP JS -->
        <script src="js/app.min.js" type="text/javascript"></script>



</html>
