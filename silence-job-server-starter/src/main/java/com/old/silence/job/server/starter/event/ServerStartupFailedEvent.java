package com.old.silence.job.server.starter.event;

import org.springframework.context.ApplicationEvent;

/**
 * @author moryzang
 */
public class ServerStartupFailedEvent extends ApplicationEvent {
    public ServerStartupFailedEvent(Object source) {
        super(source);
    }
}