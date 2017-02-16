package x86_64sim;

public class Memory {
	long [] heap, stack;
	long minheap;
	public long maxheap;
	long minstack, maxstack;
	public static final int SIZEOF_LONG = 8;
	Memory(long minheap, long maxheap, long minstack, long maxstack) {
		this.minheap = minheap;
		this.maxheap = maxheap;
		this.heap = new long[(int) ((maxheap - minheap)/SIZEOF_LONG)];
		this.minstack = minstack;
		this.maxstack = maxstack;
		this.stack = new long[(int) ((maxstack - minstack)/SIZEOF_LONG)];
	}
	
	private boolean inHeap(long address) {
		return minheap <= address && address <= maxheap;
	}
	private boolean inStack(long address) {
		return minstack <= address && address <= maxstack;
	}
	public long read(long address) {
		if (address % SIZEOF_LONG != 0) { 
			throw new Error("Read at address " + address + " fails, bad alignment");
		}
		if (inHeap(address)) {
			int arrayindex = (int) ((address - minheap) / SIZEOF_LONG);
			return heap[arrayindex];
		} else if (inStack(address)) {
			int arrayindex = (int) ((address - minstack) / SIZEOF_LONG);
			return stack[arrayindex];			
		} else {
			throw new Error("Read at address " + address + " out of bounds");
		}
	}
	public void write(long address, long value) {
		if (address % SIZEOF_LONG != 0) { 
			throw new Error("Write at address " + address + " fails, bad alignment");
		}
		if (inHeap(address)) {
			int arrayindex = (int) ((address - minheap) / SIZEOF_LONG);
			heap[arrayindex] = value; 
		} else if (inStack(address)) {
			int arrayindex = (int) ((address - minstack) / SIZEOF_LONG);
			stack[arrayindex] = value; 			
		} else {
			throw new Error("Write at address " + address + " out of bounds");
		}
	}
}
