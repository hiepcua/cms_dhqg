<?php
$user=getInfo('username');
$isAdmin=getInfo('isadmin');
define('OBJ_PAGE','MEMBER');
if($isAdmin==1){
	$strWhere="";
	$status = isset($_GET['s']) ? antiData($_GET['s']) : '';
	$room = isset($_GET['r']) ? antiData($_GET['r']) : '';
	$q = isset($_GET['q']) ? antiData($_GET['q']) : '';
	// Gán strwhere
	if($status != '' && $status == 'trash' ){
		$strWhere.=" AND `is_trash` = 1";
	}else{
		$strWhere.=" AND `is_trash` = 0";
	}
	if($q!=''){
		$strWhere.=" AND (`fullname` LIKE '%$q%' OR `email` LIKE '%$q%' OR  `phone` LIKE '%$q%') ";
	}
	if($room!=''){
		$strWhere.=" AND username IN (SELECT username FROM tbl_class_member WHERE class_code='$room') ";
	}
	// Begin pagging
	if(!isset($_SESSION['CUR_PAGE_'.OBJ_PAGE])){
		$_SESSION['CUR_PAGE_'.OBJ_PAGE] = 1;
	}
	if(isset($_POST['txtCurnpage'])){
		$_SESSION['CUR_PAGE_'.OBJ_PAGE] = (int)$_POST['txtCurnpage'];
	}

	$total = SysCount('tbl_member', $strWhere);
	$total_rows = $total;
	$max_rows = 10;

	if($_SESSION['CUR_PAGE_'.OBJ_PAGE] > ceil($total_rows/$max_rows)){
		$_SESSION['CUR_PAGE_'.OBJ_PAGE] = ceil($total_rows/$max_rows);
	}
	$cur_page=(int)$_SESSION['CUR_PAGE_'.OBJ_PAGE]>0 ? $_SESSION['CUR_PAGE_'.OBJ_PAGE] : 1;
	// End pagging
	?>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#cbo_action').change(function(){
				$('#frm_list').submit();
			});
		});

		function cbo_Selected(id, value){
			var obj=document.getElementById(id);
			for(i=0;i<obj.length;i++){
				if(obj[i].value==value)
					obj.selectedIndex=i;
			}
		}
	</script>
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">Members</h1>
				</div><!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="<?php echo ROOTHOST;?>">Home</a></li>
						<li class="breadcrumb-item active">Members</li>
					</ol>
				</div><!-- /.col -->
			</div><!-- /.row -->
		</div><!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->
	<!-- Main content -->
	<section class="content">
		<div class='container-fluid'>
			<div class="widget-frm-search">
				<form id='frm_search' method='get' action=''>
					<input type='hidden' id='txtids' name='txtids'/>
					<input type='hidden' id='txt_status' name='s' value='<?php echo $status;?>' />
					<div class='row'>
						<div class='col-sm-4'>
							<div class='form-group'>
								<input type='text' id='txt_title' name='q' class='form-control' value='<?php echo $q;?>' placeholder="Tên, email hoặc số điện thoại" />
							</div>
						</div>
						<div class='col-sm-2'></div>
						<div class="col-sm-2"></div>
						<div class="col-sm-4 text-right">
							<div class='form-group'>
								<?php if($status=='trash'){?>
									<button type='button' class='btn btn-default' id='btn_list_member' ><i class="fas fa-list"></i> Danh sách </button>
								<?php }else{?>
									<button type='button' class='btn btn-default' id='btn_list_trash_member' ><i class="fas fa-trash"></i> Trash</button>
								<?php }?>&nbsp&nbsp
								<a href="<?php echo ROOTHOST.COMS;?>/add" class="btn btn-primary float-sm-right">Thêm mới</a>
							</div>
						</div>
					</div>
				</form>
				<script type="text/javascript">
					$('#txt_keyword').keyup(function(e){
						if (e.which == 13) {
							/*Enter key pressed*/
							$('#frm_search').submit();
							e.preventDefault();
							return false;
						}
					});
					$('#btn_list_trash_member').click(function(){
						$('#txt_status').val('trash');
						$('#frm_search').submit();
					});
					$('#btn_list_member').click(function(){
						$('#txt_status').val('');
						$('#frm_search').submit();
					});
				</script>
			</div>

			<div class="card">
				<div class="table-responsive">
					<table class="table">
						<thead>                  
							<tr>
								<th style="width: 10px">#</th>
								<th width="30" align="center"><input type="checkbox" name="chkall" id="chkall" value="" onclick="docheckall('chk',this.checked);" /></th>
								<th>Xóa</th>
								<th>Username</th>
								<th>Fullname</th>
								<th>Phone</th>
								<th>Email</th>
								<th style="text-align: center;">Hiển thị</th>
								<th style="text-align: center;">Chi tiết</th>
							</tr>
						</thead>
						<tbody>
							<?php
							if($total>0){
								$i=0;
								$start = ($cur_page - 1) * $max_rows;
								$strWhere.=" LIMIT $start,".$max_rows;
								$obj=SysGetList('tbl_member', array(), $strWhere, false);
								while($r=$obj->Fetch_Assoc()){
									$i++;
									if($r['isactive'] == 1) 
										$icon_active    = "<i class='fas fa-toggle-on cgreen'></i>";
									else $icon_active   = '<i class="fa fa-toggle-off cgray" aria-hidden="true"></i>';
									?>
									<tr>
										<td width='30' align='center'><?php echo $i;?></td>
										<td width='30' align='center'><input type='checkbox' name='chk' onclick="docheckonce('chk');" value=""></td>
										<td align="center" width="10"><a href="<?php echo ROOTHOST.COMS."/trash/".$r['id'];?>" onclick='return confirm("Bạn có chắc muốn xóa ?")'><i class='fa fa-trash cred' aria-hidden='true'></i></a></td>
										<td><?php echo $r['username'];?></td>
										<td><?php echo $r['fullname'];?></td>
										<td><?php echo $r['phone'];?></td>
										<td><?php echo $r['email'];?></td>
										<td align='center'><a href="<?php echo ROOTHOST.COMS."/active/".$r['id'];?>"><?php echo $icon_active;?></a></td>
										<td align='center'>
											<a href="<?php echo ROOTHOST.COMS."/edit/".$r['id'];?>"><i class="fas fa-edit"></i></a>
										</td>
									</tr>
								<?php }
							}else{
								?>
								<tr>
									<td colspan='3' class='text-center'>No there member yet!</td>
								</tr>
							<?php }?>
						</tbody>
					</table>
				</div>
			</div>
			<nav class="d-flex justify-content-center">
				<?php paging($total_rows, $max_rows, $cur_page);?>
			</nav>
		</div>
	</section>
<?php }else{
	echo "<h3 class='text-center'>You haven't permission</h3>";
}?>