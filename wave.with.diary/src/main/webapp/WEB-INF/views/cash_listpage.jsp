<%@page import="com.wave.withdiary.cash.ChartMoney"%>
<%@page import="com.wave.withdiary.cash.ChartCT"%>
<%@page import="com.wave.withdiary.cash.AccountDTO"%>
<%@page import="com.wave.withdiary.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="com.wave.withdiary.file.WDFileUtils"%>
<% 
	request.setCharacterEncoding("utf-8");
	WDFileUtils wdfile = new WDFileUtils();
	String logo = wdfile.WD_LOGO;
	String update_link = wdfile.update_link;
	String diary_link = wdfile.diary_link;
	String cash_link = wdfile.cash_link;
	String study_link = wdfile.study_link;
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메인페이지CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/layout/main_layout.css" />"
>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<!-- 템플릿 -->
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/plugins/fontawesome-free/css/all.min.css"/>">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"/>">
<!-- iCheck -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>">
<!-- JQVMap -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/plugins/jqvmap/jqvmap.min.css"/>">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/dist/css/adminlte.min.css"/>">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/plugins/daterangepicker/daterangepicker.css"/>">
<!-- summernote -->
<link rel="stylesheet"
	href="<c:url value="/resources/cashbook/plugins/summernote/summernote-bs4.min.css"/>">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

<style>
/*검색버튼*/
.btn_click {
	background:linear-gradient(to bottom, #f9f9f9 5%, #e9e9e9 100%);
	background-color:#f9f9f9;
	border-radius:15px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:12px;
	padding:4px 17px;
	text-decoration:none;
}
.btn_click:hover {
	background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
	background-color:#e9e9e9;
}
.btn_click:active {
	position:relative;
	top:1px;
}

#box_1{
	float:right; 
}
#box_2{
	align-items:center;
}
#inline{
display: inline;
}
/*메인섹션 내부*/
#content>#main_section>#main_div>#main_section_table {
	padding-top:20px;
	width: 900px;
	display: flex;
	justify-content: center;
}
</style>

    <script>
        function changeBg(color) {
            document.body.style.backgroundColor = color;
        }
    </script>
</head>
<%
	List<AccountDTO> list = (List<AccountDTO>) request.getAttribute("list");
