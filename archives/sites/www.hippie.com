<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html;charset=iso-8859-1" />
		<meta name="author" content="caroufredsel.frebsite.nl" />

		<title>Hippie Media</title>

		<!-- include jQuery + carouFredSel plugin -->
		<script type="text/javascript" language="javascript" src="jquery-1.8.2.min.js"></script>
		<script type="text/javascript" language="javascript" src="jquery.carouFredSel-6.1.0-packed.js"></script>

		<!-- optionally include helper plugins -->
		<script type="text/javascript" language="javascript" src="helper-plugins/jquery.mousewheel.min.js"></script>
		<script type="text/javascript" language="javascript" src="helper-plugins/jquery.touchSwipe.min.js"></script>
		<script type="text/javascript" language="javascript" src="helper-plugins/jquery.ba-throttle-debounce.min.js"></script>

		<!-- fire plugin onDocumentReady -->
		<script type="text/javascript" language="javascript">
			$(function() {

				//	Basic carousel, no options
				$('#foo0').carouFredSel();

				//	Basic carousel + timer
				$('#foo1').carouFredSel({
					auto: {
						pauseOnHover: 'resume',
						progress: '#timer1'
					}
				});

				//	Scrolled by user interaction
				$('#foo2').carouFredSel({
					auto: false,
					prev: '#prev2',
					next: '#next2',
					pagination: "#pager2",
					mousewheel: true,
					swipe: {
						onMouse: true,
						onTouch: true
					}
				});

				//	Variable number of visible items with variable sizes
				$('#foo3').carouFredSel({
					width: 800,
					height: 'auto',
					prev: '#prev3',
					next: '#next3',
					auto: false
				});

				//	Responsive layout, resizing the items
				$('#foo4').carouFredSel({
					responsive: true,
					width: '100%',
					scroll: 2,
					items: {
						width: 800,
					//	height: '30%',	//	optionally resize item-height
						visible: {
							min: 2,
							max: 6
						}
					}
				});

				//	Fuild layout, centering the items
				$('#foo5').carouFredSel({
					width: '100%',
					scroll: 2
				});

			});
		</script>

		<style type="text/css" media="all">
			html, body {
				padding: 0;
				margin: 0;
				/* height: 100%; */
			}
			body, div, p {
				font-family: Arial, Helvetica, Verdana;
				color: #333;
			}
			body {
				background-color: #f1f1f1;
			}
			h1 {
				font-size: 60px;
			}
			a, a:link, a:active, a:visited {
				color: black;
				text-decoration: none;
			}
			a:hover {
				color: #dc563f;
				text-decoration: none;
			}
			#intro {
				width: 580px;
				margin: 0 auto;
			}
			.wrapper {
				background-color: #f1f1f1;
				width: 960px;
				margin: 0px auto;
				padding: 0px;
				box-shadow: 0 0 0px #f1f1f1;
			}
			.list_carousel {
				background-color: #;
				margin: 0px 0px 0px 20px;
				width: 900px;
			}
			.list_carousel ul {
				margin: 0;
				padding: 0;
				list-style: none;
				display: block;
			}
			.list_carousel li {
				font-size: 40px;
				color: #999;
				text-align: center;
				background-color: #eee;
				border: 5px solid #f1f1f1;
				width: 100px;
				height:100px;
				padding: 0px 0px 0px 50px;
				margin: 6px;
				display: block;
				float: left;
			}
			.list_carousel.responsive {
				width: auto;
				margin-left: 0;
			}
			.clearfix {
				float: none;
				clear: both;
			}
			.prev {
				float: left;
				margin-left: 10px;
			}
			.next {
				float: right;
				margin-right: 10px;
			}
			.pager {
				float: left;
				width: 900px;
				text-align: center;
			}
			.pager a {
				margin: 0 5px;
				text-decoration: none;
			}
			.pager a.selected {
				text-decoration: underline;
			}
			.timer {
				background-color: #999;
				height: 6px;
				width: 0px;
			}
		</style>
	</head>
	<body>
    <div class="wrapper">

