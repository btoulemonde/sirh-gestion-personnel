package dev.sgp.entite;

public class VisiteWeb {
	
	private int id;
	private String chemin;
	private int tempsExecution;
	
	
	
	
	/**
	 * @param chemin
	 * @param tempsExecution
	 */
	public VisiteWeb( String chemin, int tempsExecution) {
		super();
		this.chemin = chemin;
		this.tempsExecution = tempsExecution;
	}
	/** Getter
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/** Setter
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/** Getter
	 * @return the chemin
	 */
	public String getChemin() {
		return chemin;
	}
	/** Setter
	 * @param chemin the chemin to set
	 */
	public void setChemin(String chemin) {
		this.chemin = chemin;
	}
	/** Getter
	 * @return the tempsExecution
	 */
	public int getTempsExecution() {
		return tempsExecution;
	}
	/** Setter
	 * @param tempsExecution the tempsExecution to set
	 */
	public void setTempsExecution(int tempsExecution) {
		this.tempsExecution = tempsExecution;
	}

}
