package org.eigengo.monitor.agent.akka;

import akka.actor.ActorCell;

public aspect MessageMonitoringAspect extends AbstractMonitoringAspect {

    before(ActorCell actorCell, Object msg): Pointcuts.receiveMessage(actorCell, msg) {
        counterInterface.incrementCounter("message." + msg.getClass().getSimpleName());
    }

}