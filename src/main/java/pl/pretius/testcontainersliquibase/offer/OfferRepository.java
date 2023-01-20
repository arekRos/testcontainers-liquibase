package pl.pretius.testcontainersliquibase.offer;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;

@Mapper
interface OfferRepository {

    @Insert("INSERT INTO OFFERS (offer_name) VALUES (#{offer.offerName});")
    @Options(useGeneratedKeys = true, keyProperty = "offer.id")
    void save(@Param("offer") Offer offer);


    void saveProducts(@Param("offer") Offer offer);

    Offer findOfferByOfferName(@Param("offerName") String offerName);

}
