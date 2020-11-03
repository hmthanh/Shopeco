<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/UserMaster.master" AutoEventWireup="true" CodeFile="BoughtNew.aspx.cs" Inherits="View_User_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headMasterpageUser" runat="Server">
    <link href="../../Content/UI/css/bootstrap-table.min.css" rel="stylesheet" />
    <script src="../../Content/UI/js/bootstrap-table.min.js"></script>
    <script src="../../Content/UI/js/bootstrap-table-vi-VN.js"></script>
    <%--<script src="../../Content/UI/js/bootstrap-table-locale-all.min.js"></script>--%>
	<link href="../../Content/UI/css/bootstrap-datepicker3.min.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $('#bought').addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentMasterpageUser" runat="Server">
	<script>
		var data = [];

		function GetData() {
			var dateSearch = $('#datePicker').val();
			var data = [];
			
			$.ajax({
				type: "GET",
				url: '../Ajax.aspx?Action=UserBought&type=1&date=' + dateSearch,
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
                <div style="background: #508bce;" class="shop-setting-header__icon">
                    <svg  viewBox="0 0 32 32"><path d="M28 30.5H4c-2.2 0-4-1.8-4-4v-12h32v12c0 2.2-1.8 4-4 4zm2-14H2v10c0 1.1.9 2 2 2h24c1.1 0 2-.9 2-2v-10zm-26 6h8v2H4v-2zm-4-14v-2c0-2.2 1.8-4 4-4h24c2.2 0 4 1.8 4 4v4H0v-2zm2 0h28v-2c0-1.1-.9-2-2-2H4c-1.1 0-2 .9-2 2v2z"></path></svg>
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
                <a href="<%=GetRouteUrl("userbought", new { }) %>" id="ember1144" class="tabs__tab ember-view">Tất cả</a>
                <a href="<%=GetRouteUrl("userboughtnew", new { }) %>" id="ember1168" class="tabs__tab ember-view active ">Mới đặt hàng</a>
                <a href="<%=GetRouteUrl("userboughtprocessing", new { }) %>" id="ember31168" class="tabs__tab ember-view">Đang giao</a>
                <a href="<%=GetRouteUrl("userboughtcomplete", new { }) %>" id="ember331168" class="tabs__tab ember-view">Hoàn thành</a>
                <a href="<%=GetRouteUrl("userboughtcancel", new { }) %>" id="ember1169" class="tabs__tab ember-view">Đã huỷ</a>
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
            <table id="table" data-search="true" data-show-columns="false" data-pagination="true" data-height="500">
                <thead>
                    <tr>
                        <th data-field="col1" data-sortable="true">Ngày đặt hàng</th>
                        <th data-field="col2" data-sortable="true">Mã đơn hàng</th>
                        <th data-field="col3" data-sortable="true">Tên khách hàng</th>
                        <th data-field="col4" data-sortable="true" width="200">Địa chỉ</th>
                        <th data-field="col5">Số điện thoại</th>
                        <th data-field="col6">Tình trạng</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</asp:Content>