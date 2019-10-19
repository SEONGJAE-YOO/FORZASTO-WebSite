var regEMAIL = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
var regMail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
var emailchk;
var emailchk_MSG="";
var NickNamechk;
var NickNamechk_MSG="";

function checkEmail(temp_email){
	if (temp_email != ""){
		//if(temp_email.match(regEMAIL) == null   ){
		if (!regMail.test(temp_email)){
			alert("사용할 수 없는 E-mail 입니다.");
			return false;
		}else  {
			$.ajax({
				type	: "post",
				url		: "/API/newemail_nickname_check.asp",
				async	: false,
				data	: {"email_id":temp_email,"GUBUN":"EMAIL"},
				dataType	: "json",
				success : function(oResult){
					if (oResult.RESULT == "Y"){
						emailchk = "Y"
					} else {
						emailchk = "N"
						emailchk_MSG = oResult.MSG;
					}
				}
			});
		}
	}
}

function PwUpdatecheckEmail(){
	temp_email1 = $("#Email1").val();
	temp_email2 = $("#Email2").val();

	if (temp_email1 == "" || IsEmpty(temp_email1)==true ){
		alert("이메일을 입력하여 주세요");
		$("#Email1").focus();
		return false;
	}

	if (temp_email2 == "" || IsEmpty(temp_email2)==true ){
		alert("이메일을 입력하여 주세요");
		$("#Email2").focus();
		return false;
	}

	temp_email = temp_email1+"@"+temp_email2;

	if (temp_email != ""){
		//if(temp_email.match(regEMAIL) == null   ){
		if (!regMail.test(temp_email)){
			alert("사용할 수 없는 E-mail 입니다.");
			return false;
		}else  {
			$.ajax({
				type	: "post",
				url		: "/API/newemail_nickname_check.asp",
				async	: false,
				data	: {"email_id":temp_email,"GUBUN":"EMAIL","snschk":"Y"},
				dataType	: "json",
				success : function(oResult){
					if (oResult.RESULT == "Y"){
						if(confirm("등록된 이메일 주소가 아닙니다.\n다이어트 신 회원가입페이지로\n이동하시겠습니까?")){
							location.href="/member/mem_reg.asp"
						} else {
							return;
						}
					} else if (oResult.RESULT == "D"){
						alert(oResult.MSG)
						return;
					} else {
						MailSend();
					}
				}
			});
		}
	}
}

function joinus(){
	if(typeof(window.DietBridge) == "object"){
		//window.location.replace("/newmember/joinus.asp");
		window.DietBridge.startAccountCreate();
	}else{
		alert("앱을 설치해 주세요");
		return false;
	}

}

function checkNickName(NickName){
	if(NickName != "" ){
		$.ajax({
			type	: "post",
			url		: "/API/newemail_nickname_check.asp",
			async	: false,
			data	: {"NICKNAME":NickName,"GUBUN":"NICKNAME"},
			dataType	: "json",
			success : function(oResult){
				if (oResult.RESULT=="Y"){
					NickNamechk = "Y"
				} else {
					NickNamechk = "N"
					NickNamechk_MSG = oResult.MSG;
				}
			}
		});
	}
}

function CHECK_MEM_NEW(){
	temp_email1 = $("#Email1").val();
	temp_email2 = $("#Email2").val();

	if (temp_email1 == "" || IsEmpty(temp_email1)==true ){
		alert("이메일을 입력하여 주세요");
		$("#Email1").focus();
		return false;
	}

	if (temp_email2 == "" || IsEmpty(temp_email2)==true ){
		alert("이메일을 입력하여 주세요");
		$("#Email2").focus();
		return false;
	}

	temp_email = temp_email1+"@"+temp_email2;

	//if(temp_email.match(regEMAIL) == null){
	if (!regMail.test(temp_email)){
		alert("사용할 수 없는 E-mail 입니다.");
		return;
	}
	
	//checkEmail(temp_email);
	

	temp_nickname=$("#NickName").val();

	if (temp_nickname == ""){
		alert("닉네임을 입력하여 주세요");
		$("#NickName").focus();
		return;
	}else if(getStrLength(temp_nickname) < 4 ||   getStrLength(temp_nickname) > 16){
			alert("닉네임은 한글2자 또는 영문 4자 이상\n최대 한글8자 영문 16자 이내여야 합니다.");	
			$("#NickName").focus();
			return;
	}
	
	//checkNickName(temp_nickname);

	$.when(  checkEmail(temp_email),checkNickName(temp_nickname)).done( function(){

		if(emailchk == "N"){
			if(confirm("이미 가입된 이메일입니다.\n\n비밀번호 재설정 화면으로 이동하시겠습니까?")){
				location.href="/member/mem_pw_update.asp"
				return;
			} else {
				return;
			}
		}

		if(NickNamechk == "N"){
			alert(NickNamechk_MSG);
			$("#NickName").focus();
			return;		
		}

		temp_pwd1=$("input[name='pwd1']").val();
		temp_pwd2=$("input[name='pwd2']").val();
		if (temp_pwd1 == "" || IsEmpty(temp_pwd1)==true){
			alert("비밀번호를 입력해 주세요");
			$("#pwd1").focus();
			return;
		}
		if (temp_pwd1.length <6 || temp_pwd1.length >15){
			alert("비밀번호는 6자리 이상 최대 15자 이내 여야 합니다.");
			return;
		}
		if (temp_pwd2 == "" || IsEmpty(temp_pwd2)==true){
			alert("비밀번호 확인을 입력해 주세요");
			$("#pwd2").focus();
			return;
		}
		if (temp_pwd1 != temp_pwd2 ){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return;
		}
		

		var user_sex = $("input:radio[name=user_sex]:checked").val();

		var login_device_id="web";

		if ($('input:checkbox[name="info_agree"]').is(":checked") == false){
			alert("이용약관 개인정보 수집에 동의해 주세요");
			return;
		}

		if (emailchk != "Y" || NickNamechk != "Y"){
			//checkNickName(temp_nickname);
			//checkEmail(temp_email);
			//alert("닉네임과 이메일 체크중입니다.\n확인 버튼을 다시 눌러 주세요.");
			return;
		}else{
			$.ajax({
				type	: "post",
				url		: "/API/newemail_nickname_reg.asp",
				data	: {"NICKNAME":temp_nickname,"email_id":temp_email,"temp_pwd1":temp_pwd1,"temp_pwd2":temp_pwd2,"user_sex":user_sex,"device_id":login_device_id},
				dataType	: "json",
				success : function(oResult){
					if (oResult.RESULT == "Y"){
						alert("가입이 완료되었습니다.");
						location.replace("/member/mem_complete.asp");
					}else{
						alert(oResult.MSG);
						$("#NickNamechk").val("N");
						$("#emailchk").val("N");
					}
				}
			});
		}
	});
}

