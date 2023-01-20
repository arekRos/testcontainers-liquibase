package pl.pretius.testcontainersliquibase.offer;

import org.junit.ClassRule;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import pl.pretius.testcontainersliquibase.PostgreSQLContainer;

import java.math.BigDecimal;

@SpringBootTest
class OfferFacadeTest {

    @ClassRule
    public static PostgreSQLContainer postgreSQLContainer = PostgreSQLContainer.getInstance();

    @Autowired
    private OfferFacade offerFacade;

    @Test
    @Order(1)
    void shouldCreateAndSaveOffer() {
        //when
        OfferShortInfoDto offer
                = offerFacade.createOffer("OfferName", "ProductName", BigDecimal.valueOf(123.12));
        //then
        Assertions.assertEquals("OfferName", offer.getOfferName());
        Assertions.assertEquals(BigDecimal.valueOf(123.12), offer.getTotalPrice());
    }

    @Test
    @Order(2)
    void shouldFindAndMapOfferToDto() {
        //when
        OfferShortInfoDto offer = offerFacade.findOfferByOfferName("OfferName");
        //then
        Assertions.assertEquals("OfferName", offer.getOfferName());
        Assertions.assertEquals(BigDecimal.valueOf(123.12), offer.getTotalPrice());
    }


}