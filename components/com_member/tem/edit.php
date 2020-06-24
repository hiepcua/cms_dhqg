<?php
$msg 		= new \Plasticbrain\FlashMessages\FlashMessages();
if(!isset($_SESSION['flash'.'com_'.COMS])) $_SESSION['flash'.'com_'.COMS] = 2;
require_once('libs/cls.upload.php');
$obj_upload = new CLS_UPLOAD();
$file='';

$GetID = isset($_GET['id']) ? (int)$_GET["id"] : 0;
if($GetID == 0){ echo "Không có dữ liệu."; return; }

if(isset($_POST['cmdsave_tab1']) && $_POST['txt_username']!='') {
	$arr=array();
	$arr['fullname'] = antiData($_POST['txt_fullname']);
	$arr['phone'] = antiData($_POST['txt_phone']);
	$arr['email'] = antiData($_POST['txt_email']);

	$result = SysEdit('tbl_member', $arr, "id=".$GetID);
	if($result){
		$_SESSION['flash'.'com_'.COMS] = 1;
	}else{
		$_SESSION['flash'.'com_'.COMS] = 0;
	}
}

$res_Member = SysGetList('tbl_member', array(), ' AND id='. $GetID);
if(count($res_Member) <= 0){ echo 'Không có dữ liệu.'; return; }
$row = $res_Member[0];

?>
<!-- Content Header (Page header) -->
<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1 class="m-0 text-dark">Thêm mới thành viên</h1>
			</div><!-- /.col -->
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item"><a href="<?php echo ROOTHOST;?>">Bảng điều khiển</a></li>
					<li class="breadcrumb-item"><a href="<?php echo ROOTHOST.COMS;?>">Danh sách thành viên</a></li>
					<li class="breadcrumb-item active">Thêm mới thành viên</li>
				</ol>
			</div><!-- /.col -->
		</div><!-- /.row -->
	</div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->
<!-- Main content -->
<section class="content">
	<div class="container-fluid">
		<?php
		if (isset($_SESSION['flash'.'com_'.COMS])) {
			if($_SESSION['flash'.'com_'.COMS] == 1){
				$msg->success('Cập nhật thành công.');
				echo $msg->display();
			}else if($_SESSION['flash'.'com_'.COMS] == 0){
				$msg->error('Có lỗi trong quá trình cập nhật.');
				echo $msg->display();
			}
			unset($_SESSION['flash'.'com_'.COMS]);
		}
		?>
		<div id='action'>
			<div>Các mục được đánh dấu * là các trường thông tin yêu cầu không được thiếu.</div>
			<div class="card">
				<form name="frm_action" id="frm_action" action="" method="post" enctype="multipart/form-data">
					<div class="mess"></div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Tên đăng nhập<font color="red"><font color="red">*</font></font></label><small id="notify_username" style="padding-left: 10px;"></small>
								<input type="text" id="txt_username" name="txt_username" class="form-control" value="<?php echo $row['username'];?>" readonly>
							</div>
						</div>
						<div class="col-md-6">
							<label>Đổi mật khẩu</label>
							<div><a href="<?php echo ROOTHOST.COMS.'/changepass/'.$row['id'];?>" class="btn btn-link" title="Đổi mật khẩu">Đổi mật khẩu</a></div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Tên đầy đủ</label>
								<input type="text" class="form-control" name="txt_fullname" value="<?php echo $row['fullname'];?>">
							</div>
						</div>
						<div class="col-md-6">
							<label>Số điện thoại</label>
							<input type="number" class="form-control" name="txt_phone" value="<?php echo $row['phone'];?>">
						</div>
						<div class="col-md-6">
							<label>Email</label>
							<input type="email" class="form-control" name="txt_email" value="<?php echo $row['email'];?>">
						</div>
					</div>
					
					<div class="text-center toolbar">
						<input type="submit" name="cmdsave_tab1" id="cmdsave_tab1" class="save btn btn-success" value="Lưu thông tin" class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- /.row -->
<!-- /.content-header -->
<script type="text/javascript">
	$(document).ready(function(){
		$('#frm_action').submit(function(){
			return validForm();
		});
	});

	function validForm(){
		var flag = true;
		var username = $('#txt_username').val();
		var pass = $('#txt_pass').val();
		var lg = pass.length;

		if(lg < 6){
			alert('Mật khẩu phải có ít nhất 6 kí tự');
			flag = false;
		}
		if(username.length < 3){
			alert('Tên đăng nhập phải có ít nhất 3 kí tự');
			flag = false;
		}
		return flag;
	}
</script>