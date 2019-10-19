<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="ch14.BoardBean"%>
<jsp:useBean id="bMgr" class="ch14.BoardMgr" />
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  bMgr.upCount(num);//조회수 증가
	  BoardBean bean = bMgr.getBoard(num);//게시물 가져오기
	  String name = bean.getName();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String ip = bean.getIp();
	  int count = bean.getCount();
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="assets/css/style08.css">
    <link rel="stylesheet" href="assets/css/login.css"> 
<script type="text/javascript">
	function list(){
	    document.listFrm.submit();
	 } 
	
	function down(filename){
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
	}
</script>
</head>
<body bgcolor="#ffffff">
  
	<header style="height:110px;">
		<div >
			
			<!-- 20160204 로그인 및 로고 영역 수정 -->               
			<div class="inner">
				<!-- 최상단 수정 -->
				<div class="top_gnb_wrap">			
					<ul class="top_gnb cleafix">
						<li>
						</li>
						
					</ul>
				</div>
				<script>
					function deleteCookie( cookieName ){
						var expireDate = new Date();

						//어제 날짜를 쿠키 소멸 날짜로 설정한다.
						expireDate.setDate( expireDate.getDate() - 1 );
						document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/; domain=dietshin.com";
					}
				</script>
				<!-- 최상단 수정 -->

				
				<!-- 즐겨찾기 추가 -->
				<ul class="util_le clfix">
					<li id="bookmarksite"><a href="javascript:;" onclick="bookmarksite('다이어트신','http://www.dietshin.com/main.asp');">즐겨찾기</a></li>
				</ul>

				<script>
					if (navigator.userAgent.search('Firefox') != -1){
						$("#bookmarksite").HTML("<a href=http://www.dietshin.com title=다이어트신 rel=sidebar><img src=/img/common/topmenu01_off.gif ></a>");
						//document.getElementById("bookmarksite").innerHTML = "<a href=http://www.dietshin.com title=다이어트신 rel=sidebar><img src=/img/common/topmenu01_off.gif ></a>";
					}
				</script>
				<!-- //즐겨찾기 추가 -->		
				
				
					<ul class="util clfix">
						<li><a href="userLogin.jsp">로그인</a></li>
						<li><a href="userJoin.jsp">회원가입</a></li>
						
					</ul>
				 
			</div>		
			<div class="logo_box">
				<ul class="logo">
					<li><a href="NewFile9.html"><img src="assets/img/project2.png" width=100px height=57px  alt="FORZASTO" /></a></li>
				</ul>
			</div>
			<!-- //20160204 로그인 영역 수정 -->
			  
			
				<!-- 20160204 서브페이지 메뉴영역 수정 -->  
				<div class="gnb_sub-wrap">
					<div class="gnb_sub_bl"></div>
					<ul class="gnb_sub clfix">
						<li>
							<a href="/community/column_list.asp" ><img src="" alt="다이어트꿀팁" /></a><!-- 2014-12-09 활성화 시 a에클래스 active추가 -->
							<ul class="sub sub01">
								<li><a href="/community/column_list.asp">전체</a></li>
								<li><a href="calumall.html">칼럼</a></li>
								<li><a href="tipall.html">운동</a></li>
								<li><a href="/community/column_list.asp?sub_menu_id=5">성공후기</a></li>
							</ul>
						</li>
						<li>
							<a href="recipemain.html" ><img src="" alt="다이어트 레시피" /></a>
							<ul class="sub sub02">
								<li><a href="recipemain.html">전체</a></li>
								<li><a href="recipemain.html">한식</a></li>
				               <li><a href="recipemain.html">일식</a></li>
				        	<li><a href="recipemain.html">양식</a></li>
				            <li><a href="recipemain.html">디저트</a></li>
				               
								
							</ul>
						</li>
						
						
						<!-- 20160204 메뉴 수정 및 추가 -->	
						<li>                 
							<a href="/community/bbs_main.asp" ><img src="" alt="커뮤니티" /></a>
							<ul class="sub sub04">
								<li><a href="/community/bbs_main.asp">전체</a></li>
								<li><a href="userLogin.jsp">다이어트등록</a></li>
								<li><a href="/community/photo_list.asp?menu_id=1">자극사진</a></li>
								<li><a href="/community/photo_list.asp?menu_id=9">식단</a></li>
								<li><a href="/community/bbs_list.asp?menu_id=126">팁&노하우</a></li>
								
							</ul>
						</li>				
									
						<li>
							<a href="/community/together_challenge_main.asp" ><img src="" alt="함께도전해요" /></a>
							<ul class="sub sub05">
								<li><a href="/community/together_challenge_main.asp">전체</a></li>
								<li><a href="/community/bbs_list.asp?menu_id=20">30일 도전</a></li>
								<li><a href="/community/together_challenge_list.asp?menu_id=10000">그룹방</a></li>
							</ul>
						</li>				
						<li>                 
							<a href="/community/bbs_main.asp" ><img src="" alt="고객센터" /></a>
							
						</li>
						<!-- //20160204 메뉴 수정 및 추가 -->	
					</ul>
				</div>
				<!-- //20160204 서브페이지 메뉴영역 수정 -->
			
		<div>
	</header><!-- // header -->
