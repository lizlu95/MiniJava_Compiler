package codegen.patterns;

import java.util.HashMap;
import java.util.Map;

import util.DefaultIndentable;


/**
 * Whenever a wildcard pattern matches a particular node,
 * a map entry associating the wildcard to its value is
 * added to a map. This map is returned as the result of a
 * successful matching operation.
 */
public class Matched {

    private Map<Wildcard<?>, Object> map = new HashMap<Wildcard<?>, Object>();

    public <T> void put(Wildcard<T> pat, T matched) {
        assert (!map.containsKey(pat));
        map.put(pat, matched);
    }

    @SuppressWarnings("unchecked")
    public <T> T get(Pat<T> pat) {
        return (T) map.get(pat);
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        for (Wildcard<?> w : map.keySet()) {
            sb.append(w);
            sb.append("->");
            Object o = map.get(w);
            if (o instanceof DefaultIndentable) {
                sb.append(((DefaultIndentable) o).onOneLine());
            } else {
                sb.append(map.get(w));
            }
            sb.append(", ");
        }
        return sb.toString();
    }
}
