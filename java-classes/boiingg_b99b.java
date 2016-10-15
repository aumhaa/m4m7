/* boiingg_b99b - Decompiled by JODE
 * Visit http://jode.sourceforge.net/
 */
import com.cycling74.max.Atom;
import com.cycling74.max.MaxObject;

public class boiingg_b99b extends MaxObject
{
    public int[][] arColumns = new int[16][4];
    public int nColumns = 16;
    public int nRows = 8;
    public int[] arNoteVals
	= { 60, 62, 64, 65, 67, 69, 71, 72, 74, 76, 77, 79, 81, 83, 84, 86 };
    public double[] arVelocities = { 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0,
				     1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0 };
    public int[] arDurations
	= { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 };
    public double nBase = 60.0;
    public double nBPM = 120.0;
    public int nMode = 0;
    public int[] dump_out = new int[66];
    private static final String[] INLET_ASSIST = { "commands" };
    private static final String[] OUTLET_ASSIST
	= { "grid output", "midi output", "dump_output" };
    
    public boiingg_b99b(Atom[] atoms) {
	declareInlets(new int[] { 15 });
	declareOutlets(new int[] { 15, 15, 15 });
	setInletAssist(INLET_ASSIST);
	setOutletAssist(OUTLET_ASSIST);
	createInfoOutlet(false);
    }
    
    public void bang() {
	/* empty */
    }
    
    public void inlet(int i) {
	/* empty */
    }
    
    public void inlet(float f) {
	/* empty */
    }
    
    public void list(Atom[] atoms) {
	/* empty */
    }
    
    public void fnNoteVals(int[] is) {
	for (int i = 0; i < is.length; i++)
	    arNoteVals[i] = is[i];
    }
    
    public void fnVelocities(float[] fs) {
	for (int i = 0; i < fs.length; i++)
	    arVelocities[i] = (double) fs[i];
    }
    
    public void fnDurations(int[] is) {
	for (int i = 0; i < is.length; i++)
	    arDurations[i] = is[i];
    }
    
    public void fnSetup(int i) {
	fnMonomeType(i);
	for (int i_0_ = 0; i_0_ < nColumns; i_0_++) {
	    arColumns[i_0_][0] = 0;
	    arColumns[i_0_][1] = 1;
	    arColumns[i_0_][2] = 0;
	    arColumns[i_0_][3] = 0;
	}
	fnClear();
    }
    
    public void restore(int[] is) {
	for (int i = 0; i < 16; i++) {
	    arColumns[i][0] = is[i];
	    arColumns[i][1] = is[i + 16];
	    arColumns[i][2] = is[i + 32];
	    arColumns[i][3] = is[i + 48];
	    nColumns = is[64];
	    nRows = is[65];
	}
    }
    
    public void fnClear() {
	for (int i = 0; i < nColumns; i++) {
	    arColumns[i][0] = 0;
	    arColumns[i][1] = 1;
	    arColumns[i][2] = 0;
	    arColumns[i][3] = 0;
	    for (int i_1_ = 0; i_1_ < nRows; i_1_++)
		outlet(0, new Atom[] { Atom.newAtom(i), Atom.newAtom(i_1_),
				       Atom.newAtom((int) 0) });
	}
    }
    
    public void fnUpdate() {
	for (int i = 0; i < nColumns; i++) {
	    if (arColumns[i][0] > 0 && arColumns[i][3] < nRows
		&& arColumns[i][3] >= 0) {
		outlet(0, new Atom[] { Atom.newAtom(i),
				       Atom.newAtom(arColumns[i][3]),
				       Atom.newAtom((int) 0) });
		if (arColumns[i][1] == 0)
		    arColumns[i][3]++;
		else
		    arColumns[i][3]--;
		outlet(0, new Atom[] { Atom.newAtom(i),
				       Atom.newAtom(arColumns[i][3]),
				       Atom.newAtom((int) 1) });
		if (arColumns[i][3] == nRows - 1) {
		    arColumns[i][1] = 1;
		    int i_2_ = arNoteVals[i];
		    double d = arVelocities[i] * 128.0;
		    double d_3_
			= 240.0 / nBPM / (double) arDurations[i] * 1000.0;
		    outlet(1, new Atom[] { Atom.newAtom(i_2_), Atom.newAtom(d),
					   Atom.newAtom(d_3_) });
		}
		if (arColumns[i][3] == arColumns[i][2])
		    arColumns[i][1] = 0;
	    }
	}
    }
    
    public void fnButton(int i, int i_4_, int i_5_) {
	if (i < nColumns && i_4_ < nRows && i_5_ > 0) {
	    int i_6_ = i_4_;
	    int i_7_ = i;
	    int i_8_ = i_5_;
	    if (i_6_ == nRows - 1) {
		arColumns[i_7_][0] = 0;
		arColumns[i_7_][1] = 1;
		arColumns[i_7_][2] = 0;
		arColumns[i_7_][3] = 0;
		outlet(0, new Atom[] { Atom.newAtom(i_7_),
				       Atom.newAtom(arColumns[i_7_][3]),
				       Atom.newAtom((int) 0) });
	    } else {
		outlet(0, new Atom[] { Atom.newAtom(i_7_),
				       Atom.newAtom(arColumns[i_7_][3]),
				       Atom.newAtom((int) 0) });
		outlet(0, new Atom[] { Atom.newAtom(i_7_), Atom.newAtom(i_6_),
				       Atom.newAtom((int) 0) });
		arColumns[i_7_][0] = 1;
		arColumns[i_7_][2] = i_6_;
		if (nMode > 0) {
		    arColumns[i_7_][3] = nRows - 1;
		    arColumns[i_7_][1] = 1;
		    outlet(0, new Atom[] { Atom.newAtom(i_7_),
					   Atom.newAtom(nRows - 1),
					   Atom.newAtom((int) 1) });
		    int i_9_ = arNoteVals[i_7_];
		    double d = arVelocities[i_7_] * 128.0;
		    double d_10_
			= 240.0 / nBPM / (double) arDurations[i_7_] * 1000.0;
		    outlet(1, new Atom[] { Atom.newAtom(i_9_), Atom.newAtom(d),
					   Atom.newAtom(d_10_) });
		} else {
		    arColumns[i_7_][3] = i_6_;
		    arColumns[i_7_][1] = 0;
		    outlet(0,
			   new Atom[] { Atom.newAtom(i_7_), Atom.newAtom(i_6_),
					Atom.newAtom((int) 1) });
		}
	    }
	    dump();
	}
    }
    
    public void fnMonomeType(int i) {
	int i_11_ = i;
	switch (i_11_) {
	case 1:
	    nColumns = 8;
	    nRows = 8;
	    break;
	case 2:
	    nColumns = 16;
	    nRows = 16;
	    break;
	case 3:
	    nColumns = 16;
	    nRows = 8;
	    break;
	case 4:
	    nColumns = 8;
	    nRows = 16;
	    break;
	}
    }
    
    public void fnMode(int i) {
	nMode = i;
    }
    
    public void fnBPM(double d) {
	nBPM = d;
    }
    
    public void dump() {
	for (int i = 0; i < 16; i++) {
	    dump_out[i] = arColumns[i][0];
	    dump_out[i + 16] = arColumns[i][1];
	    dump_out[i + 32] = arColumns[i][2];
	    dump_out[i + 48] = arColumns[i][3];
	}
	dump_out[64] = nColumns;
	dump_out[65] = nRows;
	outlet(2, dump_out);
    }
}
