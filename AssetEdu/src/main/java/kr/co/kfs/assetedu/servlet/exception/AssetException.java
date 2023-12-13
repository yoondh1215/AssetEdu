package kr.co.kfs.assetedu.servlet.exception;

/**
 * 
 * AssetEDU에서 발생하는 Exception
 * 
 * @author Kim Do Young
 *
 */
public class AssetException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	public AssetException() {
		super();
	}
	public AssetException(String message) {
		super(message);
	}
	
}