function logins(){
	temp_email=$("#Email").val();
	if (temp_email == "" || IsEmpty(temp_email)== true ){
		alert("이메일을 입력하여 주세요");
		$("#Email").focus();
		return false;
	}

	//if(temp_email.match(regEMAIL) == null   ){
	if (!regMail.test(temp_email)){
		alert("E-mail이 잘못 되었습니다.");
		$("#Email").focus();
		return false;
	}
	
	temp_pwd=$("#inputpw").val();
	if (temp_pwd == "" || IsEmpty(temp_pwd) ==true ){
		alert("비밀번호를 입력해 주세요");
		$("#inputpw").focus();
		return false;
	}
	
	var login_device_id="web";

	$.ajax({
		type	: "post",
		url		: "/API/newlogin_email.asp",
		data	: {"temp_email":temp_email,"temp_pwd":temp_pwd,"device_id":login_device_id},
		dataType	: "json",
		success : function(oResult){
			if (oResult.RESULT == "Y"){
				if ($("#retSubUrl").val() != ''){
					del_RetSubUrl();
					if ($("#retSubUrl").val().indexOf('?') > 0 ){
						location.href = ($("#retSubUrl").val()+"&rturl="+$("#retUrl").val());
					} else {
						location.href = ($("#retSubUrl").val()+"?rturl="+$("#retUrl").val());
					}
					return;
				} else {
					if ($("#retUrl").val() == ''){
						location.href = '/main.asp';
						return;
					}else{
						del_RetUrl();
						location.href = ($("#retUrl").val());
						return;
					}
				}
			}else if (oResult.RESULT == "E"){
				if(confirm("입력하신 내용으로\n가입된 정보를 찾을 수 없습니다.\n회원가입을 하시겠습니까?")){
					location.href="/member/mem_reg.asp"
				} else {
					return;
				}
			}else if (oResult.RESULT == "P"){
				if(confirm("비밀번호가 일치하지 않습니다.\n비밀번호 재설정 화면으로\n이동하시겠습니까?")){
					location.href="/member/mem_pw_update.asp"
				} else {
					return;
				}
			}else if (oResult.RESULT == "D"){
				if(confirm(oResult.MSG)){
					location.href="/member/mem_reg.asp"
				} else {
					return;
				}
			}else{
				alert(oResult.MSG);
				//alert("Email 과 비밀번호를 다시 확인해 주세요");
			}
		},error : function(oResult){alert("실패");}
	});
}

function MailSend(){
	temp_email1 = $("#Email1").val();
	temp_email2 = $("#Email2").val();

	if (temp_email1 == "" || IsEmpty(temp_email1)==true ){
		alert("이메일을 입력하여 주세요");
		$("#Email1").focus();
		return false;
	}

	if (temp_email2 == "" || IsEmpty(temp_email2)==true ){
		alert("이메일을 입력하여 주세요");
		$("#Email2").focus();
		return false;
	}

	temp_email = temp_email1+"@"+temp_email2;

	//if(temp_email.match(regEMAIL) == null   ){
	if (!regMail.test(temp_email)){
		alert("E-mail이 잘못 되었습니다.");
		return false;
	}
	$("#sendm").hide(); 
	$("#sendtxt").show(); 
	$.ajax({
		type	: "post",
		url		: "/API/newtemp_pwd_send.asp",
		data	: {"temp_email":temp_email},
		dataType	: "json",
		success : function(oResult){
			if (oResult.RESULT == "Y"){
				alert(oResult.MSG);
				location.replace("/member/mem_login.asp");
			}else{
				alert("메일 발송에 실패하였습니다.");
				$("#sendm").show(); 
				$("#sendtxt").hide(); 
			}
		}
	});
}


function membership_cancel(){
	var temp_email=$("#temp_email").val();
	var temp_pwd=$("#inputpwd").val();
	if (temp_pwd == "" || IsEmpty(temp_pwd)==true ){
		alert("비밀번호를 입력하여 주세요");
		return false;
	}
	$.ajax({
		type	: "post",
		url		: "/API/newmember_cancel.asp",
		data	: {"temp_pwd":temp_pwd,"temp_email":temp_email},
		dataType	: "json",
		success : function(oResult){
			if (oResult.RESULT == "Y"){
				alert(oResult.MSG);
				location.replace("/main.asp");
			}else{
				alert(oResult.MSG);
			}
		}
	});
}
/**
function emailchk(){
	$("#emailchk").val("N");
}
function NickNamechk(){
	$("#NickNamechk").val("N");
}
**/