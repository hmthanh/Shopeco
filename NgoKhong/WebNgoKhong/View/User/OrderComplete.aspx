<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master" AutoEventWireup="true" CodeFile="OrderComplete.aspx.cs" Inherits="View_User_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMasterpageUser" runat="Server">
	<link href="../../Content/UI/css/bootstrap-table.min.css" rel="stylesheet" />
	<script src="../../Content/UI/js/bootstrap-table.min.js"></script>
	<script src="../../Content/UI/js/bootstrap-table-vi-VN.js"></script>
	<link href="../../Content/UI/css/bootstrap-datepicker3.min.css" rel="stylesheet" />
	<%--<link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" rel="stylesheet" />--%>

	<%--<script src="../../Content/UI/js/bootstrap-table-locale-all.min.js"></script>--%>
	<script>
		$(document).ready(function () {
			$('#order').addClass("active");
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMasterpageUser" runat="Server">
	<script>
		var data = [];

		function GetData() {
			var dateSearch = $('#datePicker').val();
			$.ajax({
				type: "GET",
				url: '../Ajax.aspx?Action=UserOrder&type=3&date=' + dateSearch,
				success: function (result) {
					var data = JSON.parse(result);

					$('#table').bootstrapTable('load', { data });
					$('#table').bootstrapTable({ data: data });


					$(".mybtn-top").click(function () {
						$('#table').bootstrapTable('scrollTo', 0);
					});

					$(".mybtn-row").click(function () {
						var index = +$('.row-index').val(),
							top = 0;
						$('#table').find('tbody tr').each(function (i) {
							if (i < index) {
								top += $(this).height();
							}
						});
						$('#table').bootstrapTable('scrollTo', top);
					});
				}
			});
		}

		$(document).ready(function () {
			GetData();
		});
	</script>
	<div class="">
		<div id="ember6145" class="shop-setting-header ember-view">
			<div class="shop-setting-header__content">
				<div style="background: #F6A700;" class="shop-setting-header__icon">
					<svg width="16" height="16" viewBox="0 0 16 16">
						<g fill-rule="evenodd">
							<path d="M14.938 1.627a.998.998 0 0 0-.626-.566.99.99 0 0 0-.296-.045h-11a.998.998 0 0 0-.955.703.99.99 0 0 0-.045.297v12a.998.998 0 0 0 .703.955.99.99 0 0 0 .297.045h11a.998.998 0 0 0 .955-.703.99.99 0 0 0 .045-.297v-12c0-.136-.028-.27-.079-.39zm-8.922.389v-1h5v1h3v12h-11v-12h3z" fill-rule="nonzero"></path>
							<path d="M6.742 0h3.516a1.742 1.742 0 1 1 0 3.484H6.742a1.742 1.742 0 1 1 0-3.484zm0 1a.742.742 0 1 0 0 1.484h3.516a.742.742 0 1 0 0-1.484H6.742z"></path>
							<path d="M5.516 6.016a.5.5 0 1 1 0-1h6a.5.5 0 1 1 0 1h-6zm0 3a.5.5 0 1 1 0-1h6a.5.5 0 1 1 0 1h-6zm0 3a.5.5 0 1 1 0-1h4.734a.5.5 0 1 1 0 1H5.516z" fill-rule="nonzero"></path>
						</g></svg>
				</div>

				<div class="shop-setting-header__caption ">
					<div class="shop-setting-header__title">Đơn hàng</div>
					<div class="shop-setting-header__subtitle">Danh sách đơn hàng</div>
				</div>
				<div class="shop-setting-header__buttons">
				</div>
			</div>
			<hr class="shop-setting-header__seperator ">
		</div>
		<div class=" tab-action">
			<div class="tabs">
				<a href="<%=GetRouteUrl("userorder", new { }) %>" id="ember1144" class="tabs__tab ember-view ">Tất cả</a>
                <a href="<%=GetRouteUrl("userordernew", new { }) %>" id="ember1168" class="tabs__tab ember-view  ">Mới đặt hàng</a>
                <a href="<%=GetRouteUrl("userorderprocessing", new { }) %>" id="ember31168" class="tabs__tab ember-view ">Đang giao</a>
                <a href="<%=GetRouteUrl("userordercomplete", new { }) %>" id="ember331168" class="tabs__tab ember-view active">Hoàn thành</a>
                <a href="<%=GetRouteUrl("userordercancel", new { }) %>" id="ember1169" class="tabs__tab ember-view">Đã huỷ</a>
			</div>
		</div>
		<div id="editPage" class="content">
			<div style="margin-top: 15px;">
				<div class="form-group col-sm-4">
					<div class="col-sm-3 control-label alignCenterH">Ngày : </div>
					<div class="col-sm-9">
						<input name="" id="datePicker" class="form-control datepicker" required="required" data-date-format="dd/mm/yyyy">
					</div>
				</div>
				<div class="form-group col-sm-3">
					<button id="btnSearch" type="button" onclick="GetData();" class="btn btn-primary">Tìm kiếm</button>
				</div>
			</div>
			<table id="table" data-search="true" data-show-columns="false" data-pagination="true" >
				<thead>
					<tr>
						<th data-field="col1" data-sortable="true">Ngày đặt hàng</th>
						<th data-field="col2" data-sortable="true">Mã đơn hàng</th>
						<th data-field="col3" data-sortable="true" width="200">Tên sản phẩm</th>
						<th data-field="col4" data-sortable="true">Tên khách hàng</th>
						<th data-field="col5" data-sortable="true">Địa chỉ</th>
						<th data-field="col6" data-sortable="true">Số điện thoại</th>
						<th data-field="col7" data-sortable="true">Số lượng</th>
						<th data-field="col8" data-sortable="true">Thành tiền</th>
						<th data-field="col9" data-sortable="true">Tình trạng</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>


	<%--<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>--%>
</asp:Content>
