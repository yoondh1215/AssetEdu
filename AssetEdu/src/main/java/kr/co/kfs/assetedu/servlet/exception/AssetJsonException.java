package kr.co.kfs.assetedu.servlet.exception;

/**
 * 
 * AssetEDU에서 발생하는 Exception으로 결과를 Json형태로 보낸다.
 * 
 * @author Kim Do Young
 *
 */
public class AssetJsonException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	public AssetJsonException() {
		super();
	}
	public AssetJsonException(String message) {
		super(message);
	}
	
}
