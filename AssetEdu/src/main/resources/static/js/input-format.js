// -------------------------------------------
// jquery plugin 입력시 자동으로 포맷을 맞춤
// -------------------------------------------
// 숫자만을 입력받는다. 
// $("input.numberonly").inputNumberFormat();    
// <input type="text" class="numberonly" />

//
// 숫자만을 입력받는다. 날짜형식으로 '-'를 자동으로 넣어준다
// $("input.dateinput").inputDateFormat();    
// <input type="text" class="dateinput" />
//
//
// 숫자만을 입력받는다. 금액표시용으로 자동으로 콤마를 넣어준다.
// $("input.moneyinput").inputMoneyFormat(); 
// <input type="text" class="moneyinput" />
//
// 사업자번호를 입력받는다. 사업자번호 형태로 대쉬를 넣어준다.
// $("input.bzno-input").inputBznoFormat(); 
// <input type="text" class="bzno-input" />
//
/*** jquery 
<script>
    $(document).ready(function () {
        $('input.number-input').inputNumberFormat();
        $('input.money-input').inputMoneyFormat();
        $('input.date-input').inputDateFormat();
    });
</script>
*****/
;(function( $ ){
    'use strict'
	$.fn.inputNumberFormat = function(){
		return this.each(function()
		{
			var $this = $(this);
			$this.css("ime-mode", "disabled");
			$(this).keydown(function(e)
			{
				console.log(e.keyCode);
				if(e.KeyCode >= 229){ 
					window.event.returnValue = false;
					disabledEventPropagation(e);
					return;
				}
				if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
					 // Ctrl+A, Command+A
					(e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
					// Ctrl+V, Comand + V
					(e.keyCode == 86 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
					 // home, end, left, right, down, up
					(e.keyCode >= 35 && e.keyCode <= 40)) {
						 return;
				}
				if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
					e.preventDefault();
				}
			}).keyup(function(e){
				$this.val($this.val().replace(/\D/g,''));
				$this.val($this.val().replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g,''));
			})
		});
	}
    function disabledEventPropagation(e) {
        if (e) {
            if (e.stopPropagation) {
                e.stopPropagation();
            } else if (window.event) {
                window.event.cancelBubble = true;
            }
        }
    }
    $.fn.inputDateFormat = function(){
		var INSERT=45, DEL =46, BACK_SPACE = 8, TAB =9, ESC=27, ENTER = 13, NUM_LOCK = 110;
		var NUM_0 = 48, NUM_9 = 57, NUM_PAD_0 = 96, NUM_PAD_9 = 105;
		var PAGE_UP = 33, PAGE_DOWN=34, END = 35, HOME=36, ARROW_LEFT = 37, ARROW_UP = 38, ARROW_RIGHT=39, ARROW_DOWN=40;
		function isNumKey(keyCode){return (keyCode >= NUM_0 && keyCode <= NUM_9) || (keyCode >= NUM_PAD_0 && keyCode <= NUM_PAD_9)}
        
        return this.each(function(idx, el){
			var $this = $(this);
			$(this).keydown(function(e)
			{
				//console.log(e.keyCode);
				if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
					 // Ctrl+A, Command+A
					(e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
					 // home, end, left, right, down, up
					(e.keyCode >= 35 && e.keyCode <= 40)) {
						 return;
				}
				if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
					e.preventDefault();
				}
			}).keyup(function(e){
				$this.val($this.val().replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g,''));
				//console.log('ku:code :' + e.keyCode);
				if((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105)){
					var v = $this.val().replace(/\D/gi,'');
					//console.log(v);
					if(v.length < 4){
						;
					}else if(v.length >=4 &&  v.length < 7){
						$this.val(v.substring(0,4)+'-'+v.substring(4));
					}else {
						var d = v.substring(0,4)+'-'+v.substring(4,6)+'-' + v.substring(6,8);
						$this.val(d);
						if(d.length==10 && new Date(d) == 'Invalid Date'){
							alert(d + ' 는 올바른 날짜가 아닙니다');
						}
					}
				}else if(e.keyCode == INSERT){
					if($this.datepicker) { $this.datepicker(); $this.trigger('click'); $this.focus();}

				}else if(e.keyCode == HOME){
					var today = new Date(), y = today.getFullYear(), m=today.getMonth()+1, d = today.getDate(),
					m = (m+'').length < 2 ? '0'+m : m,d=(d+'').length < 2? '0'+d :d;
					$this.val(y+'-'+m+'-'+d);
				}
			});

            return $this;
        });
    }
	
	$.fn.inputMoneyFormat = function(){
		var DEL =46, BACK_SPACE = 8, TAB =9, ESC=27, ENTER = 13, NUM_LOCK = 110;
		var NUM_0 = 48, NUM_9 = 57, NUM_PAD_0 = 96, NUM_PAD_9 = 105;
		var PAGE_UP = 33, PAGE_DOWN=34, END = 35, HOME=36, ARROW_LEFT = 37, ARROW_UP = 38, ARROW_RIGHT=39, ARROW_DOWN=40;
		function isNumKey(keyCode){return (keyCode >= NUM_0 && keyCode <= NUM_9) || (keyCode >= NUM_PAD_0 && keyCode <= NUM_PAD_9)}

		return this.each(function()
		{
			var $this = $(this);
			$(this).keydown(function(e)
			{
				console.log('keydown code:' + e.keyCode);
				//키 본연의 default 동작허용
				if ($.inArray(e.keyCode, [DEL, BACK_SPACE, TAB, ESC, ENTER, NUM_LOCK]) !== -1 ||
					 // Ctrl+A, Command+A
					(e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
					 // home, end, left, right, down, up
					(e.keyCode >= PAGE_UP && e.keyCode <= ARROW_DOWN)) {
						 return;
				}
				//기타 키값들은 무시한다.
				if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
					e.preventDefault();
				}
			}).keyup(function(e){
				console.log('keyup code:' + e.keyCode);
				if(isNumKey(e.keyCode) || e.keyCode == BACK_SPACE || e.keyCode == DEL){
					var x = $this.val().replace(/\D/gi,'').replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$this.val(x);
				}
				$this.val($this.val().replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g,''));
			});
		});
	}

	$.fn.inputBznoFormat = function(){
		var INSERT=45, DEL =46, BACK_SPACE = 8, TAB =9, ESC=27, ENTER = 13, NUM_LOCK = 110;
		var NUM_0 = 48, NUM_9 = 57, NUM_PAD_0 = 96, NUM_PAD_9 = 105;
		var PAGE_UP = 33, PAGE_DOWN=34, END = 35, HOME=36, ARROW_LEFT = 37, ARROW_UP = 38, ARROW_RIGHT=39, ARROW_DOWN=40;
		function isNumKey(keyCode){return (keyCode >= NUM_0 && keyCode <= NUM_9) || (keyCode >= NUM_PAD_0 && keyCode <= NUM_PAD_9)}
        
        return this.each(function(idx, el){
			var $this = $(this);
			$(this).keydown(function(e)
			{
				//console.log(e.keyCode);
				if ($.inArray(e.keyCode, [DEL, BACK_SPACE, TAB, ESC, ENTER, NUM_LOCK, 190]) !== -1 ||
					 // Ctrl+A, Command+A
					(e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
					 // home, end, left, right, down, up
					(e.keyCode >= END && e.keyCode <= ARROW_DOWN)) {
						 return;
				}
				if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
					e.preventDefault();
				}
			}).keyup(function(e){
				//$this.val($this.val().replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g,''));
				//console.log('ku:code :' + e.keyCode);
				if((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105)){
					var v = $this.val().replace(/\D/gi,'');
					if(v.length > 10 ) {v = v.substring(0,10)}
					// console.log(v);
					if(v.length < 3){
						;
					}else if(v.length >=4 &&  v.length < 6){
						$this.val(v.substring(0,3)+'-'+v.substring(3));
					}else if(v.length >=6 ){
						$this.val(v.substring(0,3)+'-'+v.substring(3,5)+'-'+v.substring(5));
					}else if(v.length > 10){
						// debugger;
						$this.val(v.substring(0,10));
					}
				}
			});

            return $this;
        });
	}

})( jQuery );  
