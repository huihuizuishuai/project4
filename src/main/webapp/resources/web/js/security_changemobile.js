	function changeTelSendVCode() {
		$('#changeTelVcodeBtn').attr("disabled", true);	
		$.ajax({
			type : "POST", 
			dataType : "json", 
			async : true,
			url : baseContext+'/account/security/authentication/genVerifyCodeForResetPhoneOri', 
			data : {
			
			},
			success : function(resp) {
				if (resp.code == 0) {
					$('#changeTelVcodeBtn').text("发送成功");
					var seconds = 60;
					var interval = setInterval(function () {
						var string = seconds + "秒后重新获取";
						$('#changeTelVcodeBtn').text(string);
						seconds--;
						if (seconds == 0) {
							$('#changeTelVcodeBtn').attr("disabled",false);
							$('#changeTelVcodeBtn').text("获取手机验证码");
							clearInterval(interval);
						}
					}, 1000);	
				} else {					
					$('#changeTelVcodeBtn').attr('disabled', false);
				}
			}
		});			
			
	}

	function setNewTelError(txt) {
		if (txt) {
			$('#setNewTelForm #NewTelGroup').addClass('has-error');
			$('#setNewTelForm #NewTelGroup .error-info').text(txt);
		} else {
			$('#setNewTelForm #NewTelGroup').removeClass('has-error');
			$('#setNewTelForm #NewTelGroup .error-info').text('');
		}
	}

	var newTelSymbol = false;

	$("#NewTel").change(function () {
		var newPhone = $("#NewTel").val();
		if (newPhone == "" || newPhone == undefined) {
			setNewTelError("输入您的手机号码");
			return;
		}
		var pattter = new RegExp(/^1[0-9]{10}$/);
		if (!pattter.test(newPhone)) {
			setNewTelError("请输入正确的手机号码");
			return;
		}
		
		$.ajax({
			type : "POST", 
			dataType : "json", 
			async : true,
			url : baseContext+'/account/security/authentication/chkPhoneExist', 
			data : {
				phone : newPhone		
			},
			success : function(resp) {
				if (resp.code == 0) {
					newTelSymbol = true;
					setNewTelError(false);		
				} else {					
					setNewTelError(resp.msg);
					return;
				}
			}
		});		
	});

	function setNewTelSendVCode() {
		if (!newTelSymbol) {
			return;
		}
		var newPhone = $("#NewTel").val();
		$('#setNewTelVcodeBtn').attr("disabled", true);	
		$.ajax({
			type : "POST", 
			dataType : "json", 
			async : true,
			url : baseContext+'/account/security/authentication/genVerifyCodeForResetPhoneNew', 
			data : {
				phone:newPhone
			},
			success : function(resp) {
				if (resp.code == 0) {
					$('#setNewTelVcodeBtn').text("发送成功");
					var seconds = 60;
					var interval = setInterval(function () {
						var string = seconds + "秒后重新获取";
						$('#setNewTelVcodeBtn').text(string);
						seconds--;
						if (seconds == 0) {
							$('#setNewTelVcodeBtn').attr("disabled", false);
							$('#setNewTelVcodeBtn').text("获取手机验证码");
							clearInterval(interval);
						}
					}, 1000);	
				} else {					
					$('#setNewTelVcodeBtn').attr('disabled', false);
				}
			}
		});			
	}

	var setNewTel = function() {
		if (!newTelSymbol) {
			return;
		}
		var newTelVCode = $("#setNewTelvCode").val();
		if (newTelVCode == "" || newTelVCode == undefined) {
			$('#setNewTelForm #setNewTelvCodeGroup').addClass('has-error');
			return;
		}
		$('#setNewTelForm #setNewTelvCodeGroup').removeClass('has-error');
		var newPhone = $("#NewTel").val();	
		$.ajax({
			type : "POST", 
			dataType : "json", 
			async : true,
			url : baseContext+'/account/security/authentication/submitNewPhone', 
			data : {
				phone:newPhone,
				verifyCode:newTelVCode
			},
			success : function(resp) {
				if (resp.code == 0) {
					$("#setNewTelModal").modal("hide");
					$("#changeTelResultModal .title").html("操作成功");
					$("#changeTelResultModal .content").html("修改绑定手机成功");
					$("#changeTelResultModal").modal();
					$('#changeTelResultModal').on('hidden.bs.modal', function () {
						window.location.reload();
					});	
				} else {					
					$("#changeTelResultModal .title").html("操作失败");
					$("#changeTelResultModal .content").html(resp.msg);
					$("#changeTelResultModal").modal();
				}
			}
		});			

	}

	var changeTel = function () {
		var changeTelVCode = $("#changeTelModal #changeTelvCode").val();
		if (!changeTelVCode) {
			$('#changeTelForm #changeTelvCodeGroup').addClass('has-error');
			return;
		} else {
			$('#changeTelForm #changeTelvCodeGroup').removeClass('has-error');
		}		
		$.ajax({
			type : "POST", 
			dataType : "json", 
			async : true,
			url : baseContext+'/account/security/authentication/chkVerifyCodeForResetPhone', 
			data : {
				verifyCode : changeTelVCode		
			},
			success : function(resp) {
				if (resp.code == 0) {
					$("#changeTelModal").modal("hide");
					$("#setNewTelModal").modal();		
				} else {
					$("#changeTelResultModal .title").html("操作失败");
					$("#changeTelResultModal .content").html("验证码输入有误");
					$("#changeTelResultModal").modal();			
				}
			}
		});		
	}