<?php
$isAdmin=getInfo('isadmin');
$GetID = isset($_GET['id']) ? (int)$_GET["id"] : 0;
if($GetID == 0){ echo "Không có dữ liệu."; return; }

$res_Member = SysGetList('tbl_member', array(), "AND id=".$GetID);
if(count($res_Member) <= 0){ echo 'Không có dữ liệu.'; return; }
$row = $res_Member[0];

if(isset($_POST['cmdsave_tab2'])){
	$Cur_password 	= isset($_POST['current_password']) ? trim(addslashes($_POST['current_password'])) : '';
	$New_password 	= isset($_POST['new_password']) ? trim(addslashes($_POST['new_password'])) : '';
	$Re_password 	= isset($_POST['re_password']) ? trim(addslashes($_POST['re_password'])) : '';
	$pass = antiData($Cur_password);
	$pass = hash('sha256', $row['username']).'|'.hash('sha256', md5($pass));

	if($pass == $row['password']){
		$arr = array();
		$arr['password'] = hash('sha256',$row['username']).'|'.hash('sha256',md5($New_password));
		$result = SysEdit('tbl_member', $arr, "id=".$GetID);

		if($result) $_SESSION['flash'.'com_'.COMS] = 1;
        else $_SESSION['flash'.'com_'.COMS] = 0;
	}else{
		$_SESSION['flash'.'com_'.COMS] = 3;
	}
}
?>
<script type="text/javascript">
	function validate_data(){
		var pass1 = $('#new_password').val();
		var pass1_1 = $('#re_password').val();

		if(pass1 === pass1_1) $('#frm_action').submit();
		else $('.mess').text('Gõ lại mật khẩu không trùng nhau.');
	}
</script>
<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0 text-dark">Đổi mật khẩu</h1>
			</div><!-- /.col -->
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="<?php echo ROOTHOST;?>">Home</a></li>
					<li class="breadcrumb-item"><a href="<?php echo ROOTHOST.COMS;?>">Members</a></li>
					<li class="breadcrumb-item active">Đổi mật khẩu</li>
				</ol>
			</div><!-- /.col -->
		</div><!-- /.row -->
	</div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->
<!-- Main content -->
<section class="content">
	<div class='container-fluid'>
		<!-- Main content -->
		<section id="profile" class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-4 col-lg-3">
						<!-- <div class="text-center">
							<div class="wrap-avatar">
								<?php echo $avatar;?>
							</div>
						</div> -->

						<ul class="list-group">
							<li class="list-group-item"><strong>Tên đăng nhập:</strong> <div><?php echo $row['username'];?></div></li>
							<li class="list-group-item"><span class="pull-left"><strong>Join:</strong></span> <?php echo date('d-m-Y', $row['cdate']);?></li>
						</ul>
					</div>

					<div class="col-sm-8 col-lg-9">
						<div class="tab-content card">
							<div class="tab-pane container-fluid active" id="seo">
								<form id="frm_action" class="form" action="" method="post">
									<p>
										<?php
										if (isset($_SESSION['flash'.'com_'.COMS])) {
											if($_SESSION['flash'.'com_'.COMS] == 1){
												$msg->success('Cập nhật thành công.');
												echo $msg->display();
											}else if($_SESSION['flash'.'com_'.COMS] == 0){
												$msg->error('Có lỗi trong quá trình cập nhật.');
												echo $msg->display();
											}else if($_SESSION['flash'.'com_'.COMS] == 3){
												$msg->error('Mật khẩu hiện tại không đúng.');
												echo $msg->display();
											}
											unset($_SESSION['flash'.'com_'.COMS]);
										}
										?>
									</p>
									<div class="mess" style="color: red"></div>
									<div class="form-group">
										<div class="col-xs-6">
											<label>Mật khẩu hiện tại</label>
											<input type="password" class="form-control" name="current_password" id="current_password" placeholder="Mật khẩu hiện tại" title="Mật khẩu hiện tại">
										</div>
									</div>

									<div class="form-group">
										<div class="col-xs-6">
											<label>Mật khẩu mới</label>
											<input type="password" class="form-control" name="new_password" id="new_password" placeholder="Mật khẩu mới" title="Mật khẩu mới">
										</div>
									</div>

									<div class="form-group">
										<div class="col-xs-6">
											<label>Gõ lại mật khẩu mới</label>
											<input type="password" class="form-control" name="re_password" id="re_password" placeholder="Gõ lại mật khẩu mới" title="Gõ lại mật khẩu mới">
										</div>
									</div>

									<div class="text-center toolbar">
										<input type="submit" name="cmdsave_tab2" id="cmdsave_tab2" onclick="return validate_data();" class="save btn btn-success" value="Lưu mật khẩu" class="btn btn-primary">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</section>