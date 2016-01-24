package com.jucasoft.flexjs.main.commons.crud {

public class StateEnums {

    /**
     * pagina bianca iniziale.
     */
    public static const BLANK:int = 0;

    /**
     * ricerca
     */
    public static const SEARCH:int = 1;

    /**
     * risultato della ricerca.
     */
    public static const SEARCH_RESULT:int = 5;

    /**
     * dettaglio in fase di creazione.
     */
    public static const CREATE:int = 2;

    /**
     * dettaglio con dati modificati, quindi in modifica.
     */
    public static const EDIT:int = 4;

    /**
     * dettaglio visualizzazione.
     */
    public static const DETAIL:int = 3;

    /**
     * lo stato è cambiato.
     */
    public static const CHANGED:int = 6;
}

}
