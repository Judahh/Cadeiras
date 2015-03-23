import java.util.List;

public interface SIP {
	void addRamal(String ramal);

	void setValor(String ramal, String variavel, String valorDaVariavel);

	void deleteRamal(String ramal);

	String getRamal(String ramal);

	List<String> getRamais();
}