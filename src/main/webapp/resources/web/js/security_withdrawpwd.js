	$("#setWithdrawPWResultModel").on('hidden.bs.modal', function () { window.location.reload(); });
	function withdrawPWError(txt) {
		if (txt) {
			$('#setWithdrawPWForm #withdrawPWGroup').addClass('has-error');
			$('#setWithdrawPWForm #withdrawPWGroup .error-info').text(txt);
		} else {
			$('#setWithdrawPWForm #withdrawPWGroup').removeClass('has-error');
			$('#setWithdrawPWForm #withdrawPWGroup .error-info').text('');
		}
	}

	function withdrawPWConfirmError(txt) {
		if (txt) {
			$('#setWithdrawPWForm #withdrawPWConfirmGroup').addClass('has-error');
			$('#setWithdrawPWForm #withdrawPWConfirmGroup .error-info').text(txt);
		} else {
			$('#setWithdrawPWForm #withdrawPWConfirmGroup').removeClass('has-error');
			$('#setWithdrawPWForm #withdrawPWConfirmGroup .error-info').text('');
		}
	}

	var setWithdrawPw = function() {
		var withdrawPw = $("#setWithdrawPWModel #withdrawPW").val();
		var pattter = new RegExp(/^[a-zA-Z0-9!@#$%^&*()_+|]{8,30}$/);
		if (!withdrawPw) {
			withdrawPWError('提款密码不能为空');
			return;
		} else {
			if (!pattter.test(withdrawPw)) {
				withdrawPWError('8-30位数字和字母组成');
				return;
			}
			withdrawPWError(false);
		}
		var withdrawPwConfirm = $("#setWithdrawPWModel #withdrawPWConfirm").val();
		if (!withdrawPwConfirm) {
			withdrawPWConfirmError('确认提款密码不能为空');
			return;
		} else {
			if (withdrawPwConfirm != withdrawPw) {
				withdrawPWConfirmError('两次输入的提款密码不一致');
				return;
			}
			withdrawPWConfirmError(false);
		}
		$.ajax({
			type : "POST", 
			async : true,
			dataType : "json", 
			url : baseContext+'Main/withdrawpwd', 
			data : {
				password : withdrawPw
			},
			success : function(data) {
				if (data.code == 0) {
					$("#setWithdrawPWResultModel .title").html("操作成功");
					$("#setWithdrawPWResultModel .content").html("设置提款密码成功");	
				} else {
					$("#setWithdrawPWResultModel .title").html("操作失败");
					$("#setWithdrawPWResultModel .content").html(data.msg);
				}
				$("#setWithdrawPWModel").modal("hide");
				$("#setWithdrawPWResultModel").modal();				
			}
		});
	}