<br/><br/>
<table align="center" width="850" cellspacing="3">
 <tr>
  <td bgcolor="#9CA2EE" height="25" align="center">글읽기</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" bgcolor="#DDDDDD" width="10%"> 이 름 </td>
  <td bgcolor="#FFFFE8"><%=name%></td>
  <td align="center" bgcolor="#DDDDDD" width="10%"> 등록날짜 </td>
  <td bgcolor="#FFFFE8"><%=regdate%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#DDDDDD"> 제 목</td>
    <td bgcolor="#FFFFE8" colspan="3"><%=subject%></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#DDDDDD">첨부파일</td>
     <td bgcolor="#FFFFE8" colspan="3">
     <% if( filename !=null && !filename.equals("")) {%>
  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>
  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     <%=ip%>로 부터 글을 남기셨습니다./  조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2"> 
 <hr/>
 [ <a href="javascript:list()" >리스트</a> | 
 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >수 정</a> |
 <a href="reply.jsp?nowPage=<%=nowPage%>" >답 변</a> |
 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br/>
  </td>
 </tr>
</table>

<form name="downFrm" action="download.jsp" method="post">
	<input type="hidden" name="filename">
</form>

<form name="listFrm" method="post" action="list.jsp">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<%if(!(keyWord==null || keyWord.equals(""))){ %>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>
   
    <!-- 자바스크립트 라이브러리 -->
    <script src="assets/js/jquery.min_1.12.4.js"></script>
    <script src="assets/js/modernizr-custom.js"></script>
    <script src="assets/js/ie-checker.js"></script>
    <script src="assets/js/swiper.min.js"></script>
        <script src="assets/js/common_sub.js"></script>
    <script>
        //배너 이미지 슬라이드
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
        
        //영화차트 이미지 슬라이드
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
        
        //영화차트 탭 메뉴
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
				<!--<li><a href="/community/mem_info_noti.asp">개인정보취급방침</a></li> 2019.04.12 나미나차장요청
				<li><a href="#layer-partner" class="btn-layer-open">제휴문의</a></li>
				<li class="last"><a href="/community/access_terms.asp">이용약관</a></li> -->
				<li><a href="https://dshop.dietshin.com/mem_info_noti.asp" target="_blank">개인정보취급방침</a></li> 
				<li><a href="#layer-partner" class="btn-layer-open">제휴문의</a></li>
				<li class="last"><a href="https://dshop.dietshin.com/access_terms.asp" target="_blank">이용약관</a></li>
			</ul>
        </div>
        	
		<div class="footer_inner font_ng">
			<ul>
				<li class="li36">
                	<div class="cscenter_w">
                    	<ul>
                        	<li><span class="cscenter_tit">고객센터</span></li>
                            <li><span class="cscenter_titline"></span></li>
                            <li><span class="cscenter_email"><a href="yuseong12345@naver.com"><img src="assets/img/ico_email.png"  >yuseong12345@naver.com</a></span></li>
                            <li><span class="cscenter_txt">문의사항은 관리자에게 게시판 또는 이메일 주소로<br>
                            연락주시면 빠른 시일내에 회신드리도록 하겠습니다.</span></li>
                            <li class="mt15"><a href="/community/bbs_list.asp?menu_id=72" class="btn_1to1">관리자에게</a></li>
                        </ul>
                    </div>
                </li>
				<li class="li34">  
                	<div class="cscenter_w">  
                    	<ul>
                        	<li><span class="cscenter_tit">FORZASTO</span></li>
                            <li><span class="cscenter_titline"></span></li>
                            <li><span class="cscenter_txt mt20">(주)FORZASTO 대표 유성재</span></li>
                            <li><span class="cscenter_txt mt10">본점 : 사업자등록번호 130-46-24148<br>
                            인천 부평구 구산동 무네미로 448번길 56</span></li>
                            <li><a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp" class="btn_licensee mt5">사업자번호조회</a></li>
                            <li><span class="cscenter_txt mt10">지점 : 사업자등록번호 376-25-55086<br>
                            인천 부평구 구산동 무네미로 448번길 56</span></li>
                            <li><span class="cscenter_txt mt10">통신판매업신고 제2019-인천부평<br>
                            건강기능식품판매업 제2019-031645 (송내)</span></li>
                        </ul>
                    </div>
                </li>
				<li class="li24">
                	<div class="notice_w">
                    	<ul>
                        	<li><span class="cscenter_tit">공지사항</span></li>
                            <li><span class="cscenter_titline"></span></li>

							<li><span class="notice_txt"><a href="/community/bbs_view.asp?idx=4363244&ptype=rnoti">·&nbsp; 마이케어 핑거루트환 체험단 발표</a></span></li>

							<li><span class="notice_txt"><a href="/community/bbs_view.asp?idx=4358559&ptype=rnoti">·&nbsp; [공지] 08/29 서버 점검 및 이용제한 안내</a></span></li>

							<li><span class="notice_txt"><a href="/community/bbs_view.asp?idx=4357009&ptype=rnoti">·&nbsp; 헤이 미스터브라운 체험단 모집 (08.27~09.05)</a></span></li>

							<li><span class="notice_txt"><a href="/community/bbs_view.asp?idx=4356882&ptype=rnoti">·&nbsp; 통밀당 크리스피롤 체험단 모집 (08.27~09.05)</a></span></li>

							<li><span class="notice_txt"><a href="/community/bbs_view.asp?idx=4350789&ptype=rnoti">·&nbsp; 네이처샵 레몬머틀 체험단 모집 (08.22~09.01)</a></span></li>

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
			<p class="inner_btm_t">FORZASTO에서 제공하는 모든 콘텐츠의 저작권은 제공처 또는 FORZASTO에 있으며, 이를 무단 이용 및 재배포하는 경우 저작권법 등에 따라 법적책임을 질 수 있습니다</p>
        </div>
	</div>
	


</div><!-- // wrap -->
	<span itemscope="" itemtype="http://schema.org/Organization">
	 <link itemprop="url" href="http://www.dietshin.com">
	 <a itemprop="sameAs" href="https://www.facebook.com/dietsin9"></a>
	 <a itemprop="sameAs" href="https://www.instagram.com/dietshin79"></a>
	 <a itemprop="sameAs" href="https://www.youtube.com/channel/UC_eZqsBWCuwNcanFH70FgRw"></a>
	</span>


<!-- 2014-12-17 제휴문의 레이어 추가 // -->
<!-- layer // -->

<div class="dimmed"></div>

<div class="layer r8" id="layer-partner">
	<div class="tit">제휴 문의</div>
	<div class="layer-cont partner">
		<p>아래 이메일 주소로 연락주시면<br/>빠른 시일내에 회신드리도록 하겠습니다.</p>
		<div class="box r5">
			<strong>담당자 :</strong>
			<a href="yuseong12345@naver.com" class="p-bluegreen">yuseong12345@naver.com</a>
		</div>
		<p class="txt01">감사합니다.</p>

		<div class="btn-ac">
			<a href="" id="btn-close1"><img src="/img/btn/btn_ok2.gif" alt="확인" /></a>
		</div>
	</div>
	<a href="" class="btn-close"><img src="/img/btn/btn_close.png" alt="닫기" /></a>
</div><!-- // 2014-12-17 제휴문의 레이어 추가 -->

<!-- 마이페이지 사진 등록/변경 -->
<div class="layer r8" id="layer-fileattach">
	<div class="tit">사진 첨부</div>
	<div class="layer-cont fileattach">
		<form name="imgupload" id="data" action="/API/newmember_user_img_reg.asp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="hiddensex" id="hiddensex" value="">
		<div class="file-wrap">
			<input type="file" class="file" id="uploadInputBoxA" name="uploadInputBox" />
			<span class="txt-file"></span>
			<a class="btn"><img src="/img/btn/btn_file_search.gif" alt="찾아보기" /></a>
		</div>
		<p class="txt">등록 가능한 파일 확장자는 jpg, gif, png 입니다.</p>
		<div class="btn-ac">
			<input type="image" src="/img/btn/btn_ok2.gif" alt="확인" /></a>
			<a href="" id="btn-close"><img src="/img/btn/btn_cancel2.gif" alt="취소" /></a>
		</div>
		</form>
	</div>
	<a href="" class="btn-close"><img src="/img/btn/btn_close.png" alt="닫기" /></a>
</div>
<!-- 마이페이지 사진 등록/변경 -->

<!-- 2014-12-17 고객센터 레이어 추가 // -->
<!-- layer // -->
<div class="layer r8" id="layer-center">
	<div class="tit">제휴 문의</div>
	<div class="layer-cont partner">
		<p>문제가 있거나 문의 사항이<br/> 있으시면 아래의 주소로<br/> 문의하시기 바랍니다.</p>
		<div class="box r5">
			<strong>고객 지원 :</strong>
			<a href="yuseong12345@naver.com" class="p-bluegreen">"yuseong12345@naver.com</a>
		</div>
		<p class="txt01">감사합니다.</p>

		<div class="btn-ac">
			<a href="" id="btn-close1"><img src="/img/btn/btn_ok2.gif" alt="확인" /></a>
		</div>
	</div>
	<a href="" class="btn-close"><img src="/img/btn/btn_close.png" alt="닫기" /></a>
</div><!-- // 2014-12-17 고객센터 레이어 추가 -->

<!-- 2014-12-18  위치보기 레이어 추가 // -->
<!-- layer // -->
<div class="layer r8" id="layer-map">
	<div class="tit">위치보기</div>
	<div class="layer-cont map">
		<div id="healthmap"></div>
	</div>
	<a href="" class="btn-close"><img src="/img/btn/btn_close.png" alt="닫기" /></a>
</div><!-- // 2014-12-18 위치보기 레이어 추가 -->
<!-- layer // -->

<script>
	// 배너 클릭시 카운트 처리 및 페이지 이동
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