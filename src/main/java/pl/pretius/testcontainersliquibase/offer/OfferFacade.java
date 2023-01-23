package pl.pretius.testcontainersliquibase.offer;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class OfferFacade {

    private final OfferRepository offerRepository;

    @Transactional
    public OfferShortInfoDto createOffer(String offerName,
                                         String productName,
                                         BigDecimal productPrice) {

        Offer offer = new Offer(
                null,
                offerName,
                List.of(
                        new Product(null, null, productName, productPrice)
                )

        );

        offerRepository.save(offer);
        offerRepository.saveProducts(offer);

        return new OfferShortInfoDto(offer.getOfferName(), offer.countTotalPrice());
    }

    @Transactional(readOnly = true)
    public OfferShortInfoDto findOfferByOfferName(String offerName) {
        Offer offerByOfferName = offerRepository.findOfferByOfferName(offerName);
        return Optional.ofNullable(offerByOfferName)
                .map(offer -> new OfferShortInfoDto(offer.getOfferName(), offer.countTotalPrice()))
                .orElse(null);

    }
}
