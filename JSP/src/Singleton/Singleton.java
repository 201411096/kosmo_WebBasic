package Singleton;

public class Singleton {
	  private volatile static Singleton inst;
	  private Singleton() { }
	  public static Singleton getInstance() {
	    if (inst == null) {
	      synchronized (Singleton.class) {
	        if (inst == null) {
	          inst = new Singleton();
	        }
	      }
	    }
	    return inst;
	  }
	  // 나머지 멤버 함수 코드
	}
