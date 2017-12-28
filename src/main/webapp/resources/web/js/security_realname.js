
	//绑定银行卡
	$("#buttonsubmit").click(function () {
		var username=$("#username").val();
		var identity=$("#identity").val();
		var bankCard = $("#bankCardNum").val();
		var bankCardConfirm = $("#bankCardNumConfirm").val();
		var type = $("#type").val();
		var loc_province = $("#loc_province").find("option:selected").text();
		var loc_city = $("#loc_city").find("option:selected").text();
		var loc_town = $("#loc_town").find("option:selected").text();
		var cardaddress=loc_province+"-"+loc_city+"-"+loc_town;
		var cardaddress1 = $("#cardaddress1").val();
		if (username=="" || username==undefined) {
			$("#withdrawError").html("请输入姓名");
			$("#withdrawErrorModal").modal();
			return;
		}
		if (identity=="" || identity==undefined) {
			$("#withdrawError").html("请输入身份证");
			$("#withdrawErrorModal").modal();
			return;
		}
		if (!isIdentityNumber(identity)) {
			$("#withdrawError").html("请输入正确的身份证号码");
			$("#withdrawErrorModal").modal();
			return;
		}
		if(loc_province=="省份"){
			$("#withdrawError").html("请选择省份");
			$("#withdrawErrorModal").modal();
			return;
		}
		if(loc_city=="地级市"){
			$("#withdrawError").html("请选择地级市");
			$("#withdrawErrorModal").modal();
			return;
		}
		if(loc_town=="市、县、区") {
			$("#withdrawError").html("请选择市、县、区");
			$("#withdrawErrorModal").modal();
			return;
		}

		if (bankCard == "" || bankCard == undefined) {
			$("#withdrawError").html("请输入银行卡号");
			$("#withdrawErrorModal").modal();
			return;
		}

		if (bankCardConfirm == "" || bankCardConfirm == undefined) {
			$("#withdrawError").html("请再次输入银行卡号");
			$("#withdrawErrorModal").modal();
			return;
		}
		if (bankCardConfirm != bankCard) {
			$("#withdrawError").html("两次输入的银行卡号不一致");
			$("#withdrawErrorModal").modal();
			return;
		}

		$("#buttonsubmit").addClass("disabled");
		$.ajax({
			type : "POST",
			dataType : "json",
			async : true,
			url : '${base}/account/security/addBankCard',
			data : {
				userName : userName,
				identity :identity,
				bankCard: bankCard,
				type:type,
				cardaddress:cardaddress+"-"+cardaddress1
			},
			success : function(resp) {
				if (resp.code == 0) {
					window.location.href = baseContext + "/account/security/memberBankcardView";
				} else {
					$("#withdrawError").html(resp.msg);
					$("#withdrawErrorModal").modal();
				}

			}
		});

	});

	var isIdentityNumber = function(number) {
		if($.trim(number)==''||!/^[0-9]{17}[0-9X]$/.test(number)){
			return false;
		}
		var weights = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2);
		var parityBits = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4","3", "2");
		var power = 0;
		for ( var i = 0; i < 17; i++) {
			power += parseInt(number.charAt(i),10)*weights[i];
		}
		return parityBits[power%11]==number.substr(17);
	}

//function registerRealName() {
//
//	$.ajax({
//		type : "POST",
//		dataType : "json",
//		async : true,
//		url : baseContext+'/account/security/authentication/reg',
//		data : {
//			realName : fullName,
//			idNo : idCode
//		},
//		success : function(resp) {
//			if (resp.code == 0) {
//				$('#realNameModal').modal('hide');
//				$("#realNameRegisteredModal").modal('show');
//				setTimeout(function() {
//					$("#realNameRegisteredModal").modal('hide');
//				}, 3000);
//			} else {
//				idCodeError(resp.msg);
//			}
//		}
//	});
//
//	$("#realNameRegisteredModal").on("hide.bs.modal", function () {
//	    window.location.reload();
//	});
//}
