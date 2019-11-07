/*
 * author:传智专修学院-刘悦
 * */
//获取鼠标坐标（非火狐）
function getMousePos(event) {
      var e = event || window.event;
      return {'x':e.screenX,'y':screenY}
}
//获取元素坐标（x）
function getElementLeft(element){
　　　var actualLeft = element.offsetLeft;
　　　var current = element.offsetParent;
　　　while (current !== null){
　　　　　actualLeft += current.offsetLeft;
　　　　　current = current.offsetParent;
　　　}
　　　return actualLeft;
}
//获取元素坐标（y）
function getElementTop(element){
　　　var actualTop = element.offsetTop;
　　　var current = element.offsetParent;
　　　while (current !== null){
　　　　　actualTop += current.offsetTop;
　　　　　current = current.offsetParent;
　　　}
　　　return actualTop;
}


//模拟关键字数据
var words = [
	{pid:"p001",word:"服装",pinyin:"fuzhuang"},
	{pid:"p002",word:"男装",pinyin:"nanzhuang"},
	{pid:"p003",word:"女装",pinyin:"nvzhuang"},
	{pid:"p004",word:"电脑",pinyin:"diannao"},
	{pid:"p005",word:"奢侈品",pinyin:"shechipin"}
];
/*关键字列表查询*/
function searchWords(n){
	if(n.value!=""){
		//模拟从服务器查询到数据
		var arr = $(words);
		//初始化
		$("#itemul").html("");
		arr.each(function(){
			var str = "<li class='list-group-item'><a href='#'>"+this.word+"["+this.pinyin+"]"+"</a></li>";
			$("#itemul").append(str);
		});
		if(arr.size()>0){
			//展示
			$("#completeShow").slideDown(500);
		}
	}else{
		//隐藏
		$("#completeShow").slideUp(500);
		$("#itemul").html("");
	}
	
}
/*展示关键字列表*/
function showWordsList(){
	var arr = $("#itemul>li");
	if(arr.size()>0){
		//有数据就展示
		$("#completeShow").slideDown(500);
	}
}
/*隐藏关键字列表*/
function hideWordsList(){
	$("#completeShow").slideUp(500);
}
/*清除关键字*/
function itemulClose(){
	$("#wordsSearch").val("");
	hideWordsList();
	$("#itemul").html("");
}
/*购物时数量增减*/
function cartCountNum(str){
	var n = $("#count");
	if(isNaN(n.val()) || n.val()<1){
		n.val("1");
		return;
	}
	if(str=="-"){
		n.val(parseInt(n.val())-1);
	}else{
		n.val(parseInt(n.val())+1);
	}
}
