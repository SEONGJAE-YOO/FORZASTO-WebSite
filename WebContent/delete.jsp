<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="ch14.BoardBean"%>
<jsp:useBean id="bMgr" class="ch14.BoardMgr" />
<html>
<head>
<title>���̾�Ʈ ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="assets/css/style08.css">
    <link rel="stylesheet" href="assets/css/login.css"> 
    <link rel="stylesheet" href="assets/css/swiper.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.css">
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	if (request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbPass = bean.getPass();
		if (inPass.equals(dbPass)) {
			bMgr.deleteBoard(num);
			String url = "list.jsp?nowPage=" + nowPage;
			response.sendRedirect(url);
		} else {
%>
<script type="text/javascript">
	alert("�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.");
	history.back();
</script>
<%}
	} else {
%>
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("�н����带 �Է��ϼ���.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
</script>
</head>
<body bgcolor="#ffffff">
<header style="height:110px;">
		<div >
			
			<!-- 20160204 �α��� �� �ΰ� ���� ���� -->               
			<div class="inner">
				<!-- �ֻ�� ���� -->
				<div class="top_gnb_wrap">			
					<ul class="top_gnb cleafix">
						<li>
						</li>
						
					</ul>
				</div>
				<script>
					function deleteCookie( cookieName ){
						var expireDate = new Date();

						//���� ��¥�� ��Ű �Ҹ� ��¥�� �����Ѵ�.
						expireDate.setDate( expireDate.getDate() - 1 );
						document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/; domain=dietshin.com";
					}
				</script>
				<!-- �ֻ�� ���� -->

				
				<!-- ���ã�� �߰� -->
				<ul class="util_le clfix">
					<li id="bookmarksite"><a href="javascript:;" onclick="bookmarksite('���̾�Ʈ��','http://www.dietshin.com/main.asp');">���ã��</a></li>
				</ul>

				<script>
					if (navigator.userAgent.search('Firefox') != -1){
						$("#bookmarksite").HTML("<a href=http://www.dietshin.com title=���̾�Ʈ�� rel=sidebar><img src=/img/common/topmenu01_off.gif ></a>");
						//document.getElementById("bookmarksite").innerHTML = "<a href=http://www.dietshin.com title=���̾�Ʈ�� rel=sidebar><img src=/img/common/topmenu01_off.gif ></a>";
					}
				</script>
				<!-- //���ã�� �߰� -->		
				
				
					<ul class="util clfix">
						<li><a href="userLogin.jsp">�α���</a></li>
						<li><a href="userJoin.jsp">ȸ������</a></li>
						
					</ul>
				 
			</div>		
			<div class="logo_box">
				<ul class="logo">
					<li><a href="NewFile9.html"><img src="assets/img/project2.png" width=100px height=57px  alt="FORZASTO" /></a></li>
				</ul>
			</div>
			<!-- //20160204 �α��� ���� ���� -->
			  
			
				<!-- 20160204 ���������� �޴����� ���� -->  
				<div class="gnb_sub-wrap">
					<div class="gnb_sub_bl"></div>
					<ul class="gnb_sub clfix">
						<li>
							<a href="/community/column_list.asp" ><img src="" alt="���̾�Ʈ����" /></a><!-- 2014-12-09 Ȱ��ȭ �� a��Ŭ���� active�߰� -->
							<ul class="sub sub01">
								<li><a href="/community/column_list.asp">��ü</a></li>
								<li><a href="calumall.html">Į��</a></li>
								<li><a href="tipall.html">�</a></li>
								<li><a href="/community/column_list.asp?sub_menu_id=5">�����ı�</a></li>
							</ul>
						</li>
						<li>
							<a href="recipemain.html" ><img src="" alt="���̾�Ʈ ������" /></a>
							<ul class="sub sub02">
								<li><a href="recipemain.html">��ü</a></li>
								<li><a href="recipemain.html">�ѽ�</a></li>
				               <li><a href="recipemain.html">�Ͻ�</a></li>
				        	<li><a href="recipemain.html">���</a></li>
				            <li><a href="recipemain.html">����Ʈ</a></li>
				               
								
							</ul>
						</li>
						
						
						<!-- 20160204 �޴� ���� �� �߰� -->	
						<li>                 
							<a href="/community/bbs_main.asp" ><img src="" alt="Ŀ�´�Ƽ" /></a>
							<ul class="sub sub04">
								<li><a href="/community/bbs_main.asp">��ü</a></li>
								<li><a href="userLogin.jsp">���̾�Ʈ���</a></li>
								<li><a href="/community/photo_list.asp?menu_id=1">�ڱػ���</a></li>
								<li><a href="/community/photo_list.asp?menu_id=9">�Ĵ�</a></li>
								<li><a href="/community/bbs_list.asp?menu_id=126">��&���Ͽ�</a></li>
								
							</ul>
						</li>				
									
						<li>
							<a href="/community/together_challenge_main.asp" ><img src="" alt="�Բ������ؿ�" /></a>
							<ul class="sub sub05">
								<li><a href="/community/together_challenge_main.asp">��ü</a></li>
								<li><a href="/community/bbs_list.asp?menu_id=20">30�� ����</a></li>
								<li><a href="/community/together_challenge_list.asp?menu_id=10000">�׷��</a></li>
							</ul>
						</li>				
						<li>                 
							<a href="/community/bbs_main.asp" ><img src="" alt="������" /></a>
							
						</li>
						<!-- //20160204 �޴� ���� �� �߰� -->	
					</ul>
				</div>
				<!-- //20160204 ���������� �޴����� ���� -->
			
		<div>
	</header><!-- // header -->
        <br>
       
        

	<div align="center">
		<br/><br/>
		<table width="600" cellpadding="3">
			<tr>
				<td bgcolor=#dddddd height="21" align="center">
					������� ��й�ȣ�� �Է����ּ���.
				</td>
			</tr>
		</table>
		<br>
		<form name="delFrm" method="post" action="delete.jsp">
			<table width="600" cellpadding="2">
				<tr>
					<td align="center">
						<table>
							<tr>
								<td align="center">
									<input type="password" name="pass" size="17" maxlength="15">
								</td>
							</tr>
							<tr>
								<td><hr size="1" color="#eeeeee"/></td>
							</tr>
							<tr>
								<td align="center"><br>
									<input type="button" value="�����Ϸ�" onClick="check()"> 
									<input type="reset" value="�ٽþ���">
									<input type="button" value="�ڷ�" onClick="history.go(-1)">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="num" value="<%=num%>">
		</form>
	</div>
	<%}%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	  <!-- �ڹٽ�ũ��Ʈ ���̺귯�� -->
    <script src="assets/js/jquery.min_1.12.4.js"></script>
    <script src="assets/js/modernizr-custom.js"></script>
    <script src="assets/js/ie-checker.js"></script>
    <script src="assets/js/swiper.min.js"></script>
        <script src="assets/js/common_sub.js"></script>
    <script>
        //��� �̹��� �����̵�
        var mySwiper = new Swiper('.swiper-container', {
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                type: 'bullets',
            },
            autoplay: {
                delay: 5000,
            },
        });
        
        //��ȭ��Ʈ �̹��� �����̵�
        var mySwiper = new Swiper('.swiper-container2', {
            slidesPerView: 4,
            spaceBetween: 24,
            mousewheel: {
                invert: true,
            },
            keyboard: {
                enabled: true,
                onlyInViewport: false,
            },
            autoplay: {
                delay: 3000,
            },
        });
        
        //��ȭ��Ʈ �� �޴�
        var movBtn = $(".movie_title > ul > li");
        var movCont = $(".movie_chart > div");
        
        movCont.hide().eq(0).show();
        
        movBtn.click(function(e){
            e.preventDefault();
            var target = $(this);
            var index = target.index();
            movBtn.removeClass("active");
            target.addClass("active");
            movCont.css("display","none");
            movCont.eq(index).css("display","block");
        });
        

    </script>
    <br>
    <br>
    <br>
  
 
    <!-- footer // -->

	<div class="footer">
    	<div class="inner_top font_ng">
			<ul class="notice cleafix">
				<!--<li><a href="/community/mem_info_noti.asp">����������޹�ħ</a></li> 2019.04.12 ���̳������û
				<li><a href="#layer-partner" class="btn-layer-open">���޹���</a></li>
				<li class="last"><a href="/community/access_terms.asp">�̿���</a></li> -->
				<li><a href="https://dshop.dietshin.com/mem_info_noti.asp" target="_blank">����������޹�ħ</a></li> 
				<li><a href="#layer-partner" class="btn-layer-open">���޹���</a></li>
				<li class="last"><a href="https://dshop.dietshin.com/access_terms.asp" target="_blank">�̿���</a></li>
			</ul>
        </div>
        	
		<div class="footer_inner font_ng">
			<ul>
				<li class="li36">
                	<div class="cscenter_w">
                    	<ul>
                        	<li><span class="cscenter_tit">������</span></li>
                            <li><span class="cscenter_titline"></span></li>
                            <li><span class="cscenter_email"><a href="yuseong12345@naver.com"><img src="assets/img/ico_email.png"  >yuseong12345@naver.com</a></span></li>
                            <li><span class="cscenter_txt">���ǻ����� �����ڿ��� �Խ��� �Ǵ� �̸��� �ּҷ�<br>
                            �����ֽø� ���� ���ϳ��� ȸ�ŵ帮���� �ϰڽ��ϴ�.</span></li>
                            <li class="mt15"><a href="/community/bbs_list.asp?menu_id=72" class="btn_1to1">�����ڿ���</a></li>
                        </ul>
                    </div>
                </li>
				<li class="li34">  
                	<div class="cscenter_w">  
                    	<ul>
                        	<li><span class="cscenter_tit">FORZASTO</span></li>
                            <li><span class="cscenter_titline"></span></li>
                            <li><span class="cscenter_txt mt20">(��)FORZASTO ��ǥ ������</span></li>
                            <li><span class="cscenter_txt mt10">���� : ����ڵ�Ϲ�ȣ 130-46-24148<br>
                            ��õ ���� ���굿 ���׹̷� 448���� 56</span></li>
                            <li><a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp" class="btn_licensee mt5">����ڹ�ȣ��ȸ</a></li>
                            <li><span class="cscenter_txt mt10">���� : ����ڵ�Ϲ�ȣ 376-25-55086<br>
                            ��õ ���� ���굿 ���׹̷� 448���� 56</span></li>
                            <li><span class="cscenter_txt mt10">����Ǹž��Ű� ��2019-��õ����<br>
                            �ǰ���ɽ�ǰ�Ǹž� ��2019-031645 (�۳�)</span></li>
                        </ul>
                    </div>
                </li>
				<li class="li24">
                	<div class="notice_w">
                    	<ul>
                        	<li><span class="cscenter_tit">��������</span></li>
                            <li><span class="cscenter_titline"></span></li>

							<li><span class="notice_txt"><a href="/community/bbs_view.asp?idx=4363244&ptype=rnoti">��&nbsp; �����ɾ� �ΰŷ�Ʈȯ ü��� ��ǥ</a></span></li>

							<li><span class="notice_txt"><a href="/community/bbs_view.asp?idx=4358559&ptype=rnoti">��&nbsp; [����] 08/29 ���� ���� �� �̿����� �ȳ�</a></span></li>

							<li><span class="notice_txt"><a href="/community/bbs_view.asp?idx=4357009&ptype=rnoti">��&nbsp; ���� �̽��ͺ��� ü��� ���� (08.27~09.05)</a></span></li>

							<li><span class="notice_txt"><a href="/community/bbs_view.asp?idx=4356882&ptype=rnoti">��&nbsp; ��д� ũ�����Ƿ� ü��� ���� (08.27~09.05)</a></span></li>

							<li><span class="notice_txt"><a href="/community/bbs_view.asp?idx=4350789&ptype=rnoti">��&nbsp; ����ó�� �����Ʋ ü��� ���� (08.22~09.01)</a></span></li>

                        </ul>
                    </div>
                    
                    <div class="notice_w mt10">
                    	<ul>
                        	<li><span class="cscenter_tit">SNS</span></li>
                            <li><span class="cscenter_titline"></span></li>
                            <li class="mt15"><a href="https://www.facebook.com/1408140989464114" class="sns_img mr8"><img src="assets/img/ico_facebook.png"></a><a href="https://www.instagram.com/dietshin79" class="sns_img mr8"><img src="assets/img/ico_insta.png"></a><a href="https://blog.naver.com/dietsin79" class="sns_img"><img src="assets/img/ico_blog.png"></a></li>
                              </ul>
                    </div>
                </li>
			</ul>
		</div>
        
        <div class="inner_btm font_ng">
			<p class="inner_btm_t">FORZASTO���� �����ϴ� ��� �������� ���۱��� ����ó �Ǵ� FORZASTO�� ������, �̸� ���� �̿� �� ������ϴ� ��� ���۱ǹ� � ���� ����å���� �� �� �ֽ��ϴ�</p>
        </div>
	</div>
	


