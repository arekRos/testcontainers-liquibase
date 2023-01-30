package pl.pretius.testcontainersliquibase.offer;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import pl.pretius.testcontainersliquibase.CustomPostgreSQLContainer;

import java.math.BigDecimal;

@SpringBootTest
class OfferFacadeTest extends CustomPostgreSQLContainer {

    @Autowired
    private OfferFacade offerFacade;

    @Test
    @Order(1)
    void shouldCreateAndSaveOffer() {
        //when
        OfferShortInfoDto offer
                = offerFacade.createOffer("TestOfferName", "TestProductName", BigDecimal.valueOf(123.12));
        //then
        Assertions.assertEquals("TestOfferName", offer.getOfferName());
        Assertions.assertEquals(BigDecimal.valueOf(123.12), offer.getTotalPrice());
    }

    @Test
    @Order(2)
    void shouldFindAndMapOfferToDto() {
        //when
        OfferShortInfoDto offer = offerFacade.findOfferByOfferName("TestOfferName");
        //then
        Assertions.assertEquals("TestOfferName", offer.getOfferName());
        Assertions.assertEquals(BigDecimal.valueOf(123.12), offer.getTotalPrice());
    }


}