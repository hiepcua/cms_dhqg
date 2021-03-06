<?php
$isAdmin=getInfo('isadmin');
?>
<nav class="mt-2">
	<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
		<li class="nav-item has-treeview menu-open">
			<a href="<?php echo ROOTHOST;?>" class="nav-link <?php activeMenu('home');?>">
				<i class="nav-icon fas fa-tachometer-alt"></i>
				<p>Dashboard</p>
			</a>
		</li>
		
		<li class="nav-item">
			<a href="<?php echo ROOTHOST;?>content" class="nav-link <?php activeMenu('content');?>">
				<i class="nav-icon far fa-calendar-alt"></i>
				<p>Bài viết <i class="right fas fa-angle-left"></i></p>
			</a>
			<ul class="nav nav-treeview">
				<li class="nav-item">
					<a href="<?php echo ROOTHOST;?>content/add" class="nav-link <?php activeMenu('add','viewtype');?>">
						<i class="far fa-circle nav-icon"></i>
						<p>Thêm mới</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?php echo ROOTHOST;?>content/write?status=0" class="nav-link <?php activeMenu('write','viewtype'); activeVodMenuByStatus(0);?>">
						<i class="far fa-circle nav-icon"></i>
						<p>Đang biên tập <span class="badge badge-info right">6</span></p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?php echo ROOTHOST;?>content/pending?status=1" class="nav-link <?php activeMenu('pending','viewtype'); activeVodMenuByStatus(1);?>">
						<i class="far fa-circle nav-icon"></i>
						<p>Chờ duyệt <span class="badge badge-info right">6</span></p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?php echo ROOTHOST;?>content/waiting_public?status=3" class="nav-link <?php activeMenu('waiting_public','viewtype'); activeVodMenuByStatus(3);?>">
						<i class="far fa-circle nav-icon"></i>
						<p>Chờ xuất bản <span class="badge badge-info right">6</span></p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?php echo ROOTHOST;?>content/public?status=4" class="nav-link <?php activeMenu('public','viewtype'); activeVodMenuByStatus(4);?>">
						<i class="far fa-circle nav-icon"></i>
						<p>Đã xuất bản <span class="badge badge-info right">6</span></p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?php echo ROOTHOST;?>content/return?status=2" class="nav-link <?php activeMenu('return','viewtype'); activeVodMenuByStatus(2);?>">
						<i class="far fa-circle nav-icon"></i>
						<p>Trả về</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?php echo ROOTHOST;?>content/takedown?status=5" class="nav-link <?php activeMenu('takedown','viewtype'); activeVodMenuByStatus(5);?>">
						<i class="far fa-circle nav-icon"></i>
						<p>Bị gỡ xuống</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="<?php echo ROOTHOST;?>content/deleted?is_trash=1" class="nav-link <?php activeMenu('deleted','viewtype');?>">
						<i class="far fa-circle nav-icon"></i>
						<p>Đã xóa</p>
					</a>
				</li>
			</ul>
		</li>
		<li class="nav-item">
			<a href="<?php echo ROOTHOST;?>categories" class="nav-link <?php activeMenu('categories');?>">
				<i class="nav-icon fa fa-server" aria-hidden="true"></i>
				<p>Categories</p>
			</a>
		</li>
		
		<li class="nav-item">
			<a href="<?php echo ROOTHOST;?>member" class="nav-link <?php activeMenu('member');?>">
				<i class="nav-icon fas fa-users"></i>
				<p>Members </p>
			</a>
		</li>
		<li class="nav-item">
			<a href="<?php echo ROOTHOST;?>user" class="nav-link <?php activeMenu('user');?>">
				<i class="nav-icon fas fa-user"></i>
				<p>User </p>
			</a>
		</li>
		<li class="nav-item">
			<a href="<?php echo ROOTHOST;?>groupuser" class="nav-link <?php activeMenu('groupuser');?>">
				<i class="nav-icon fas fa-users"></i>
				<p>Group user </p>
			</a>
		</li>
		<li class="nav-item has-treeview">
			<a href="<?php echo ROOTHOST;?>setting" class="nav-link <?php activeMenu('setting');?>">
				<i class="nav-icon fas fa-user-cog"></i>
				<p>Setting </p>
			</a>
		</li>
		<li class="nav-item has-treeview">
			<a href="javascript:void(0);" class="nav-link logout">
				<i class="nav-icon fas fa-sign-out-alt"></i>
				<p>Logout </p>
			</a>
		</li>
	</ul>
</nav>
<script>
	$('.logout').click(function(){
		var _url="<?php echo ROOTHOST;?>ajaxs/user/logout.php";
		$.get(_url,function(){
			window.location.reload();
		})
	})
</script>