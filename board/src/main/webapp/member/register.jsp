<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
    
<h1 class="my-5 text-center">MY BBS 회원가입</h1>
<div class="container">
	<form name="registerform" class="resiterform" action="/board/MembersOk" method="post">
		<div class="mb-3 mt-3">
			<div class="row">
				<lable for="userid" class="col-md-2 form-label">아이디 :</lable>
				<div class="col-md-5">
					<input type="text" class="form-control" id="userid" placeholder="아이디" name="userid"/>
				</div>
				<div class="col-md-5">
					<button type="button" class="btn btn-primary">중복확인</button>
				</div>
			</div>
		</div>
		
		<div class="mb-3 mt-3">
		<div class="row">
			<lable for="userpass" class="form-label col-md-2">비밀번호 :</lable>
				<div class="col-md-5">
					<input type="password" class="form-control" id="userpass" placeholder="비밀번호" name="userpass"/>
				</div>
				<div class="col-md-5">
					
				</div>
			</div>
		</div>
		
		<div class="mb-3 mt-3">
		<div class="row">
			<lable for="reuserpass" class="form-label col-md-2">비밀번호 확인:</lable>
				<div class="col-md-5">
					<input type="password" class="form-control" id="reuserpass" placeholder="비밀번호 확인" name="reuserpass"/>
				</div>
				<div class="col-md-5">
					
				</div>
			</div>
		</div>
		
		<div class="mb-3 mt-3">
			<div class="row">
				<lable for="username" class="col-md-2 form-label">이름 :</lable>
				<div class="col-md-5">
					<input type="text" class="form-control" id="username" placeholder="이름" name="username"/>
				</div>
				<div class="col-md-5">
					
				</div>
			</div>
		</div>
		
		<div class="mb-3 mt-3">
		<div class="row">
			<lable for="useremail" class="form-label col-md-2">이메일 :</lable>
				<div class="col col-md-5">
					<input type="text" class="form-control" id="useremail" placeholder="이메일" name="useremail"/>
				</div>
				<div class="col-md-5">
					
				</div>
			</div>
		</div>
		
		<div class="mb-3 mt-3">
			<div class="row">
				<lable for="postcode" class="col-md-2 form-label">주소 :</lable>
				<div class="col-md-5">
					<input type="text" class="form-control" id="postcode" placeholder="우편번호" name="postcode" readonly />
				</div>
				<div class="col-md-5">
					<button type="button" class="btn btn-primary" onClick="searchpo();">우편번호 검색</button>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-9 mt-3 col-md-offset-1">
					<input type="text" name="addr" id="addr" class="form-control" readonly />
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-9 mt-3 col-md-offset-1">
					<input type="text" name="detailaddr" id="detailaddr"  class="form-control" placeholder="상세주소"/>
				</div>
			</div>
		</div>
		<input type="hidden" name="useridok" id="useridok" />
		<div class="mb-3 mt-3">
		<div class="row">
			<lable for="tel1" class="form-label col-md-2">휴대폰 :</lable>
				<div class="col-md-3">
					<input type="text" class="form-control" id="tel1" name="tel1"/>
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control" id="tel2" name="tel2"/>
				</div>
				<div class="col-md-3">
					<input type="text" class="form-control" id="tel3" name="tel3"/>
				</div>
				<input type="hidden" name="tel" id="tel"/>
			</div>
		</div>
		
		<div class="form-btn py-4 text-center">
			<button type="reset" class="btn btn-warning mx-3 px-4">취 소</button>
			<button type="button" class="btn btn-primary mx-3 px-4" onClick="register();">전 송</button>
		</div>
	</form>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="js/form.js"></script>
</div>