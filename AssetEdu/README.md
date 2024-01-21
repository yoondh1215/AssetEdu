# AssetEdu

## 개요

AssetEdu는 자산운용을 교육하기 위한 프로젝트입니다.


## 구성요소들

- springboot
- jsp/jstl
- mybatis
- postgresql

## History 

## 2022-10-26

- admin/1111 하드코딩함

## 키 조작
### fund list 
1. 화면뜨면서 검색란에 포커스
2. 검색란에서 enter -> 검색수행
3. 검색란에서 DEL키 ->검색란을 빈공간으로 만듬
```javascript
	//화면뜨면 검색창에 포커스 
	$("#searchText").focus();
	
	//검색창에서 enter이면 조회
	$("#searchText").on("keyup",function(key){
        if(key.keyCode==13) { //enter
        	$('.btnRetrieve').trigger('click');
        }else if(key.keyCode == 46){ //DEL
        	$(this).val('');
        }
	});
```

### fund insert
1. form안의 input에 대해서 enter를 쳐도 아무 반응없게 만듬
```javascript
	//form 안의 inputdp Enter key submit방지
	$('form input').on('keydown', function(e){
		if(e.keyCode == 13){
			e.preventDefault();
		}
	})
``` 	


## validation 추가하는 방법

1. Model에 validation 넣기
2. controller에 @Valid와 @BindingResult넣기
3. jsp에 <kfs:DisplayErrors/> 태그 넣기.
4. controller에서 1.Model 에서 걸러내지 못한 error를 추가한다.

### 참조 1

- 

```java
    @NumberFormat(pattern = "#,###")
    @Min(value=100, message="수량은 100 이상이어야합니다. 테스팅....")
    private Long    opr01Qty;           //수량

    @NumberFormat(pattern = "#,###")
    @Min(value=100, message="단가는 100 이상이어야합니다. 테스팅....")
    private Long    opr01Price;      
```

```
참고)
@Null  // null만 혀용합니다.
@NotNull  // null을 허용하지 않습니다. "", " "는 허용합니다.
@NotEmpty  // null, ""을 허용하지 않습니다. " "는 허용합니다.
@NotBlank  // null, "", " " 모두 허용하지 않습니다.

@Email  // 이메일 형식을 검사합니다. 다만 ""의 경우를 통과 시킵니다
 @Pattern(regexp="^[a-zA-Z0-9]{3}",message="length must be 3")    // 정규식을 검사할 때 사용됩니다.
@Size(min=, max=)  // 길이를 제한할 때 사용됩니다.

@Max(value = )  // value 이하의 값을 받을 때 사용됩니다.
@Min(value = )  // value 이상의 값을 받을 때 사용됩니다.

@Positive  // 값을 양수로 제한합니다.
@PositiveOrZero  // 값을 양수와 0만 가능하도록 제한합니다.

@Negative  // 값을 음수로 제한합니다.
@NegativeOrZero  // 값을 음수와 0만 가능하도록 제한합니다.

@Future  // 현재보다 미래
@Past  // 현재보다 과거

@AssertFalse  // false 여부, null은 체크하지 않습니다.
@AssertTrue  // true 여부, null은 체크하지 않습니다.
```

### 참조 2

```java
@PostMapping("buy_insert")
public String buyInsert(@Valid @ModelAttribute("cont") Opr01Cont cont, BindingResult bindingResult, RedirectAttributes redirectAttr, Model model) throws UnsupportedEncodingException {
    log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
    log.debug("주식매수처리");
    log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
```
### 참조 3

- jsp에서 kfs:DisplayErrors 태그를 넣는다.
```jsp
<kfs:DisplayErrors modelAttribute="cont"/>
<form:form action="/opr/buy_insert" method="POST" modelAttribute="cont" class="validcheck">
```

### 참조 4

- model에서 걸러내지 못한 error처리
- bindingResult.addError(new FieldError("", "", resultMsg));

```java
		String msg;
		String resultMsg = contService.buyInsert(cont);
		log.debug("주식매수 원장생성 결과: {}",resultMsg);
		
		if("Y".equals(resultMsg)) {
			msg = String.format("\"%s %s주\" 매수처리가 완료되었습니다.", cont.getOpr01ItemNm(), cont.getOpr01Qty());
		} else {
			model.addAttribute("trCdList", codeService.trList("BUY"));			
    		bindingResult.addError(new FieldError("", "", resultMsg));			
			return "/opr/buy_insert_form";
		}
```

