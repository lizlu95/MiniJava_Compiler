package analysis.implementation;

import ir.frame.Access;
import ir.frame.Frame;
import ir.temp.Color;
import ir.tree.IRExp;

/**
 * A class to create Color objects used to paint spilled Temps.
 * <p>
 * This allows us to reuse a spill-slot in the frame to paint
 * multiple Temps (if the Temps do not interfere with one
 * another).
 * 
 * @author kdvolder
 */
public class SpillColor extends Color {
	
	private IRExp location;
	Access access;
	
	/**
	 * Allocate space for a new Spill location in the Frame and
	 * a matching color object we can use to paint
	 * Temps with.
	 * 
	 * @param frame
	 */
	public SpillColor(Frame frame) {
		access = frame.allocLocal(true);
		location = access.exp(frame.FP());
	}

	@Override
	public String toString() {
		return access.toString();
	}
	
	@Override
	public boolean isRegister() {
		return false;
	}
	
	public IRExp getLocation() {
		return location;
	}
}