</div><!-- // wrap -->
	<span itemscope="" itemtype="http://schema.org/Organization">
	 <link itemprop="url" href="http://www.dietshin.com">
	 <a itemprop="sameAs" href="https://www.facebook.com/dietsin9"></a>
	 <a itemprop="sameAs" href="https://www.instagram.com/dietshin79"></a>
	 <a itemprop="sameAs" href="https://www.youtube.com/channel/UC_eZqsBWCuwNcanFH70FgRw"></a>
	</span>


<!-- 2014-12-17 ���޹��� ���̾� �߰� // -->
<!-- layer // -->

<div class="dimmed"></div>

<div class="layer r8" id="layer-partner">
	<div class="tit">���� ����</div>
	<div class="layer-cont partner">
		<p>�Ʒ� �̸��� �ּҷ� �����ֽø�<br/>���� ���ϳ��� ȸ�ŵ帮���� �ϰڽ��ϴ�.</p>
		<div class="box r5">
			<strong>����� :</strong>
			<a href="yuseong12345@naver.com" class="p-bluegreen">yuseong12345@naver.com</a>
		</div>
		<p class="txt01">�����մϴ�.</p>

		<div class="btn-ac">
			<a href="" id="btn-close1"><img src="/img/btn/btn_ok2.gif" alt="Ȯ��" /></a>
		</div>
	</div>
	<a href="" class="btn-close"><img src="/img/btn/btn_close.png" alt="�ݱ�" /></a>
