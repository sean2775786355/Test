//先把active标示的menu用el表达式取出放在body上面 js取出来为含有这个标示 的class添加active
$(function(){
    var data = $('#main-header').attr("data-active");
    if(data != "") {
        $("." + data).addClass("active");
    }
});