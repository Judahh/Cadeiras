public class Matrix {
	private int M[][];
	private int Child0[][];
	private int Child1[][];
	private int Child2[][];
	private int size;
	
	public Matrix(int size){
		this.size=size;
		M=new int[size][size];
	}
	
	public int[][] getEnd(){
		int End[][]=new int[size][size];
		int T=1;
		for(int i=0;i<size;i++ ){
			for(int j=0;j<size;j++ ){
				End[i][j]=T;
				T++;
			}
		}
		End[0][0]=0;
		return End;
	}
	
	public int[][] getMatrix(){
		return M;
	}
	
	public int[][] getChild(int i){
		switch(i){
			case 0:
				return Child0;
			
			case 1:
				return Child1;
			
			case 2:
				return Child2;
		}
		return null;
	}
	
	public int getSize(){
		return size;
	}
	
	public int[] getZero(){
		int zero[]=new int[2];
		for(int i=0;i<size;i++ ){
			for(int j=0;j<size;j++ ){
				if(M[i][j]==0){
					zero[0]=i;
					zero[1]=j;
					return zero;
				}
			}
		}
		return null;
		
	}
	
	public void setMatrix(int[][] M){
		this.M=M;
	}
	
	public void setElement(int i,int j,int e){
		this.M[i][j]=e;
	}
	
	public int Move(){
		int Ma[][]=getMatrix();
		int zero[]=getZero();
		int i=zero[0];
		int j=zero[1];
		//up
			if(i>0){
				Ma[i][j]=Ma[i-1][j];
				Ma[i-1][j]=0;
				Child0=Ma;
				return 0;//up com sucesso
			}

		//down
			if(i<size){
				Ma[i][j]=Ma[i+1][j];
				Ma[i+1][j]=0;
				if(getChild(0)==null && Ma!=M){
					Child0=Ma;
				}else{
					Child1=Ma;
				}
				return 1;//down com sucesso
			}

		//right
			if(j>0){
				Ma[i][j]=Ma[i][j-1];
				Ma[i][j-1]=0;
				for(int z=0;z<3;z++){
					if(getChild(z)==null && Ma!=M){
						if(z==0){
							Child0=Ma;
						}
						if(z==1){
							Child1=Ma;
						}
						if(z==2){
							Child2=Ma;
						}
					}
				}
				return 2;//right com sucesso
			}

		//left
			if(j<size){
				Ma[i][j]=Ma[i][j+1];
				Ma[i][j+1]=0;
				for(int z=0;z<3;z++){
					if(getChild(z)==null && Ma!=M){
						if(z==0){
							Child0=Ma;
						}
						if(z==1){
							Child1=Ma;
						}
						if(z==2){
							Child2=Ma;
						}
					}
				}
				return 1;//down com sucesso
			}
		if(Ma==getEnd()){
			return -1;//fim
		}
		return -100;//erro
	}
}