List<ChartCT> clist = (List<ChartCT>) request.getAttribute("clist");
List<ChartMoney> mlist = (List<ChartMoney>) request.getAttribute("mlist");
%>
<body>
    <div id="content">
        <aside id="left_aside">
            <!-- 왼쪽 상단 로고 -->
            <div id="wd_logo">
                <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4fdf03a0-151a-4395-8691-56170ce26f19%2F___(3).png?table=block&id=f1ba2b23-7901-4f61-8d20-286c09e128c7&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=3600&userId=&cache=v2"
                    id="wd_logo_img" />
            </div>
            <!-- 프로필 영역: 프로필 사진, 닉네임, 소개 -->
            <div id="profile">
                <br>
                <table align="center" width="180" id="profile_table">
                    <!--프로필 사진-->
                    <tr height="100">
                        <td align="center">
                            <img
                            src="${contextPath}/download?email=${vo.email}&profile_img=${vo.profile_img }"
                            id="profile_img" /><br>
                        </td>
                    </tr>
                    <!--닉네임-->
                    <tr height="35">
                        <td align="center">
                            <b>${vo.nickname }</b>
                        </td>
                    </tr>
                    <!--소개-->
                    <tr height="80">
                        <td>
                            <div id="profile_intro">
                            ${vo.profile }
                            </div>
                        </td>
                    </tr>

                </table>
            </div>

            <!-- 친구 영역: 친구 프로필 사진, 닉네임 -->
            <div id="friend">
                
                <br>

                <!-- 친구 공간의 아이콘+이름: 정렬 편의를 위해 테이블 사용-->
                <table align="center">
                    <tr>
                        <!-- 아이콘 -->
                        <td>
                            <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fce878c8a-ddf1-4645-b29e-c899a83d8a2d%2F3314439.png?table=block&id=3bc61806-a0a4-4340-90d4-c9d4751a3d7e&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2" 
                            width="30" height="30" />
                        </td>
                        <!-- 친구목록 글자 -->
                        <td>
                            <p id="friends_text">Friends</p>
                        </td>
                    </tr>
                </table>

                <div id="friendList">
                    <table>
                    
					<c:forEach var="list" items="${friendList }">
						<tr>
							<c:choose>
							<c:when test="${not empty list.profile_img && list.profile_img!='null' }">
								<td><img
									src="${contextPath}/download?email=${list.email}&profile_img=${list.profile_img }"
									class="fr_preview" /><br></td>
							</c:when>
							<c:otherwise>
								<td><img 
									src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F7a72114e-dc29-4856-b320-93d279fd9ede%2Fuser.png?table=block&id=679fd6fa-b188-4d55-8887-b5b14c74c259&width=1020&userId=&cache=v2"
									width="30" height="30" />
								</td>
							</c:otherwise>
							</c:choose>
							<td>${list.nickname }</td>
						</tr>
					</c:forEach>
                        
                    </table>
                </div>
            </div>
        </aside>
        <section id="main_section">
		<div id="main_div" style="overflow: scroll;">
			<div id="main_section_table">
				<div class="col-10">
					<div class="card">
						<div class="card-header">
							<div class="calender_sarch">
								<form class="form-inline" action="listpage" method="get"
									name="searchFrm">
									<div class="form-group" style="position: relative; top: 5px;">
										<label for="input_to">From</label> <input class="form-control"
											type="text" value="${param.fchdate}" id="fchdate"
											name="fchdate" autocomplete="off" placeholder="Start Date">
									</div>
									&nbsp;&nbsp;&nbsp;
									<div class="form-group" style="position: relative; top: 5px;">
										<label for="input_to">To</label> <input class="form-control"
											type="text" value="${param.tchdate}" id="tchdate"
											name="tchdate" autocomplete="off" placeholder="End Date">
									</div>
									&nbsp;&nbsp;&nbsp;
									<div id="btn_grup">
									<button type="submit" class="btn_click" style="position: relative; top: 12px;">검 색</button>
									</div>
								</form>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="example2" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>날짜</th>
										<th>내역</th>
										<th>분류</th>
										<th>금액</th>
										<th>소비형식</th>
									</tr>
								</thead>
								<tbody>
									<%
										MemberVO user = (MemberVO) (session.getAttribute("member"));
									if (user == null || list == null) {
										out.print("<tr style='text-align:center'><td colspan='7'>-----작성된 글이 없습니다.-----</td></tr>");
									} else {
										for (int i = 0; i < list.size(); i++) {
											AccountDTO dto = list.get(i);
									%>
									<tr>
										<td><fmt:parseDate var="parseDate"
												value="<%=dto.getChdate()%>" pattern="yyyyMMdd" /> <fmt:formatDate
												value="${parseDate}" pattern="yyyy년MM월dd일" /></td>
										<td><a
											href="detail?num=<%=dto.getNum() %>&
							page=${cri.page}&
							perPageNum${cri.perPageNum}"><%=dto.getHistory()%></a>
										</td>
										<td><%=dto.getCtdto().getConsumption_typename()%></td>
										<td><fmt:formatNumber value="<%=dto.getMoney()%>"
												pattern="#,###" /></td>
										<td><%=dto.getDto().getClassificationName()%></td>
									</tr>
									<%
										}
									}
									%>
								</tbody>
							</table>
							<br>
						</div>
						<!-- /.card-body -->
					</div>
					<div id="inline">
								<div class="calender_sarch_write" id="box_1">
									<a class="btn btn-default pull-rigth" href="insertForm">글쓰기</a>
								</div>
					<!-- 페이지 마커 view -->
					<div id="box_2" align="center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a
									href="listpage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
							</c:if>

							<c:set var="fdate" value="&fchdate=" />
							<c:set var="ff"
								value="${param.fchdate==null?'':(fdate+=param.fchdate)}" />
							<c:set var="tdate" value="&tchdate=" />
							<c:set var="tt"
								value="${param.tchdate==null?'':(tdate+=param.tchdate)}" />

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>>
									<a href='listpage${pageMaker.makeQuery(idx)}${ff}${tt}'>${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="listpage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
							</c:if>
						</ul>
					</div>
					</div>
					<!-- /.card -->
					<!-- 차트 view -->
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6">
								<!-- PIE CHART -->
								<div class="card card-danger">
									<div class="card-header">
										<h3 class="card-title">Pie Chart</h3>

										<div class="card-tools">
											<button type="button" class="btn btn-tool"
												data-card-widget="collapse">
												<i class="fas fa-minus"></i>
											</button>
											<button type="button" class="btn btn-tool"
												data-card-widget="remove">
												<i class="fas fa-times"></i>
											</button>
										</div>
									</div>
									<div class="card-body" align="center">
										<div id="chartCt_div"
											style="min-height: 250px; height: 250px; max-height: 300px; max-width: 100%;"></div>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->

							</div>
							<!-- /.col (LEFT) -->
							<div class="col-md-6">
								<!-- LINE CHART -->
								<div class="card card-info">
									<div class="card-header">
										<h3 class="card-title">Line Chart</h3>

										<div class="card-tools">
											<button type="button" class="btn btn-tool"
												data-card-widget="collapse">
												<i class="fas fa-minus"></i>
											</button>
											<button type="button" class="btn btn-tool"
												data-card-widget="remove">
												<i class="fas fa-times"></i>
											</button>
										</div>
									</div>
									<div class="card-body" align="left">
										<div class="chart">
											<div id="linechart_material"
												style="min-height: 250px; height: 250px; max-height: 300px; max-width: 100%;"></div>
										</div>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
							</div>
							<!-- /.col (RIGHT) -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</div>
			</div>
			</div>
		</section>
 <aside id="right_aside">
            <div class="tab_item">
                <p class="item"><a href="#">
                    <img src="<%=logo %>"
                    alt="WD로고" width="30" height="30" 
                        />
                </a></p>
                <p class="item"><a href="${contextPath}/<%=update_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F2267d25b-3b2b-4527-b119-3bb7b6eb311d%2Fgrow.png?table=block&id=cabdd96d-0190-4353-bf4e-2071ae6f5a1f&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="마이페이지" width="30" height="30" 
                        />
                </a></p>
                <p class="item"><a href="${contextPath}/<%=diary_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F281cbe2e-ad53-430a-bd66-e9b407a1749f%2Fdiary_(2).png?table=block&id=a65df81c-6382-4ba4-b9ad-f7544896fd87&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="다이어리" width="30" height="30" 
                        />
                </a></p>

                <p class="item"><a href="${contextPath}/<%=cash_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F34ff4e78-cc69-49e3-b417-3f6fcf0cf29e%2Fwallet.png?table=block&id=50a765fc-3846-498a-bc64-8346b9f44bd0&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2" 
                        alt="가계부" width="30" height="30" />
                </a></p>

                <p class="item"><a href="${contextPath}/<%=study_link %>">
                    <img src="https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fe1357e10-c87a-442c-a749-f28e687e9918%2Freading.png?table=block&id=67ad5d48-93b2-42b9-8af9-f9616e336b51&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1020&userId=&cache=v2"
                        alt="스터디" width="30" height="30" />
                </a></p>

                <!-- 배경색 바꾸기 -->
                <div>
                    <!--주황-->
                    <a href="#" onclick="changeBg('rgb(255,226,183)')"><div class="bg_color" id="bg_color1"></div></a>
                    <!--노랑-->
                    <a href="#" onclick="changeBg('rgb(255,241,182)')"><div class="bg_color" id="bg_color2"></div></a>
                    <!--연두-->
                    <a href="#" onclick="changeBg('rgb(234,255,182)')"><div class="bg_color" id="bg_color3"></div></a>
                    <!--하늘-->
                    <a href="#" onclick="changeBg('rgb(184,222,255)')"><div class="bg_color" id="bg_color4"></div></a>
                    <!--보라-->
                    <a href="#" onclick="changeBg('rgb(232,234,255)')"><div class="bg_color" id="bg_color5"></div></a>
                    <!--분홍-->
                    <a href="#" onclick="changeBg('rgb(255,232,246)')"><div class="bg_color" id="bg_color6"></div></a>
                </div>
            </div>
        </aside>
        </div>
	<script type="text/javascript">
// 날짜선택 
$(function() {
    //input을 datepicker로 선언
    $.datepicker.setDefaults({
        dateFormat: 'yymmdd' //Input Display Format 변경
        ,altField:".datepicker"
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonImage: "http://download.seaicons.com/icons/paomedia/small-n-flat/24/calendar-icon.png"
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트         
        ,showButtonPanel: true
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    });                    
    
    //input datepicker로 선언
    $('#fchdate').datepicker();
    $('#tchdate').datepicker();
    
    //from 초기값을 오늘 날짜로 설정
//     $('#fchdate').datepicker('setDate',''); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	//to의 초기값을 내일로 설정
//     $('#tchdate').datepicker('setDate','' ); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            

});
</script>
	<script type="text/javascript">
// 차트
	//Load the Visualization API and the piechart package.
	google.charts.load('current', {'packages':['corechart']});
	
	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);
	
	// Callback that creates and populates a data table, 
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

	// 차트 데이터 입력
	var data = new google.visualization.arrayToDataTable([
		['소비패턴','수치'],
		<%for (int i = 0; i < clist.size(); i++) {
	ChartCT cdto = clist.get(i);%>
			['<%=cdto.getConsumption_typename()%>',<%=cdto.getCount()%>]
		<%if (i < clist.size() - 1) {
	out.print(",");
}
}%>	
	]);

	// Set chart options
	var options = {'title':'소비패턴',
					'maintainAspectRatio': false,
					'sliceVisibilityThreshold':0};
	
	// Instantiate and draw our chart, passing in some options.
	var chart = new google.visualization.PieChart(document.getElementById('chartCt_div'));
	chart.draw(data, options);
	}
