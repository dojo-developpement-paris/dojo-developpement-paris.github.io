package com.arolla.legacy.testing.quotebot;

import com.arolla.legacy.testing.thirdparty.quotebot.MarketStudyVendor;
import com.arolla.legacy.testing.thirdparty.quotebot.QuotePublisher;
import org.assertj.core.data.Offset;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.mockito.Mockito;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.doReturn;

class BlogAuctionTaskTest {


    class TestableBlogAuctionTask extends BlogAuctionTask {

        private final QuotePublisher quotePublisher;
        private final long elapsedTime;

        TestableBlogAuctionTask(QuotePublisher quotePublisher,
                                MarketStudyVendor marketStudyVendor,
                                long elapsedTime) {
            super(marketStudyVendor);
            this.quotePublisher = quotePublisher;
            this.elapsedTime = elapsedTime;
        }

        @Override
        QuotePublisher getQuotePublisher() {
            return quotePublisher;
        }

        @Override
        long getElapsedTime() {
            return elapsedTime;
        }
    }

    @ParameterizedTest
    @CsvSource({
        "42, 0, SLOW, 264.59999999999997",
        "42, 0, MEDIUM, 529.1999999999999",
        "42, 0, FAST, 1058.3999999999999",
        "42, 0, ULTRAFAST, 1719.8999999999999",
        "42, 0, UNTRUCAUHASARD, 132.29999999999998",
        "42, 0.5, SLOW, 264.59999999999997",
        "42, 0.5, MEDIUM, 529.1999999999999",
        "42, 0.5, FAST, 1058.3999999999999",
        "42, 0.5, ULTRAFAST, 1719.8999999999999",
        "42, 0.5, UNTRUCAUHASARD, 132.29999999999998",
        "42, 1, SLOW, 6.28",
        "42, 1, MEDIUM, 6.28",
        "42, 1, FAST, 6.28",
        "42, 1, ULTRAFAST, 6.28",
        "42, 1, UNTRUCAUHASARD, 6.28",
        "42, 2, SLOW, 264.59999999999997",
        "42, 2, MEDIUM, 529.1999999999999",
        "42, 2, FAST, 1058.3999999999999",
        "42, 2, ULTRAFAST, 1719.8999999999999",
        "42, 2, UNTRUCAUHASARD, 132.29999999999998",
        "42, 3, SLOW, 12.56",
        "42, 3, MEDIUM, 12.56",
        "42, 3, FAST, 12.56",
        "42, 3, ULTRAFAST, 12.56",
        "42, 3, UNTRUCAUHASARD, 12.56",
        "24, 0.5, SLOW, 151.2",
        "24, 0.5, MEDIUM, 302.4",
        "24, 0.5, FAST, 604.8",
        "24, 0.5, ULTRAFAST, 982.8",
        "24, 0.5, UNTRUCAUHASARD, 75.6",
    })
    void nonRegPriceAndPublishGoldenMasterImpl(long elapsedTime, double averagePrice, String mode, double expected) {
        final List<Double> args = new ArrayList<>();
        QuotePublisher quotePublisher = new QuotePublisher() {
            @Override
            public void publish(double todayPrice) {
                args.add(todayPrice);
            }
        };

        MarketStudyVendor marketStudyVendor = Mockito.mock(MarketStudyVendor.class);

        doReturn(averagePrice).when(marketStudyVendor)
                              .averagePrice(anyString());

        TestableBlogAuctionTask testableBlogAuctionTask =
            new TestableBlogAuctionTask(quotePublisher, marketStudyVendor,elapsedTime);

        testableBlogAuctionTask.PriceAndPublish("TechCrunch", mode);

        assertThat(args).hasSize(1);
        assertThat(args.get(0)).isEqualTo(expected, Offset.offset(1E-14));
    }

    @Test
    void givenEvenAveragePriceShouldReturnAveragePriceTimesVWRate() {

    }
}
