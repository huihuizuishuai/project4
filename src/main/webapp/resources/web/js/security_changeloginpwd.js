	$("#changePWResultModal").on('hidden.bs.modal', function () { window.location.reload(); });
	function oldPasswordError(txt) {
		if (txt) {
			$('#changePWModalForm #oldLoginPwGroup').addClass('has-error');
			$('#changePWModalForm #oldLoginPwGroup .error-info').text(txt);
		} else {
			$('#changePWModalForm #oldLoginPwGroup').removeClass('has-error');
			$('#changePWModalForm #oldLoginPwGroup .error-info').text('');
		}
	}
	function newPasswordError(txt) {
		if (txt) {
			$('#changePWModalForm #newLoginPwGroup').addClass('has-error');
			$('#changePWModalForm #newLoginPwGroup .error-info').text(txt);
		} else {
			$('#changePWModalForm #newLoginPwGroup').removeClass('has-error');
			$('#changePWModalForm #newLoginPwGroup .error-info').text('');
		}
	}
	function newPasswordConfirmError(txt) {
		if (txt) {
			$('#changePWModalForm #newLoginPwConfirmGroup').addClass('has-error');
			$('#changePWModalForm #newLoginPwConfirmGroup .error-info').text(txt);
		} else {
			$('#changePWModalForm #newLoginPwConfirmGroup').removeClass('has-error');
			$('#changePWModalForm #newLoginPwConfirmGroup .error-info').text('');
		}
	}
	var changeLoginPW = function() {
		var oldPassword = $("#changePWModal #oldLoginPw").val();
		var pattter = new RegExp(/^(?=.*[0-9])(?=.*[a-zA-Z!@#$%^&*()_+|]).{6,30}$/);
		if (!oldPassword) {
			oldPasswordError('原登录密码不能为空');
			return;
		} else {
			oldPasswordError(false);
		}
		var newPassword = $("#changePWModal #newLoginPw").val();
		if (!newPassword) {
			newPasswordError('新登录密码不能为空');
			return;
		} else {
			if (!pattter.test(newPassword)) {
				newPasswordError('6-30位数字和字母组成');
				return;
			}
			newPasswordError(false);
		}
		var newPasswordConfirm = $("#changePWModal #newLoginPwConfirm").val();
		if (!newPasswordConfirm) {
			newPasswordConfirmError('确认新密码不能为空');
			return;
		} else {
			if (newPasswordConfirm != newPassword) {
				newPasswordConfirmError('两次输入的新密码不一致');
				return;
			}
			newPasswordConfirmError(false);
		}
		$.ajax({
			type : "POST", 
			dataType : "json", 
			async : true,
			url : baseContext+'Main/changeLoginPwd', 
			data : {
				oldPwd : oldPassword,
				newPwd : newPassword
			},
			success : function(resp) {
				if (resp.code == 0) {
					$("#changePWResultModal .title").html("操作成功");
					$("#changePWResultModal .content").html("修改登录密码成功");
					
				} else {
					$("#changePWResultModal .title").html("操作失败");
					$("#changePWResultModal .content").html(resp.msg);			
				}
				$("#changePWModal").modal("hide");
				$("#changePWResultModal").modal();				
			}
		});	

	}