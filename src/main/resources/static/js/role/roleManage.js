/**
 * 角色管理
 */
//'formSelects.render('permissions');
var pageCurr;
var form;

$(function() {

    layui.use('table', function(){
        var table = layui.table;
        form = layui.form;

        tableIns=table.render({
            elem: '#roleList',
            url:'/role/getRoleList',
            method: 'get', //默认：get请求
            cellMinWidth: 80,
            page: true,
            request: {
                pageName: 'pageNum', //页码的参数名称，默认：pageNum
                limitName: 'pageSize' //每页数据量的参数名，默认：pageSize
            },
            response:{
                statusName: 'code', //数据状态的字段名称，默认：code
                statusCode: 200, //成功的状态码，默认：0
                countName: 'totals', //数据总数的字段名称，默认：count
                dataName: 'list' //数据列表的字段名称，默认：data
            },
            cols: [[
                {type:'numbers'}
                ,{field:'roleName', title:'roleName',align:'center'}
                ,{field:'roleDesc', title:'roleDesc',align:'center'}
                ,{field:'permissions', title:'permissions',align:'center'}
                ,{field:'createTime', title:'createTime',align:'center'}
                ,{field:'updateTime', title:'updateTime',align:'center'}
                ,{field:'roleStatus', title:'roleStatus',align:'center'}
                ,{fixed:'right',title:'operation',align:'center', toolbar:'#optBar'}
            ]],
            done: function(res, curr, count){
                $("[data-field='roleStatus']").children().each(function(){
                    if($(this).text()=='1'){
                        $(this).text("enable")
                    }else if($(this).text()=='0'){
                        $(this).text("disable")
                    }
                });
                pageCurr=curr;

            }
        });


        //监听工具条
        table.on('tool(roleTable)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                //删除
                delRole(data,data.id);
            } else if(obj.event === 'edit'){
                //编辑
                edit(data);
            }else if(obj.event === 'recover'){
                //恢复
                recoverRole(data,data.id);
            }
        });

        //监听提交
        form.on('submit(roleSubmit)', function(data){
            formSubmit(data);
            return false;
        });

    });

});

//提交表单
function formSubmit(obj){
    $.ajax({
        type: "post",
        data: $("#roleForm").serialize(),
        url: "/role/setRole",
        success: function (data) {
            if (data.code == 1) {
                layer.alert(data.msg,function(){
                    layer.closeAll();
                    load(obj);
                });
            } else {
                layer.alert(data.msg);
            }
        },
        error: function () {
            layer.alert("Operation failure, pls try again later!",function(){
                layer.closeAll();
                load(obj);
            });
        }
    });
}

//add
function add() {
    edit(null,"add");
}
//打开编辑框
function edit(data,title){
    var pid = null;
    if(data == null){
        $("#id").val("");
    }else{
        //回显数据
        $("#id").val(data.id);
        $("#roleName").val(data.roleName);
        $("#roleDesc").val(data.roleDesc);
        pid = data.permissionIds;
    }

    formSelects.data('permissions', 'server', {
        url: '/permission/parentPermissionList',
        keyName: 'name',
        keyVal: 'id',
        success: function(id, url, searchVal, result){      //使用远程方式的success回调

            console.log(pid)
            if(pid != null){
                var assistAuditArry =pid.split(",");
                formSelects.value('permissions', assistAuditArry);
            }

            console.log(result);    //return的结果
        },
        error: function(id, url, searchVal, err){           //使用远程方式的error回调
                                                            //同上
            console.log(err);   //err对象
        },
    });


    var pageNum = $(".layui-laypage-skip").find("input").val();
    $("#pageNum").val(pageNum);

    layer.open({
        type:1,
        title: title,
        fixed:false,
        resize :false,
        shadeClose: true,
        area: ['550px','550px'],
        content:$('#setRole'),
        end:function(){
            cleanRole();
        }
    });
}

//重新加载table
function load(obj){
    tableIns.reload({
        where: obj.f
        , page: {
            curr: pageCurr //从当前页码开始
        }
    });
}

//删除
function delRole(obj,id) {
    if(null!=id){
        layer.confirm('Are you sure you  to delete it?', {
            btn: ['confirm','return'] //按钮
        }, function(){
            $.post("/role/updateRoleStatus",{"id":id,"status":0},function(data){
                if (data.code == 1) {
                    layer.alert(data.msg,function(){
                        layer.closeAll();
                        load(obj);
                    });
                } else {
                    layer.alert(data.msg);
                }
            });
        }, function(){
            layer.closeAll();
        });
    }
}
//恢复
function recoverRole(obj,id) {
    if(null!=id){
        layer.confirm('Are you sure you  to recover it？', {
            btn: ['confirm','return'] //按钮
        }, function(){
            $.post("/role/updateRoleStatus",{"id":id,"status":1},function(data){
                if (data.code == 1) {
                    layer.alert(data.msg,function(){
                        layer.closeAll();
                        load(obj);
                    });
                } else {
                    layer.alert(data.msg);
                }
            });
        }, function(){
            layer.closeAll();
        });
    }
}


function cleanRole() {
    $("#roleName").val("");
    $("#roleDesc").val("");
    $("#permissions").val("");
}

