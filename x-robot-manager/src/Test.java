public class Test {

	public void squre() {
		int num1 = 10;
		int num2 = 10;
		for (int i = 0; i < num1; i++) {
			for (int j = 0; j < num2; j++) {
				if (i != 0 && i != num1 - 1 && j != 0 && j != num2 - 1) {
					System.out.print("\t");
				} else {
					System.out.print("*\t");
				}
			}
			System.out.println();
		}
	}

	public static void main(String[] args) {
		Test t = new Test();
		t.squre();
	}
	
}
