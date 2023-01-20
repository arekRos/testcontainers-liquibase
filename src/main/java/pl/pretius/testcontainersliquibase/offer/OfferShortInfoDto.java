package pl.pretius.testcontainersliquibase.offer;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@AllArgsConstructor
@ToString
public class OfferShortInfoDto {
    private String offerName;
    private BigDecimal totalPrice;
}
