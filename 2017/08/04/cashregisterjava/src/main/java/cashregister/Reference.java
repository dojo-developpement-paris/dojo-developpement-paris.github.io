package cashregister;

public class Reference {
    private final String code;
    private final Price price;

    public Reference(String code, Price price) {
        this.code = code;
        this.price = price;
    }

    public String getCode() {
        return code;
    }

    public Price getPrice() {
        return price;
    }
}
