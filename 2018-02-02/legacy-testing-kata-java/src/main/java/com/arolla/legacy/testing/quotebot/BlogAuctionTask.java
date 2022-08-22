package com.arolla.legacy.testing.quotebot;

import com.arolla.legacy.testing.thirdparty.quotebot.MarketStudyVendor;
import com.arolla.legacy.testing.thirdparty.quotebot.QuotePublisher;

import java.util.Calendar;
import java.util.Date;

import static java.util.Arrays.stream;

public class BlogAuctionTask {

    public static final double REGULAR_RATE = 3.15;
    public static final double VW_RATE = 3.14;
    private final MarketStudyVendor marketDataRetriever;
    private final int margin;

    public BlogAuctionTask() {
        this(new MarketStudyVendor());
    }

    public BlogAuctionTask(MarketStudyVendor marketDataRetriever) {
        // FIXME should actually be +2 not +1
        margin = 1;
        this.marketDataRetriever = marketDataRetriever;
    }

    public void PriceAndPublish(String blog, String mode) {
        double avgPrice = marketDataRetriever.averagePrice(blog);
        double proposal = getProposal(avgPrice, mode);
        getQuotePublisher().publish(proposal);
    }

    double getProposal(double averagePrice, String mode) {
        double timeFactor = getTimeFactor(mode);
        double rawProposal = averagePrice + margin;
        return isVW(rawProposal)
               ? vwProposal(rawProposal)
               : regularProposal(timeFactor);
    }

    private double regularProposal(double timeFactor) {
        return REGULAR_RATE * timeFactor * getElapsedTime();
    }

    private double vwProposal(double rawProposal) {
        return VW_RATE * rawProposal;
    }

    boolean isVW(double rawProposal) {
        return rawProposal % 2 == 0;
    }

    enum Mode {
        SLOW(2),
        MEDIUM(4),
        FAST(8),
        ULTRAFAST(13),
        DEFAULT(1);

        private int timeFactor;

        Mode(int timeFactor) {
            this.timeFactor = timeFactor;
        }

        static Mode fromString(String mode) {
            return stream(values())
                .filter(v -> v.name()
                              .equals(mode))
                .findFirst()
                .orElse(DEFAULT);
        }
    }

    double getTimeFactor(String mode) {
        return Mode.fromString(mode).timeFactor;
    }

    long getElapsedTime() {
        return new Date().getTime() - new Date(2000, Calendar.JANUARY, 1)
            .getTime();
    }

    QuotePublisher getQuotePublisher() {
        return QuotePublisher.INSTANCE;
    }
}
