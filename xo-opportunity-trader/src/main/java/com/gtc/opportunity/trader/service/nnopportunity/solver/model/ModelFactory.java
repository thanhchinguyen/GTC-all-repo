package com.gtc.opportunity.trader.service.nnopportunity.solver.model;

import com.gtc.opportunity.trader.service.nnopportunity.dto.Snapshot;
import com.gtc.opportunity.trader.service.opportunity.creation.ConfigCache;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * Created by Valentyn Berezin on 29.07.18.
 */
@Service
@RequiredArgsConstructor
public class ModelFactory {

    private final FeatureMapper mapper;
    private final ConfigCache cache;

    public NnModelPredict buildModel(Snapshot snapshot) throws NnModelPredict.TrainingFailed {
        String oldName = Thread.currentThread().getName();
        Thread.currentThread().setName(String.format(
                "Build model %s-%s->%s",
                snapshot.getKey().getClient(),
                snapshot.getKey().getPair().getFrom().getCode(),
                snapshot.getKey().getPair().getTo().getCode()));
        try {
            return new NnModelPredict(cache.requireConfig(snapshot), snapshot, mapper);
        } finally {
            Thread.currentThread().setName(oldName);
        }
    }
}