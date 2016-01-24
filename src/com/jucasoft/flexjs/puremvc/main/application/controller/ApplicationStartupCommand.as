/* 
 PureMVC Flex/WebORB Demo – Login 
 Copyright (c) 2007 Jens Krause <jens.krause@puremvc.org> <www.websector.de>
 Your reuse is governed by the Creative Commons Attribution 3.0 License
 */
package com.jucasoft.flexjs.puremvc.main.application.controller {

import com.jucasoft.flexjs.puremvc.user.controller.UserStartUpCommand;

import org.puremvc.as3.multicore.patterns.command.MacroCommand;

public class ApplicationStartupCommand extends MacroCommand {
    /**
     * Adds subcommands to execute in a special order
     *
     */
    override protected function initializeMacroCommand():void {
        trace('aaaaaaaaaaaaa');
        super.addSubCommand(UserStartUpCommand);
    }
}
}