<br /><br />
	<div style="float: left;">
   <a href="index.html" target="_self"> <img style="border: none;" class="logo" src="http://hippie.com/resource/logo.JPG" alt="Hippie Media AS" /></a>
    </div>
    <div style="float: right; text-align:right;">
    post@hippie.com
    <br />
    +47 922 86 221
    <br />
      <a href="http://www.facebook.com/groups/hippiemedia/" target="_self"><img style="border: none;" src="http://hippie.com/resource/fbook.JPG" /></a>
    </div>
			<br />

		<br /><br /><br /><br />
      <div style="text-align:left;">
        <a href="index.html" target="_self"><span style="font-size:18px; font-weight: bold;">Hjem</span></a> | 
        <a href="omOss.html" target="_self"><span style="font-size:18px; font-weight: bold;">Om Oss</span></a> | 
      <a href="tjenester.html" target="_self"><span style="font-size:18px; font-weight: bold;">Tjenester</span></a></div>
  <br />
        <div class="clearfix"></div>
        <div style="background-image:url(http://hippie.com/resource/banner.JPG); width:960px; height:280px; background-repeat: no-repeat;">
        <div style="padding:30px; width:350px; color: #333;">
        <h1 style="font-size:18px;"><br />
          HippieMedia er et helhetlig 
media- og 
kommunikasjonsselskap 
 med 
tydelig samfunnsengasjement.</h1>
        <br />
        <br />
<br /><br />
  <a href="omOss.html" target="_self"><img style="border: none;"  src="http://hippie.com/resource/merom.PNG"  /></a>   <a href="tjenester.html" target="_self"><img style="border: none;"  src="http://hippie.com/resource/tjenester.PNG" /></a>
        </div>
        
        
        </div>
        
        
        
        <div class="clearfix"></div>
       
        <br />
      <div style="background-color: #FFFFFF; height:130px; padding: 10px 0px 10px 0px; border-bottom: solid 5px #8bbdbb;">
        	

            
        <div style="float: right; width: 220px; padding: 10px 10px 10px 15px;">
  <a href="tjenester.html#gfx" target="_self"> <img style="border: none; float: left; margin-right: 10px;" src="http://hippie.com/resource/gfx.JPG"  />
        <span style="font-size: 18px; margin-top: 15px;">GRAFISK <br />DESIGN</span><br /><br /><br />
       <span style="font-size:12px;"> Digital, logo og bedriftsprofil, dekor, reklame, trykksaker o.l.</span>
       	  </a></div>

            
            <div style="float: right; width: 220px; padding: 10px;">
         <a href="tjenester.html#web" target="_self"> <img style="border: none; float: left; margin-right: 10px;" src="http://hippie.com/resource/web.jpg"  />
        <span style="font-size: 18px;">WEB, VIDEO &amp; <br />
        STREAM</span><br /><br /><br />
       <span style="font-size:12px;"> Webdesign, apps , programmering, filmproduksjon, direktesending </span>
        	</a></div>
            

            
        <div style="float: right; width: 220px; padding: 10px 0px 10px 10px;">
         <a href="tjenester.html#vid" target="_self"> <img style="border: none; float: left; margin-right: 10px;" src="http://hippie.com/resource/stream.jpg"  />
        <span style="font-size: 18px;">STORYTELLING<br />
        &amp;  REGI</span><br /><br /><br />
       <span style="font-size:12px;">Kommunikasjon, historiefortelling,  program og personlig formidling</span>
        	</a></div>
            
            
        <div style="float: right; width: 220px; padding: 10px;">
         <a href="tjenester.html#kons" target="_self"> <img style="border: none; border: none; float: left; margin-right: 10px;" src="http://hippie.com/resource/evnt.jpg"  />
        <span style="font-size: 18px;">KONSEPT &amp;<br />
        EVENT</span><br /><br /><br />
       <span style="font-size:12px;"> Id�utvikling, CSR prosjekter, strategi og arrang�rhjelp</span></a></div>
        
