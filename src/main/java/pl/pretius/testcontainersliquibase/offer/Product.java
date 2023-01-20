package pl.pretius.testcontainersliquibase.offer;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@AllArgsConstructor
@Getter

@Setter
@NoArgsConstructor
class Product {
    private Long id;
    private Long offerId;
    private String productName;
    private BigDecimal productPrice;
}
