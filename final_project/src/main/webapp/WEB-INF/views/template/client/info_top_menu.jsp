<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="container">
      <!--나의정보 헤더-->
      <div class="row my-header">
        <div class="col-md-2 component">
          <span class="my-info">${memberDto.id}</span>
          <span class="my-title font-weight-bold">님</span>
        </div>
        <div id="myInfo-wrapper">
          <div class="myInfo-line"></div>
        </div>
        <div class="col-md-2">
            <span class="my-title font-weight-bold">등 급 :</span>
            <span class="my-info">&nbsp${memberDto.grade}</span>
        </div>
        <div id="myInfo-wrapper">
          <div class="myInfo-line"></div>
        </div>
        <div class="col-md-2">
            <span class="my-title font-weight-bold">쿠 폰 :</span>
            <span class="my-info">&nbsp${coupon}개</span>
        </div>
        <div id="myInfo-wrapper">
          <div class="myInfo-line"></div>
        </div>
        <div class="col-md-2">
            <span class="my-title font-weight-bold">포인트 : </span>
            <span class="my-info">&nbsp${point}pt</span>
        </div>
      </div>
    </div>
    <!--나의정보 끝-->