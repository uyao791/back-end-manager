/**
 * 用户管理
 */
var pageCurr;
var form;
$(function() {
    layui.use('table', function(){
        var table = layui.table;
        form = layui.form;

        tableIns=table.render({
            elem: '#productList',
            url:'/product/getProductList',
            method: 'post', //默认：get请求
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
                ,{field:'id', title:'id',align:'center'}
                ,{field:'name', title:'name',align:'center'}
                ,{field:'price', title:'price',align:'center'}
                ,{field:'createDate', title: 'createDate',align:'center'}
                ,{title:'operation',align:'center', toolbar:'#optBar'}
            ]],
            done: function(res, curr, count){
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                //console.log(res);
                //得到当前页码
                console.log(curr);
                $("[data-field='productStatus']").children().each(function(){
                    if($(this).text()=='1'){
                        $(this).text("enable")
                    }else if($(this).text()=='0'){
                        $(this).text("disable")
                    }
                });
                //得到数据总量
                //console.log(count);
                pageCurr=curr;
            }
        });

        //监听工具条
        table.on('tool(productTable)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                //删除
                delProduct(data,data.id,data.sysProductName);
            } else if(obj.event === 'edit'){
                //编辑
                openProduct(data,"edit");
            }else if(obj.event === 'recover'){
                //恢复
                recoverProduct(data,data.id);
            }
        });

        //监听提交
        form.on('submit(productSubmit)', function(data){
            // TODO 校验
            formSubmit(data);
            return false;
        });
    });

    //列表导出
    $("#productExport").on('click',function () {
        var name=$("#productName").val();
        var startTime=$("#startTime").val();
        var endTime = $("#endTime").val();
        // if(startTime == "" || endTime == ""){
        //     layer.msg("开始时间和结束时间不能为空");
        //     return false;
        // }
        window.location.href='../../product/productExport?name='+name+'&startTime='+startTime+'&endTime='+endTime;
    })

    //搜索框
    layui.use(['form','laydate'], function(){
        var form = layui.form ,layer = layui.layer
            ,laydate = layui.laydate;
        //日期
        laydate.render({
            elem: '#startTime'
        });
        laydate.render({
            elem: '#endTime'
        });
        //TODO 数据校验
        //监听搜索框
        form.on('submit(searchSubmit)', function(data){
            //重新加载table
            load(data);
            return false;
        });
    });
});

//提交表单
function formSubmit(obj){
    $.ajax({
        type: "POST",
        data: $("#productForm").serialize(),
        url: "/product/setProduct",
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
            layer.alert("Operation failure, pls try again later",function(){
                layer.closeAll();
                //加载load方法
                load(obj);//自定义
            });
        }
    });
}

//开通用户
function addProduct(){
    openProduct(null,"open product");
}
function openProduct(data,title){
    var roleId = null;
    if(data==null || data==""){
        $("#id").val("");
    }else{
        $("#id").val(data.id);
        $("#productname").val(data.sysProductName);
        $("#mobile").val(data.productPhone);
        roleId = data.roleId;
    }
    var pageNum = $(".layui-laypage-skip").find("input").val();
    $("#pageNum").val(pageNum);
    $.ajax({
        url:'/role/getRoles',
        dataType:'json',
        async: true,
        success:function(data){
            $.each(data,function(index,item){
                if(!roleId){
                    var option = new Option(item.roleName,item.id);
                }else {
                    var option = new Option(item.roleName,item.id);
                    // // 如果是之前的parentId则设置选中
                    if(item.id == roleId) {
                        option.setAttribute("selected",'true');
                    }
                }
                $('#roleId').append(option);//往下拉菜单里添加元素
                form.render('select'); //这个很重要
            })
        }
    });

    layer.open({
        type:1,
        title: title,
        fixed:false,
        resize :false,
        shadeClose: true,
        area: ['550px'],
        content:$('#setProduct'),
        end:function(){
            cleanProduct();
        }
    });
}

function delProduct(obj,id,name) {
    var currentProduct=$("#currentProduct").html();
    if(null!=id){
        if(currentProduct==id){
            layer.alert("Sorry， you can't del your owner！");
        }else{
            layer.confirm('Are you sure to del'+name+'product？', {
                btn: ['confirm','return'] //按钮
            }, function(){
                $.post("/product/updateProductStatus",{"id":id,"status":0},function(data){
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
}
//恢复
function recoverProduct(obj,id) {
    if(null!=id){
        layer.confirm('Are you sure you  to recover it?', {
            btn: ['confirm','return']  //按钮
        }, function(){
            $.post("/product/updateProductStatus",{"id":id,"status":1},function(data){
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

function load(obj){
    //重新加载table
    tableIns.reload({
        where: obj.field
        , page: {
            curr: pageCurr //从当前页码开始
        }
    });
}

function cleanProduct(){
    $("#productname").val("");
    $("#mobile").val("");
    $("#password").val("");
    $('#roleId').html("");




    //判断时间差
    function DateDiff(sDate1, sDate2) {  //sDate1和sDate2是yyyy-MM-dd格式
        var aDate, oDate1, oDate2, iDays;
        aDate = sDate1.split("-");
        oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为yyyy-MM-dd格式
        aDate = sDate2.split("-");
        oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
        iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数
        return iDays;  //返回相差天数
    }
}
