<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유기동물 정보 조회</title>
<style>
* {
	box-sizing: border-box;
}
</style>
</head>
<body style="margin: 0">
	<div style="text-align: center">
		<div style="max-height: 400px; display: flex; justify-content: center">
			<canvas id="myChart"></canvas>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
		const ctx = document.querySelector('#myChart');

		new Chart(ctx,	{
					type : 'line',
					data : {
						labels : ${labels},
							datasets: [{
								label : '발생건수',
								data: ${counts}
							}]
					}
				});
	</script>
</body>
</html>


