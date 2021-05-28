<%@page import="com.wave.withdiary.cash.ChartMoney"%>
<%@page import="com.wave.withdiary.cash.ChartCT"%>
<%@page import="com.wave.withdiary.cash.AccountDTO"%>
<%@page import="com.wave.withdiary.member.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
</head>
<%
 	List<AccountDTO> list = (List<AccountDTO>) request.getAttribute("list"); 
	List<ChartCT> clist = (List<ChartCT>) request.getAttribute("clist");
	List<ChartMoney> mlist = (List<ChartMoney>) request.getAttribute("mlist");
%>
<body>
<div id="container" align="center">
	<form action="accountlistpage.do" method="get" name="searchFrm">
		From: <input type="text" value="${param.fchdate}" id="fchdate" name="fchdate" autocomplete="off">&nbsp;&nbsp;
		To: <input type="text"value="${param.tchdate}" id="tchdate" name="tchdate" autocomplete="off">
		<button type="submit" id="btnSerach">검색</button>
	</form>
</div>
<h1 align="center">가계부글목록</h1>
<!-- <input type="hidden" name="command" value="muldel"> -->
<table class="table table-hover">
	<tr>
		<th>날짜</th>
		<th>내역</th>
		<th>분류</th>
		<th>금액</th>
		<th>소비형식</th>
		<th>비고</th>
	</tr>
	<%
		MemberVO user = (MemberVO)(session.getAttribute("member"));
		if(user==null || list ==null){
			out.print("<tr style='text-align:center'><td colspan='7'>-----작성된 글이 없습니다.-----</td></tr>");
		} else{
			for(int i=0;i<list.size();i++){
				AccountDTO dto=list.get(i);
				%>
				<tr>
					<td><fmt:parseDate var="parseDate" value="<%=dto.getChdate() %>" pattern="yyyyMMdd"/>
					<fmt:formatDate value="${parseDate}" pattern="yyyy년MM월dd일"/></td>
					<td>
					<a href="detailaccount.do?num=<%=dto.getNum() %>&
												page=${cri.page}&
												perPageNum${cri.perPageNum}"><%=dto.getHistory() %></a>
					</td>
					<td><%=dto.getCtdto().getConsumption_typename() %></td>
					<td><fmt:formatNumber value="<%=dto.getMoney() %>" pattern="#,###"/></td>
					<td><%=dto.getDto().getClassificationName() %></td>
					<td><%=dto.getMemo()==null?"":dto.getMemo() %></td>
				</tr>
				<%
			}
		}
	%>
	<tr>
		<td colspan="6">
			<a href="insertaccount.do">글쓰기</a>
			<a href=".">메인</a>
			<form action="chatroom.do" method="post">
				<button type="submit" >채팅으로</button>
			</form>
		</td>
	</tr>
</table>
<!-- 페이지 마커 view -->
<div class="col-md-offset-3" align="center">
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li><a href="accountlistpage.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
		</c:if> 
		
 		<c:set var="fdate" value="&fchdate=" />
 		<c:set var="ff" value="${param.fchdate==null?'':(fdate+=param.fchdate)}"/>
 		<c:set var="tdate" value="&tchdate=" />
 		<c:set var="tt" value="${param.tchdate==null?'':(tdate+=param.tchdate)}"/>
 		
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li <c:out value="${pageMaker.cri.page == idx ? 'class=active' : ''}"/>> 
			<a href='accountlistpage.do${pageMaker.makeQuery(idx)}${ff}${tt}'>${idx}</a></li>
		</c:forEach>
    
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="accountlistpage.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
		</c:if> 
	</ul>
</div>
<!-- 차트 view -->

<div id="chartCt_div" style="width:400; height:300"></div>
<div id="linechart_material" style="width:700; height:400"></div>

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
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
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
		<% 
			for(int i=0;i<clist.size();i++){
				ChartCT cdto=clist.get(i);
				%>
			['<%=cdto.getConsumption_typename()%>',<%=cdto.getCount()%>]
		<%
				if(i < clist.size()-1 ) {
					out.print (",");	
				}
			}
		%>	
	]);

	// Set chart options
	var options = {'title':'이달의 소비패턴',
	               'width':400,
	               'height':300};
	
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
		['월별','총 지출액'],
		<% 
			for(int i=0;i<mlist.size();i++){
				ChartMoney mdto=mlist.get(i);
				%>
			['<%=mdto.getMonth_chdate()%>',<%=mdto.getSum_money()%>]
		<%
				if(i < mlist.size()-1 ) {
					out.print (",");	
				}
			}
		%>	
	]);

	// Set chart options
	var options = {
			'chart':{'title':'월별 지출 현황',
			},
			'width': 700,
			'height': 400,
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
</body>
</html>