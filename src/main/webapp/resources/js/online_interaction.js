/**
 * Created by Administrator on 2015/8/19.
 */
$(function () {

    $('#valForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            groupName: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '群名称不能为空!'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '群名称长度为6-30个字符?'
                    }
                }
            },
            groupNo: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '群主号码不能为空!'
                    },
                    stringLength: {
                        min: 6,
                        max: 10,
                        message: '群号称长度为6-10个数字?'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '群名称不符合规范!'
                    }
                }
            },
            host: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '群主号码不能为空!'
                    },
                    stringLength: {
                        min: 6,
                        max: 11,
                        message: '群主名称为?6-11个字符数?'
                    }
                }
            },
            sourceId: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '资源不能为空!'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '资源Id称长度为6-30个数?'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '资源Id不符合规范!'
                    }
                }
            },
            remark: {
                message: 'The username is not valid',
                validators: {
                    notEmpty: {
                        message: '备注不能为空!'
                    },
                    stringLength: {
                        min: 3,
                        max: 20,
                        message: '备注长度为?3-20个数字?'
                    }
                }
            }
        }
    }).on('success.form.bv', function (e) {
        // Prevent form submission
        e.preventDefault();
        // Get the form instance
        var $form = $(e.target);
        // Get the BootstrapValidator instance
        var bv = $form.data('bootstrapValidator');
        // Use Ajax to submit form data
        $.post($form.attr('action'), $form.serialize(), function (result) {
            $.gritter.add({
            	 title: "返回信息",
                text: "         "+result.msg,
                class_name: 'gritter-item-wrapper gritter-info gritter-center gritter-light'
            });
        }, 'json');
    });
});

