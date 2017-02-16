package ir.interp;


/**
 * A Word that is a pointer to some dynamically allocated
 * array.
 */
public class Array extends Ptr {

    private Word[] words;
    private int wordSize;

    private class DisplacedPtr extends Ptr {

        private final int wordsOffset;

        public DisplacedPtr(int wordsOffset) {
            this.wordsOffset = wordsOffset;
        }

        @Override
        public Ptr add(int bytesOffset) {
            assert (bytesOffset % wordSize == 0);
            return new DisplacedPtr(this.wordsOffset + bytesOffset / wordSize);
        }

        @Override
        public Word get() {
            return words[wordsOffset];
        }

        @Override
        public void set(Word newValue) {
            words[wordsOffset] = newValue;
        }

        @Override
        public String toString() {
            StringBuilder result = new StringBuilder("#[");
            for (int i = 0; i < words.length; i++) {
                if (i > 0) result.append(", ");
                if (i == wordsOffset) result.append("-->");
                result.append(words[i].toString());
            }
            result.append("]");
            return result.toString();
        }

    }

    public Array(int numWords, int wordSize) {
        this.wordSize = wordSize;
        words = new Word[numWords];
        fill(UninitializedWord.the);
    }

    @Override
    public Word get() {
        return words[0];
    }

    @Override
    public void set(Word newValue) {
        words[0] = newValue;
    }

    @Override
    public Ptr add(int bytesOffset) {
        assert (bytesOffset % wordSize == 0);
        return new DisplacedPtr(bytesOffset / wordSize);
    }

    @Override
    public String toString() {
        StringBuilder result = new StringBuilder("#[");
        for (int i = 0; i < words.length; i++) {
            if (i > 0) result.append(", ");
            result.append("" + words[i]);
        }
        result.append("]");
        return result.toString();
    }

    @Override
    /**
     * Implements the EQ binop, but only if the other word is an int.  This is necessary for checking for NULL.
     */
    public boolean isEQ(Word r) {
        if (r.asInt() == 0) {
            return false;
        } else {
            throw new Error("EQ on " + this + " only works to compare to 0, not " + r);
        }
    }

    public void fill(Word with) {
        for (int i = 0; i < words.length; i++) {
            words[i] = with;
        }
    }
}
