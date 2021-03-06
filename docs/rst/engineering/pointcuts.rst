#########
Pointcuts
#########

Actor creation pointcuts
========================

Pointcut for the ``actorOf(..)`` method in ``ActorRefFactory`` implementations, extracting the ``Props`` being used::

    private static pointcut unnamedActorOf(Props props) :
        execution(* akka.actor.ActorRefFactory+.actorOf(*)) && args(props);


Pointcut for the ``actorOf(..)`` method in ``ActorRefFactory`` implementations where actor is named on creation, extracting the ``Props`` being used, and the ``String`` name of the actor::

    private static pointcut namedActorOf(Props props) :
        execution(* akka.actor.ActorRefFactory+.actorOf(*,*)) && args(props, *);


Public pointcut for exposing ``Props`` obtained from ``actorOf(..)`` methods in ``ActorRefFactory`` implementations, whether new actor is named or not.::

    static pointcut anyActorOf(Props props) : namedActorOf(props) || unnamedActorOf(props);


Actor death pointcuts
=====================

Pointcut for ``ActorCell.stop(actor)``, extracting the ``ActorRef`` of the actor being stopped::

    static pointcut actorCellStop(ActorRef actor) :
        execution(* akka.actor.ActorCell.stop(..)) && args(actor);


Pointcut for ``ActorCell.stop()``, extracting the ``ActorCell`` whose ``stop()`` method is being executed::

    static pointcut actorCellInternalStop(ActorCell actorCell) :
        target(actorCell) &&
            execution(* akka.actor.ActorCell.stop());


Receive message pointcuts
=========================

Pointcut for ``ActorCell.receiveMessage(msg)``, extracting the ``ActorCell`` receiving the message, and the ``Object`` message being received::

    static pointcut actorCellReceiveMessage(ActorCell actorCell, Object msg) :
        target(actorCell) &&
            call(* akka.actor.ActorCell.receiveMessage(..)) && args(msg);


Failure pointcuts
=================

Pointcut for ``ActorCell.handleInvokeFailure(_, failure)``, extracting the ``ActorCell`` handling the failure, and the ``Throwable`` cause of the failure::

    static pointcut actorCellHandleInvokeFailure(ActorCell actorCell, Throwable failure) :
        target(actorCell) &&
            execution(* akka.actor.ActorCell.handleInvokeFailure(..))
                && args(*, failure);

EventStream pointcuts
=====================

Pointcut for the ``EventStream.publish(event)`` method, extracting just the ``Object`` event::

    static pointcut eventStreamPublish(Object event) :
        execution(* akka.event.EventStream.publish(..)) && args(event);



References
==========

http://eclipse.org/aspectj/doc/next/quick5.pdf A cheatsheet for AspectJ syntax.