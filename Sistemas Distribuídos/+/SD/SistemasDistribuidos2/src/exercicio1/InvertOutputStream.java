package exercicio1;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;


public class InvertOutputStream extends OutputStream{

	@Override
	public void write(int b) throws IOException {}

	public void write(byte[] data) {
		byte[] temp = inverterByte(data);
		try {
			String s = new String (temp, "UTF-8");
			System.out.println("Print via método write(data)");
			System.out.println(s);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
	}
	public void write(byte[] data, int offset, int length) {
		byte [] temp = new byte[length-offset];
		for (int i = offset; i < length; i++) {
			temp[i] = data[i];
		}
		temp = inverterByte(temp);
		try {
			String s = new String (temp, "UTF-8");
			System.out.println("Print via método write(data, offset, length)");
			System.out.println(s);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
	}
	
	private byte[] inverterByte(byte[] data){
		byte [] temp = new byte[data.length];
		int count =0;
		for (int d = data.length-1;  d>=0; d--) {
			temp[count]=data[d];
			count++;
		}
		return temp;
	}
}	
