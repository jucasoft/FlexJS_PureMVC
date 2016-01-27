package com.jucasoft.dashstats.application.controller {

import com.jucasoft.dashstats.home.controller.HomeStartUpCommand;
import com.jucasoft.dashstats.home.controller.HomeViewStartUpCommand;
import com.jucasoft.dashstats.user.controller.UserStartUpCommand;
import com.jucasoft.dashstats.user.controller.UserViewStartUpCommand;

import org.puremvc.as3.multicore.patterns.command.MacroCommand;

public class MainStartUpMacroCommand extends MacroCommand {
    /**
     * Adds subcommands to execute in a special order
     *
     */
    override protected function initializeMacroCommand():void {
        trace('MainStartUpMacroCommand.initializeMacroCommand()');
        super.addSubCommand(UserStartUpCommand);
        super.addSubCommand(UserViewStartUpCommand);

        super.addSubCommand(HomeStartUpCommand);
        super.addSubCommand(HomeViewStartUpCommand);
    }
}
}