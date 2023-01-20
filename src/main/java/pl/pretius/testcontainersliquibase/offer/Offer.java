package pl.pretius.testcontainersliquibase.offer;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@Getter
@AllArgsConstructor

@Setter
@NoArgsConstructor
class Offer {
    private Long id;
    private String offerName;
    private List<Product> products;

    BigDecimal countTotalPrice() {
        if (products == null) {
            return BigDecimal.ZERO;
        }
        return products.stream().map(Product::getProductPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }
}