</div><!-- // 2014-12-17 ���޹��� ���̾� �߰� -->

<!-- ���������� ���� ���/���� -->
<div class="layer r8" id="layer-fileattach">
	<div class="tit">���� ÷��</div>
	<div class="layer-cont fileattach">
		<form name="imgupload" id="data" action="/API/newmember_user_img_reg.asp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="hiddensex" id="hiddensex" value="">
		<div class="file-wrap">
			<input type="file" class="file" id="uploadInputBoxA" name="uploadInputBox" />
			<span class="txt-file"></span>
			<a class="btn"><img src="/img/btn/btn_file_search.gif" alt="ã�ƺ���" /></a>
		</div>
		<p class="txt">��� ������ ���� Ȯ���ڴ� jpg, gif, png �Դϴ�.</p>
		<div class="btn-ac">
			<input type="image" src="/img/btn/btn_ok2.gif" alt="Ȯ��" /></a>
			<a href="" id="btn-close"><img src="/img/btn/btn_cancel2.gif" alt="���" /></a>
		</div>
		</form>
	</div>
	<a href="" class="btn-close"><img src="/img/btn/btn_close.png" alt="�ݱ�" /></a>
</div>
<!-- ���������� ���� ���/���� -->

<!-- 2014-12-17 ������ ���̾� �߰� // -->
<!-- layer // -->
<div class="layer r8" id="layer-center">
	<div class="tit">���� ����</div>
	<div class="layer-cont partner">
		<p>������ �ְų� ���� ������<br/> �����ø� �Ʒ��� �ּҷ�<br/> �����Ͻñ� �ٶ��ϴ�.</p>
		<div class="box r5">
			<strong>�� ���� :</strong>
			<a href="yuseong12345@naver.com" class="p-bluegreen">"yuseong12345@naver.com</a>
		</div>
		<p class="txt01">�����մϴ�.</p>

		<div class="btn-ac">
			<a href="" id="btn-close1"><img src="/img/btn/btn_ok2.gif" alt="Ȯ��" /></a>
		</div>
	</div>
	<a href="" class="btn-close"><img src="/img/btn/btn_close.png" alt="�ݱ�" /></a>
