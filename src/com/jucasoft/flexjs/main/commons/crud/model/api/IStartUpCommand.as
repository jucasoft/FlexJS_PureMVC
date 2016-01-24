/**
 * Created with IntelliJ IDEA.
 * User: Luca
 * Date: 10/04/14
 * Time: 12.04
 */
package com.jucasoft.flexjs.main.commons.crud.model.api {
public interface IStartUpCommand {

    function setCommand(value:Class):IStartUpCommand;

    function setEntityName(value:String):IStartUpCommand;

    function setProxy(value:Class):IStartUpCommand;

}
}
