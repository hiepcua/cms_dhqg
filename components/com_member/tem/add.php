<?php
$msg 		= new \Plasticbrain\FlashMessages\FlashMessages();
if(!isset($_SESSION['flash'.'com_'.COMS])) $_SESSION['flash'.'com_'.COMS] = 2;
require_once('libs/cls.upload.php');
$obj_upload = new CLS_UPLOAD();
$file='';

if(isset($_POST['cmdsave_tab1']) && $_POST['txt_username']!='') {
	$arr=array();
	$arr['username'] = antiData($_POST['txt_username']);
	$arr['password'] = hash('sha256',$arr['username']).'|'.hash('sha256',md5($_POST['txt_pass']));
	$arr['fullname'] = antiData($_POST['txt_fullname']);
	$arr['phone'] = antiData($_POST['txt_phone']);
	$arr['email'] = antiData($_POST['txt_email']);
	$arr['cdate'] = time();

	$number = SysCount('tbl_member', "AND username='".$arr['username']."'");
	if($number > 0){
		$_SESSION['flash'.'com_'.COMS] = 0;
	}else{
		$result = SysAdd('tbl_member', $arr);
		if($result){
			$_SESSION['flash'.'com_'.COMS] = 1;
		}else{
			$_SESSION['flash'.'com_'.COMS] = 0;
		}
	}
}
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
				$msg->success('Thêm mới thành công.');
				echo $msg->display();
			}else if($_SESSION['flash'.'com_'.COMS] == 0){
				$msg->error('Có lỗi trong quá trình thêm mới.');
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
								<input type="text" id="txt_username" name="txt_username" class="form-control" value="" placeholder="Tên đăng nhập">
							</div>
						</div>
						<div class="col-md-6">
							<label>Mật khẩu<font color="red"><font color="red">*</font></font></label>
							<input type="text" id="txt_pass" name="txt_pass" class="form-control" value="" placeholder="Mật khẩu ít nhất 6 kí tự">
						</div>
					</div>

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Tên đầy đủ</label>
								<input type="text" class="form-control" name="txt_fullname">
							</div>
						</div>
						<div class="col-md-6">
							<label>Số điện thoại</label>
							<input type="number" class="form-control" name="txt_phone">
						</div>
						<div class="col-md-6">
							<label>Email</label>
							<input type="email" class="form-control" name="txt_email">
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

		$('#txt_username').change(function(){
			var username = $(this).val();
			var _url = '<?php echo ROOTHOST;?>ajaxs/mem/checkExist.php';
            var _data = {'user': username}
			$.post(_url, _data, function(req){
                if(parseInt(req) == 0){
                	$('#notify_username').html('<b class="cgreen">Ok!</b>');
                }else{
                	$('#notify_username').html('<b class="cred">Username exist!</b>');
                }
            })
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