<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		a{
			text-decoration: none;
		}
	</style>
</head>
<body>
	<!-- header -->
	<header class="header">
		<!-- 회사 로고 -->
		<div>
			<a href="start"><img src="${pageContext.request.contextPath}/images/${companyInfo.realLogoPath }" alt="회사 로고"
				class="header__logo"></a>
		</div>
		<!-- 검색창 -->
		<input type="text" placeholder="검색" class="header__search">
		<!-- 상단 메뉴들 -->
		<div class="header__icon">
			<!-- 구성원 -->
			<a href="#" data-type="employees"> 
				<img alt="구성원 정보 보기" src="${pageContext.request.contextPath}/resources/icon/comments-solid.svg" class="header__profile">
			</a>
			<!-- 알림 -->
			<a href="#" data-type="alarm"> 
				<img alt="알림 보기" src="${pageContext.request.contextPath}/resources/icon/bell-solid.svg" class="header__profile">
			</a>
			<!-- 프로필 -->
			<c:if test="${memberInfo.realProfilePath eq null }">
			<a href="#" data-type="profile"> <img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진"
				class="header__profile">
			</a>
			</c:if>
			<c:if test="${memberInfo.realProfilePath ne null }">
			<a href="#" data-type="profile"> <img src="${pageContext.request.contextPath}/images/${memberInfo.realProfilePath }" alt="기본 프로필 사진"
				class="header__profile">
			</a>
			<!-- 프로필 모달 -->
			</c:if>
			<div id="profile-modal">
				<div class="profile-modal__content">
					<div class="profile-modal__title">
						<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="modal-logo">
						<div>${memberInfo.memberName }</div>
					</div>
					<p>
						<a href="#" data-type="my-profile">내 프로필</a>
					</p>
					<p>
						<a href="#">상태변경</a>
					</p>
					<p>
						<a href="#" data-type="logout">로그아웃</a>
					</p>
					<form action="${pageContext.request.contextPath }/logout" method="post" id="logout">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					</form>
				</div>			
			</div>
			<!-- 개인정보 모달 -->
			<div id="my-profile-modal">
				<div class="my-profile-modal__content">
					<div class="my-profile-modal__title">
						<img src="${pageContext.request.contextPath }/resources/img/user.png" alt="기본 프로필 사진" class="my-profile-logo">
						<div class="my-profile-modal__name">${memberInfo.memberName }</div>
						<ul>
							<li class="my-profile-item"><img alt="소속 회사" src="${pageContext.request.contextPath}/resources/icon/building-solid.svg" class="item-icon"><span>${companyInfo.companyName }</span></li>
							<li class="my-profile-item"><img alt="이메일" src="${pageContext.request.contextPath}/resources/icon/envelope-solid.svg" class="item-icon"><span>${memberInfo.memberId }</span></li>
							<li class="my-profile-item"><img alt="이메일" src="${pageContext.request.contextPath}/resources/icon/mobile-screen-button-solid.svg" class="item-icon"><span>${memberInfo.memberPhone }</span></li>
							<li class="my-profile-item">
								<img alt="이메일" src="${pageContext.request.contextPath}/resources/icon/circle-info-solid.svg" class="item-icon">
								<span>
									<c:if test="${memberInfo.deptId eq 0}">-</c:if>
									<c:if test="${memberInfo.deptId ne 0}">${memberInfo.deptId }</c:if>
								</span></li>
						</ul>
						<button type="button" class="my-profile__btn">정보 수정</button>
					</div>	
				</div>			
			</div>
			<!-- 알림 모달 -->
			<div id="alarm-modal">
				<div class="alarm-modal__content">
					<div class="flex alarm__title">
						<h1>알림</h1>
						<img alt="창 끄기" src="${pageContext.request.contextPath}/resources/icon/xmark-solid.svg">
					</div>
					<div class="flex">
						<div >
							<span>미확인</span>
							<span>전체</span>
						</div>
						<div>모두읽음</div>
					</div>
					<input type="text" class="alarm_search-icon">
					<ul class="flex">
						<li>전체</li>
						<li>프로젝트</li>
						<li>사내게시판</li>
						<li>개인일정</li>
					</ul>
					<div class="flex">
						알림내역
					</div>
				</div>			
			</div>
		</div>
	</header>
<script>
	//모달페이지 출력
	$('a').on('click', function(e) {
		e.stopPropagation();
		let type = e.currentTarget.dataset.type;
		
		if(type == 'profile') {
			$('#profile-modal').addClass('modal-visible');
			$('body').css('overflow', 'hidden');
		}else if(type == 'logout') {
			$('#logout').submit();
		}else if(type == 'my-profile') {
			$('#my-profile-modal').addClass('modal-visible');
			$('body').css('overflow', 'hidden');
		}else if(type == 'alarm') {
			$('#alarm-modal').addClass('modal-visible');
			$('body').css('overflow', 'hidden');
		}
	});
	
	//여백 누르면 모달페이지 종료
	$('[id*=modal]').on('click', function() {
		$('.modal-visible').removeClass('modal-visible');
		$('body').css('overflow', 'visible');
	})
</script>
</html>