</div>
        
        
         <div class="clearfix"></div>
        <br />
        <div><span style="font-size: 24px;"><strong>NOEN PROSJEKTER OG SAMARBEIDSPARTNERE</strong></span></div>
      <div style="height:150px; padding: 10px 0px 10px 0px;">
        
        <div style="width: 460px;float: left; background-color: #FFFFFF;">
        <iframe style="float: left; margin: 0px 15px 0px 0px;" src="http://video.partnershipforchange.net/v.ihtml?source=share&photo%5fid=7355193" width="240" height="134" frameborder="0" border="0" scrolling="no" allowfullscreen="1" mozallowfullscreen="1" webkitallowfullscreen="1"></iframe>      <div style="padding:10px;"> <a href="http://www.worldfreedomfund.org" target="_blank"> <b>Aung San Suu Kyi World Freedom Fund</b><br /><br />
      <span style="font-size:12px;">  Co-founder og fast 
leveransepartner 
<br /><br />
<em>.</em></span></a></div>
        </div>
        
        <div style="float: right; width:460px; background-color: #FFFFFF;">
        <iframe style="float: left; margin: 0px 0px 15px 0px;" src="http://video.partnershipforchange.net/v.ihtml?source=share&photo%5fid=7354333" width="240" height="134" frameborder="0" border="0" scrolling="no" allowfullscreen="1" mozallowfullscreen="1" webkitallowfullscreen="1"></iframe>
        <div style="padding:10px;"><a href="http://www.partnershipforchange.net" target="_blank"><b> Partnership for Change</b><br /><br />
      <span style="font-size:12px;">  Co-founder og fast 
leveransepartner <br /><br />
      </span></a>
        </div>
        </div>
        
        </div>
        
        <div class="clearfix"></div>
        
<div class="list_carousel">
				<ul id="foo1">
					<li> <a href="http://www.partnershipforchange.net" target="_blank"><img style="border: none;" src="http://hippie.com/resource/pfc.JPG" /></a></li>
					<li> <a href="http://www.formue.no" target="_blank"><img style="border: none;" src="http://hippie.com/resource/formue.JPG" /></a></li>
 
 					<li> <a href="http://worldfreedomfund.com/" target="_blank"><img style="border: none;" src="http://hippie.com/resource/assk.jpg" /></a></li>                   
                    
                    
                    
                    
		      <li> <a href="http://www.levevidere.no" target="_blank"><img style="border: none;"  src="http://hippie.com/resource/leve.jpg" /></a></li>
					<li> <a href="http://businessforpeace.no/" target="_blank"><img style="border: none;"  src="http://hippie.com/resource/bisspeace.JPG" /></a></li>
					
		      <li> <a href="http://www.norfund.no/" target="_blank"><img style="border: none;"  src="http://hippie.com/resource/norfund.jpg" /></a></li>
					<li> <a href="http://www.operaen.no" target="_blank"><img style="border: none;"  src="http://hippie.com/resource/opera.JPG" /></a></li>
					<li> <a href="http://www.oslocenter.no/" target="_blank"><img style="border: none;"  src="http://hippie.com/resource/oslosenter.JPG" /></a></li>

									<li> <a href="http://www.norsombro.no/" target="_blank"><img style="border: none;"  src="http://hippie.com/resource/norsom.jpg" /></a></li>	
                                    
                                    									<li> <a href="http://norway.usembassy.gov/" target="_blank"><img style="border: none;"  src="http://hippie.com/resource/usembassy.jpg" /></a></li>	
                    
                    
                    
                   
</ul>
				<div class="clearfix"></div>
				
</div>
			<br />
            
            
            <div style="border-top: solid #CCC 1px; padding: 30px; height:150px;">
            	<div style="float: left; width: 400px; border-right: solid #CCC 1px; padding: 0px 40px 0px 0px;">
              <span style="font-size: 56px;"> WE IGNITE CHANGE</span>
                
              </div>
                <div style="float: right; width: 400px; padding: 0px 0px 0px 40px;">
                <img src="http://hippie.com/resource/map.JPG" style="float: right; margin: 0px 0px 0px 15px;" />
              <span style="font-size: 14px; font-weight: bold;">  Kontaktinformasjon</span><br /><br />
<span style="font-size: 12px;">
HippieMedia AS <br />
Sommerogt. 13-15 Solli Plass <br />
Phone: +47 971 69 892<br />
E-mail: post@hippie.com
<br /><br />
<strong>&copy;</strong> 2012 </span>           
                </div>
            
            </div>
            
            
            </div>
            <br /><br />
	</body>
</html>