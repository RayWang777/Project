<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="layout/header.jsp" />


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<body>
	<br>


<div >
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        <c:out value="${store.storeName}"></c:out> 商品銷售量
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="200%" height="80%"></canvas></div>
                                </div>
                            </div>


	<script src="<c:url value="/js/lib/Chart.min.js"/>"></script>

<script type="text/javascript">

var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels: [ <c:forEach items="${list}" var="one" varStatus="sta">"<c:out value="${one.productName}"/>"<c:if test="${!(sta.last)}">,</c:if>
    </c:forEach>  ],
    datasets: [{
      label: "Revenue",
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)",
      data: [<c:forEach items="${list}" var="one" varStatus="sta">"<c:out value="${one.sales}"/>"<c:if test="${!(sta.last)}">,</c:if>
      </c:forEach>],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: <c:out value="${fn:length(list)}"></c:out>
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 5000,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});

</script>
	<script type="text/javascript">
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
	  
	  labels:[    <c:forEach items="${list}" var="one" varStatus="sta">"<c:out value="${one.productName}"/>"<c:if test="${!(sta.last)}">,</c:if>
     </c:forEach>    ],
//     labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
    datasets: [{
      label: "Sessions",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
//       data: [1444, 30162, 222, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451],
      data: [ <c:forEach items="${list}" var="one" varStatus="sta">"<c:out value="${one.sales}"/>"<c:if test="${!(sta.last)}">,</c:if>
      </c:forEach>],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 50
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 2500,
          maxTicksLimit: 100
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});

</script>
</body>
<jsp:include page="layout/footer.jsp" />