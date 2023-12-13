package kr.co.kfs.assetedu.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
/**
 * 페이지 처리
 * 
 * @author KOREA
 *
 */
@Setter
@Getter
@ToString
public class PageAttr {
	
	//sql 문장에서 사용
	private Integer offset = 0;
	private Integer limit = 10;
	
	//페이징처리를 위한 변수들
	private Integer pageSize; 		// 화면에 표시될 item의 갯수
	private Integer startIndex; 	// 시작 index offset과 같음
	private Long totalItemCount; // 총 item의 갯수
	private Integer totalPageCount; // 총 page의 갯수
	private Integer currentPageNumber; // 현재 page number


	private Boolean isExistPrevPageNumber; //이전 페이지가 존재하는지 여부
	private Boolean isExistNextPageNumber; //다음 페이지가 존재하는지 여부
	private Integer startPageNumber; //하단에 보여줄 시작 페이지 번호
	private Integer endPageNumber; //하단에 보여줄 끝 페이지 번호
	private Integer pageNumberSize; //페이지 번호를 몇개 보여줄 지 	
	


	/**
	 * 생성자 
	 * @param totalItemCount 총갯수
	 * @param pageSize 한페이지에 보여줄 레코드 갯수
	 */
	public PageAttr(Long totalItemCount, Integer pageSize, Integer currentPageNumber) {
		this.totalItemCount = totalItemCount;
		this.limit = this.pageSize = pageSize;
		this.offset = this.startIndex = 0;
		
		this.currentPageNumber = currentPageNumber;
		this.pageNumberSize = 10;
		this.startPageNumber = 0;
		this.endPageNumber = 0;
		this.isExistPrevPageNumber = false;
		this.isExistNextPageNumber = false;
		calculate();
	}
	public PageAttr(Long totalItemCount, Integer pageSize) {
		this(totalItemCount, pageSize, 1);
	}
	public PageAttr(Long totalItemCount) {
		this(totalItemCount, 10);
	}

	public PageAttr() {
		this(0L, 10);
	}
	private void calculate(){
		
		if (pageSize == 0 || totalItemCount == 0) {
			totalPageCount = 0;
		} else {
			totalPageCount = (int) ((totalItemCount + pageSize - 1) / pageSize);
		}


		if (currentPageNumber < 1){
			this.currentPageNumber = 1;
		}
		else if (currentPageNumber > this.totalPageCount){
			this.currentPageNumber = this.totalPageCount;
		}
		
		this.offset = this.startIndex = (this.currentPageNumber - 1) * this.pageSize;
		if(offset < 0) {
			offset = startIndex = 0;
		}
		this.limit = this.pageSize;
		
		isExistPrevPageNumber = false;
		isExistNextPageNumber = false;

		int mok = currentPageNumber / pageNumberSize;
		int nameji = currentPageNumber % pageNumberSize;
		
		if(nameji == 0) {
			startPageNumber = (mok-1) *  pageNumberSize + 1;
		}else{
			if(mok == 0) startPageNumber = 1;
			else startPageNumber = (mok*pageNumberSize)+1;
		}
		if(startPageNumber < 1) startPageNumber = 0;
		if(startPageNumber > 1 ) isExistPrevPageNumber = true;
		
		endPageNumber = startPageNumber + pageNumberSize -1;
		if(totalPageCount <= endPageNumber){
			endPageNumber = totalPageCount;
			isExistNextPageNumber = false;
		}else{
			isExistNextPageNumber = true;
		}
		
	}

}