</div><!-- // 2014-12-17 ������ ���̾� �߰� -->

<!-- 2014-12-18  ��ġ���� ���̾� �߰� // -->
<!-- layer // -->
<div class="layer r8" id="layer-map">
	<div class="tit">��ġ����</div>
	<div class="layer-cont map">
		<div id="healthmap"></div>
	</div>
	<a href="" class="btn-close"><img src="/img/btn/btn_close.png" alt="�ݱ�" /></a>
</div><!-- // 2014-12-18 ��ġ���� ���̾� �߰� -->
<!-- layer // -->

<script>
	// ��� Ŭ���� ī��Ʈ ó�� �� ������ �̵�
	function go_location(idx){
		$.ajax({
			type	: "post",
			url		: "/API/banner_click.asp",
			data:{
				"idx":idx
			},
			dataType	: "json",
			async	: false,
			success : function(oResult){
				if (oResult.LINK_URL != '')
				{
					location.href = oResult.LINK_URL;
				}
				return;
			}
		});
	}

	function go_banner_log(idx){
		$.ajax({
			type	: "post",
			url		: "/API/banner_log.asp",
			data:{
				"idx":idx
			},
			dataType	: "json",
			async	: false,
			success : function(oResult){
				if (oResult.LINK_URL != '')
				{
					location.href = oResult.LINK_URL;
				}
				return;
			}
		});
	}
</script>

<!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u=(("https:" == document.location.protocol) ? "https" : "http") + "://stat.0app0.com/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 25]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript';
    g.defer=true; g.async=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>  
<noscript><p><img src="http://stat.0app0.com/piwik.php?idsite=25" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code -->

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-137817445-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-137817445-1');
</script> 
</body>
</html>