</script>
	<script type="text/javascript">

  //Load the Visualization API and the piechart package.
	 google.charts.load('current', {'packages':['line']});
	
	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(LineChart1);
	
	function LineChart1() {

	// 차트 데이터 입력
	var data = new google.visualization.arrayToDataTable([
		['',''],
		<%for (int i = 0; i < mlist.size(); i++) {
	ChartMoney mdto = mlist.get(i);%>
			['<%=mdto.getMonth_chdate()%>',<%=mdto.getSum_money()%>]
		<%if (i < mlist.size() - 1) {
	out.print(",");
}
}%>	
	]);

	// Set chart options
	var options = {
			'chart':{'title':'월별 지출 현황',
			},
			'maintainAspectRatio': false,
			'vAxis': {
				'format':'###,###'
			}
	};
	
	var chart = new google.charts.Line(document.getElementById('linechart_material'));

	var formatter = new google.visualization.NumberFormat({pattern: '###,###'});
	formatter.format(data,1);
	
    chart.draw(data, google.charts.Line.convertOptions(options));
	}
</script>

	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script
		src="<c:url value="/resources/cashbook/plugins/chart.js/Chart.min.js"/>"></script>
	<!-- Sparkline -->
	<script
		src="<c:url value="/resources/cashbook/plugins/sparklines/sparkline.js"/>"></script>
	<!-- JQVMap -->
	<script
		src="<c:url value="/resources/cashbook/plugins/jqvmap/jquery.vmap.min.js"/>"></script>
	<script
		src="<c:url value="/resources/cashbook/plugins/jqvmap/maps/jquery.vmap.usa.js"/>"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="<c:url value="/resources/cashbook/plugins/jquery-knob/jquery.knob.min.js"/>"></script>
	<!-- daterangepicker -->
	<script
		src="<c:url value="/resources/cashbook/plugins/moment/moment.min.js"/>"></script>
	<script
		src="<c:url value="/resources/cashbook/plugins/daterangepicker/daterangepicker.js"/>"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="<c:url value="/resources/cashbook/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"/>"></script>
	<!-- Summernote -->
	<script
		src="<c:url value="/resources/cashbook/plugins/summernote/summernote-bs4.min.js"/>"></script>
	<!-- overlayScrollbars -->
	<script
		src="<c:url value="/resources/cashbook/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"/>"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value="/resources/cashbook/dist/js/adminlte.js"/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value="/resources/cashbook/dist/js/demo.js"/>"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="<c:url value="/resources/cashbook/dist/js/pages/dashboard.js"/>"></script>

</body>
</html>