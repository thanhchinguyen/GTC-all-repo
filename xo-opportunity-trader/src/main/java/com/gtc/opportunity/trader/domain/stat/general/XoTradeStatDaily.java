package com.gtc.opportunity.trader.domain.stat.general;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

/**
 * Created by Valentyn Berezin on 26.02.18.
 */
@Entity
@DiscriminatorValue("DAILY")
public class XoTradeStatDaily extends BaseXoTradeStat {
}
